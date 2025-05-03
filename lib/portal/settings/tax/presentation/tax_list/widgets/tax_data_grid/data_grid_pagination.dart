import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/extensions/extensions.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax_list_bloc/tax_list_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class DataGridPagination<T> extends StatelessWidget {
  const DataGridPagination(this.data, {super.key});

  final PaginatedList<T> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UIPopupMenuButton.textIcon(
          title: '${data.currentSize} rows',
          iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
          onSelect: (value) => _onChangedRowsPerPage(value),
          menu: const [20, 50, 100],
          menuAsString: (menu) => menu.toString(),
        ),
        const UIHorizontalSpace(16),
        UIText.labelMedium(data.pageRecordsCount, color: UIColors.textLight),
        const Spacer(),
        UIText.labelMedium(data.pageInfo, color: UIColors.textLight),
        const UIHorizontalSpace(16),
        IconButton(
          onPressed: _onGoToFirstPage,
          icon: Assets.icons.firstPage.svg(colorFilter: _pageIconColor(data.isOnFirstPage)),
        ),
        IconButton(
          onPressed: _onGoToPrevious,
          icon: Assets.icons.arrowLeft.svg(colorFilter: _pageIconColor(data.isOnFirstPage)),
        ),
        IconButton(
          onPressed: _onGoToNext,
          icon: Assets.icons.arrowRight.svg(colorFilter: _pageIconColor(data.isOnLastPage)),
        ),
        IconButton(
          onPressed: _onGoToLastPage,
          icon: Assets.icons.lastPage.svg(colorFilter: _pageIconColor(data.isOnLastPage)),
        ),
      ],
    );
  }

  void _onGetTaxCodes(BuildContext context, {int? page, int? size}) {
    context.read<TaxListBloc>().add(TaxListEvent.getTaxCodes(page: page, size: size));
  }

  void _onChangedRowsPerPage(int rowsPerPage) {
    /// Go back to page 1 when:
    ///  - total count is greater than the requested rows per page
    ///  - requested rows per page will not have data anymore in the upcoming page to request
    /// Example:
    /// Previous list is 20 rows per page and have a total of 5 pages,
    ///  when user now requests to have 100 rows per page, and the total page becomes less than 5,
    ///  the next response will be an empty list.
    /// To avoid, use the [totalPage], [totalCount] and the [rowsPerPage] selected to check
    ///  if the page to pass in the request will be greater than the [totalPage] of our data.
    /// If it is greater than the actual total page, then reset it to 1.
    if (data.totalCount <= rowsPerPage || data.totalPages + 1 > ((data.totalCount + (rowsPerPage - 1)) / rowsPerPage)) {
      _onGetTaxCodes(page: 1, size: rowsPerPage);
    } else {
      _onGetTaxCodes(page: data.currentPage, size: rowsPerPage);
    }
  }

  void _onGoToFirstPage() {
    if (data.isNotOnFirstPage) _onGetTaxCodes(page: data.firstPage, size: data.currentSize);
  }

  void _onGoToPrevious() {
    if (data.isNotOnFirstPage) _onGetTaxCodes(page: data.previousPage, size: data.currentSize);
  }

  void _onGoToNext() {
    if (data.isNotOnLastPage) _onGetTaxCodes(page: data.nextPage, size: data.currentSize);
  }

  void _onGoToLastPage() {
    if (data.isNotOnLastPage) _onGetTaxCodes(page: data.lastPage, size: data.currentSize);
  }

  ColorFilter _pageIconColor(bool isMuted) => (isMuted ? UIColors.textMuted : UIColors.textRegular).toColorFilter;
}
