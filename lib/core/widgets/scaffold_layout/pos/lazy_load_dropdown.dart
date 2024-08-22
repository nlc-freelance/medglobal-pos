import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/data/api/register_api.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift/register.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift/register_shift.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class LazyLoadDropdown extends StatefulWidget {
  const LazyLoadDropdown({super.key});

  @override
  LazyLoadDropdownState createState() => LazyLoadDropdownState();
}

class LazyLoadDropdownState extends State<LazyLoadDropdown> {
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _menuKey = GlobalKey();

  late OverlayEntry _overlayEntry;
  bool _isOverlayVisible = false;

  final LayerLink _layerLink = LayerLink();

  String? _selectedItem;

  @override
  void initState() {
    super.initState();

    // _focusNode.addListener(() {
    //   if (!_focusNode.hasFocus) {
    //     //   this._overlayEntry = this._createOverlayEntry();
    //     //   Overlay.of(context).insert(this._overlayEntry);
    //     // } else {
    //     this._overlayEntry.remove();
    //   }
    // });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _createOverlayEntry() {
    if (_isOverlayVisible) return;

    final RenderBox? renderBox = _menuKey.currentContext?.findRenderObject() as RenderBox?;
    var size = renderBox?.size;

    final overlay = Overlay.of(context);

    _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
              width: size?.width,
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, size!.height + 5.0),
                child: LazyLoadListPage<Register>(
                  dataFetcher: DataFetcher<Register>((page) => GetIt.I<RegisterApi>().getRegisters(page)),
                  itemAsString: (item) => item.name!,
                  onChanged: (item) {
                    print(item.name);
                    if (!_isOverlayVisible) return;
                    this._overlayEntry.remove();

                    setState(() {
                      _isOverlayVisible = false;
                      _selectedItem = item.name;
                    });

                    context.read<RegisterCubit>().setRegister(item);

                    RegisterShift? shiftDetail = item.shiftDetail;

                    if (shiftDetail != null) {
                      if (shiftDetail.status == 'open') {
                        context.read<RegisterShiftBloc>().add(SetShiftAsOpenOnLoginEvent(shiftDetail: shiftDetail));
                      }
                      if (shiftDetail.status == 'close') {
                        context.read<RegisterShiftBloc>().add(SetShiftAsClosedOnLoginEvent(shiftDetail: shiftDetail));
                      }
                    } else {
                      context.read<RegisterShiftBloc>().add(SetShiftAsClosedOnFirstTimeEvent());
                    }
                  },
                ),
              ),
            ));

    overlay.insert(_overlayEntry);
    setState(() {
      _isOverlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      key: _menuKey,
      link: this._layerLink,
      child: InputDecorator(
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
          hintText: 'Select branch',
          filled: true,
          fillColor: UIColors.background,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: UIColors.borderRegular),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                _createOverlayEntry();
              },
              child: _selectedItem != null
                  ? Text(_selectedItem!, style: UIStyleText.chip)
                  : Text('Select branch', style: UIStyleText.hint),
            ),
            InkWell(
              onTap: () {
                if (_overlayEntry.mounted) {
                  if (!_isOverlayVisible) return;
                  this._overlayEntry.remove();

                  setState(() {
                    _isOverlayVisible = false;
                  });
                }
              },
              child: Assets.icons.arrowDown.svg(),
            ),
          ],
        ),
      ),
    );
  }
}

// Define a generic data fetcher
class DataFetcher<T> {
  final Future<List<T>> Function(int page) fetchItems;

  DataFetcher(this.fetchItems);
}

class LazyLoadListPage<T> extends StatefulWidget {
  final DataFetcher<T> dataFetcher;
  final String Function(T item) itemAsString;
  final String emptyMessage;
  final Function(T item) onChanged;

  const LazyLoadListPage({
    required this.dataFetcher,
    required this.itemAsString,
    required this.onChanged,
    this.emptyMessage = 'No data available',
    super.key,
  });

  @override
  LazyLoadListPageState<T> createState() => LazyLoadListPageState<T>();
}

class LazyLoadListPageState<T> extends State<LazyLoadListPage<T>> {
  final List<T> _items = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  String? error;

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final newItems = await widget.dataFetcher.fetchItems(_currentPage);
      setState(() {
        _currentPage++;
        _isLoading = false;
        if (newItems.isEmpty) {
          _hasMore = false;
        } else {
          _items.addAll(newItems);
        }
      });
    } catch (e) {
      // Handle the error here
      print('Error fetching items: $e');
      setState(() {
        _isLoading = false;
        error = e.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // final registers = context.read<RegisterDropdownCubit>().state.registers;
    _loadMore(); // Initial load
  }

  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
      onEndOfPage: _loadMore,
      child: _items.isEmpty
          ? Material(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Center(child: Text(error != null ? error! : widget.emptyMessage)))
          : Material(
              child: Container(
                color: UIColors.borderMuted,
                // height: 160,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _items.length + 1, // Add one more for the loading indicator
                  itemBuilder: (context, index) {
                    if (index == _items.length) {
                      return _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : const SizedBox.shrink(); // Empty widget if no more data
                    }

                    return Material(
                      color: UIColors.background,
                      child: InkWell(
                        onTap: () => widget.onChanged(_items[index]),
                        hoverColor: UIColors.whiteBg,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Text(widget.itemAsString(_items[index]), style: UIStyleText.chip),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
