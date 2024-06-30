import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/entities/category.dart';
import '../../../../bloc/category/category_bloc.dart';
import '../../../widgets/add_category_dropdown_option.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CategoryDropdown extends StatefulWidget {
  final void Function(Category value) onItemSelect;

  const CategoryDropdown({super.key, required this.onItemSelect});

  @override
  State<CategoryDropdown> createState() => _UIDropdownState();
}

class _UIDropdownState extends State<CategoryDropdown> {
  late TextEditingController _menucontroller;
  late TextEditingController _searchcontroller;
  late ScrollController _scrollController;
  late CategoryBloc _categoryBloc;
  final GlobalKey _key = GlobalKey();

  bool _showDropdown = false;
  double menuWidth = 0;
  List<Category> items = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
      menuWidth = renderBox.size.width;
    });

    _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _categoryBloc.add(const GetCategories());

    _menucontroller = TextEditingController();

    /// TODO: Search feature
    _searchcontroller = TextEditingController();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _menucontroller.dispose();
    _searchcontroller.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _categoryBloc.add(const GetCategories(isLoadMore: true));
    }
  }

  void onItemSelect(Category value) {
    widget.onItemSelect(value);
    setState(() {
      _menucontroller.text = value.name;
      _showDropdown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listenWhen: (previous, current) => current is CategoryActionSuccess || current is CategoryListLoaded,
      listener: (context, state) {
        if (state is CategoryListLoaded) setState(() => items = state.categories);
      },
      builder: (context, state) {
        return UIPopupMenuOverlay(
          menu: GestureDetector(
            onTap: () => setState(() => _showDropdown = true),
            child: UIDropdownButton.topLabelReadOnly(
              key: _key,
              controller: _menucontroller,
              hint: 'Select category',
              label: 'Category',
            ),
          ),
          body: Container(
            width: menuWidth,
            constraints: const BoxConstraints(maxHeight: 280),
            margin: const EdgeInsets.only(top: 4.0),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: UIColors.background,
              border: Border.all(color: UIColors.borderMuted),
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AddCategoryDropdownOption(
                  onAddCategory: (value) => setState(() {
                    _menucontroller.text = value.name;
                    items.add(value);
                  }),
                ),
                // TODO: Search functionality
                //   Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //     child: UITextField.noLabel(controller: _searchcontroller),
                //   ),
                if (items.isNotEmpty)
                  Expanded(
                    child: Material(
                      type: MaterialType.transparency,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        controller: _scrollController,
                        itemCount: items.length,
                        itemBuilder: (_, index) => ListTile(
                          onTap: () => onItemSelect(items[index]),
                          title: UIText.bodyRegular(items[index].name),
                        ),
                      ),
                    ),
                  ),
                if (state is CategoryListLoading)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      color: UIColors.primary,
                      strokeWidth: 2,
                    ),
                  ),
                if (state is CategoryListError) Text(state.message),
              ],
            ),
          ),
          visible: _showDropdown,
          onClose: () => setState(() => _showDropdown = false),
        );
      },
    );
  }
}
