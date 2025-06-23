import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class DropdownLazyList<T> extends StatefulWidget {
  const DropdownLazyList({
    super.key,
    required this.menuKey,
    required this.onChanged,
    required this.getName,
  });

  final GlobalKey menuKey;
  final void Function(T item) onChanged;
  final String Function(T item) getName;

  @override
  State<DropdownLazyList<T>> createState() => _DropdownLazyListState<T>();
}

class _DropdownLazyListState<T> extends State<DropdownLazyList<T>> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    if (!context.read<LazyListBloc<T>>().state.isLoadingMore &&
        !context.read<LazyListBloc<T>>().state.isLoadingInitial &&
        !context.read<LazyListBloc<T>>().state.hasReachedMax) {
      context.read<LazyListBloc<T>>().add(LazyListEvent<T>.fetch());
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
        !context.read<LazyListBloc<T>>().state.isLoadingMore &&
        !context.read<LazyListBloc<T>>().state.hasReachedMax) {
      context.read<LazyListBloc<T>>().add(LazyListEvent<T>.fetch());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LazyListBloc<T>, LazyListState<T>>(
      builder: (context, state) {
        double itemHeight = 40;
        double totalHeight = (state.hasNoData ? state.items.length : 3) * itemHeight;
        double height = totalHeight > 200 ? 200 : totalHeight;

        return Container(
          width: (widget.menuKey.currentContext?.findRenderObject() as RenderBox).size.width,
          height: height,
          decoration: BoxDecoration(
            color: UIColors.background,
            border: Border.all(color: UIColors.borderRegular),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.isLoadingInitial)
                const CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)
              else if (state.hasNoData)
                UIText.labelMedium('No data available', align: TextAlign.center)
              else if (state.error != null)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UIText.labelMedium(state.error!, align: TextAlign.center),
                      UIButton.text(
                        'Reload',
                        onClick: () => context.read<LazyListBloc<T>>().add(LazyListEvent<T>.refresh()),
                      ),
                    ],
                  ),
                )
              else ...[
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      return Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          onTap: () {
                            final item = state.items[index];
                            widget.onChanged(item);
                          },
                          dense: true,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          title: UIText.labelMedium(widget.getName(state.items[index])),
                        ),
                      );
                    },
                  ),
                ),
                if (!state.hasReachedMax && state.isLoadingMore)
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
                    ),
                  )
              ],
            ],
          ),
        );
      },
    );
  }
}
