import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RegisterDropdown extends StatefulWidget {
  final void Function(Register) onChanged;

  const RegisterDropdown({super.key, required this.onChanged});

  @override
  State<RegisterDropdown> createState() => RegisterDropdownState();
}

class RegisterDropdownState extends State<RegisterDropdown> {
  final GlobalKey _menuKey = GlobalKey();
  late ScrollController _scrollController;

  bool _isVisible = false;
  Register? _selectedItem;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    context.read<LazyListBloc<Register>>().add(const LazyListEvent<Register>.fetch());
    // context.read<RegisterLazyListCubit>().getRegisters();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
        !context.read<LazyListBloc<Register>>().state.isLoadingMore &&
        !context.read<LazyListBloc<Register>>().state.hasReachedMax) {
      // !context.read<RegisterLazyListCubit>().state.isLoadingMore &&
      // !context.read<RegisterLazyListCubit>().state.hasReachedMax) {
      context.read<LazyListBloc<Register>>().add(const LazyListEvent<Register>.fetch());
      // context.read<RegisterLazyListCubit>().getRegisters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return UIPopupMenuOverlay(
      menu: InkWell(
        key: _menuKey,
        hoverColor: UIColors.transparent,
        highlightColor: UIColors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        onTap: () => setState(() => _isVisible = true),
        child: TextFormField(
          readOnly: true,
          enabled: false,
          controller: TextEditingController(text: _selectedItem?.name),
          mouseCursor: SystemMouseCursors.click,
          showCursor: false,
          style: UIStyleText.chip.copyWith(color: UIColors.textDark),
          decoration: InputDecoration(
            hintText: 'Select register',
            suffixIcon: Assets.icons.arrowDown.svg(),
            suffixIconConstraints: const BoxConstraints.tightFor(width: 48, height: 12),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (_) {
            if (_selectedItem == null) return 'Please select a register.';
            return null;
          },
        ),
      ),
      body: BlocBuilder<LazyListBloc<Register>, LazyListState<Register>>(
        // body: BlocBuilder<RegisterLazyListCubit, RegisterLazyListState>(
        builder: (context, state) {
          double itemHeight = 40;
          double totalHeight = (state.items.isNotEmpty ? state.items.length : 3) * itemHeight;
          // double totalHeight = (state.registers.isNotEmpty ? state.registers.length : 3) * itemHeight;
          double height = totalHeight > 200 ? 200 : totalHeight;

          return Container(
            width: (_menuKey.currentContext?.findRenderObject() as RenderBox).size.width,
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
                  // if (state.INITIAL_LOADING)
                  const CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)
                else if (state.hasNoData)
                  // else if (state.EMPTY)
                  UIText.labelMedium('No data available', align: TextAlign.center)
                else if (state.error != null)
                  // else if (state.ERROR)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UIText.labelMedium(state.error!, align: TextAlign.center),
                        UIButton.text('Reload',
                            onClick: () =>
                                context.read<LazyListBloc<Register>>().add(const LazyListEvent<Register>.refresh()))
                        // UIButton.text('Reload', onClick: () => context.read<RegisterLazyListCubit>().getRegisters())
                      ],
                    ),
                  )
                else ...[
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: state.items.length,
                      // itemCount: state.registers.length,
                      itemBuilder: (context, index) {
                        return Material(
                          type: MaterialType.transparency,
                          child: ListTile(
                            onTap: () {
                              final register = state.items[index];
                              // final register = state.registers[index];

                              /// Single select
                              setState(() => _selectedItem = register);

                              widget.onChanged(register);

                              setState(() => _isVisible = false);
                            },
                            dense: true,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            title: UIText.labelMedium(state.items[index].name),
                            // title: UIText.labelMedium(state.registers[index].name),
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
                    ),
                ],
              ],
            ),
          );
        },
      ),
      visible: _isVisible,
      onClose: () => setState(() => _isVisible = false),
    );
  }
}
