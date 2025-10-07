import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/bloc/purchase_order_bloc/purchase_order_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order_form/new_purchase_order_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_form_cubit/purchase_order_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_form/purchase_order_form.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_form/purchase_order_stepper.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_form/widgets/purchase_order_form_header.dart';

class PurchaseOrderDetailsPage extends StatelessWidget {
  const PurchaseOrderDetailsPage({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewPurchaseOrderFormCubit()),
        BlocProvider(create: (context) => GetIt.I<PurchaseOrderBloc>())
      ],
      child: _PurchaseOrderDetailsPage(id: id),
    );
  }
}

class _PurchaseOrderDetailsPage extends StatefulWidget {
  const _PurchaseOrderDetailsPage({this.id});

  final String? id;

  @override
  State<_PurchaseOrderDetailsPage> createState() => _PurchaseOrderDetailsPageState();
}

class _PurchaseOrderDetailsPageState extends State<_PurchaseOrderDetailsPage> {
  late final PurchaseOrderFormCubit _formCubit;
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();

    _formCubit = context.read<PurchaseOrderFormCubit>();

    if (_isEditMode) {
      final id = int.parse(widget.id!);
      context.read<PurchaseOrderBloc>().add(PurchaseOrderEvent.getPurchaseOrderById(id));
    } else {
      _formCubit.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PurchaseOrderBloc, PurchaseOrderState>(
      listener: (context, state) {
        state.maybeWhen(
          creating: () => PageLoader.show(context),
          created: (po) => _onCreated(po),
          loaded: (po) => _onLoaded(po),
          updating: () => PageLoader.show(context),
          markingAsShippedWithNewItems: () => PageLoader.show(context),
          markingAsShipped: () => PageLoader.show(context),
          markingAsReceived: () => PageLoader.show(context),
          cancelling: () => PageLoader.show(context),
          deleting: () => PageLoader.show(context),
          updated: (po) => _onSuccess(po),
          deleted: () => _onDeleted(),
          failure: (_) => PageLoader.close(),
          orElse: () => {},
        );
      },
      builder: (context, state) => state.maybeWhen(
        initial: () => _isEditMode ? const LoadingView() : const PurchaseOrderStepper(currentStep: 0),
        loading: () => const LoadingView(),
        loadFailed: (message) => FailureView(message),
        orElse: () {
          return _isPurchaseOrderCancelled
              ? const SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PurchaseOrderFormHeader(),
                      PurchaseOrderForm(),
                    ],
                  ),
                )
              : PurchaseOrderStepper(currentStep: _currentStep);
        },
      ),
    );
  }

  bool get _isEditMode => widget.id != null;

  bool get _isPurchaseOrderCancelled => _currentStep == -1;

  void _onCreated(PurchaseOrder po) {
    PageLoader.close();
    _updateCurrentStepToEdit();
    final poId = po.id!;
    context.goNamed(
      'purchaseOrderDetails',
      pathParameters: {'id': poId.toString()},
    );
    // Since we are in the same page, initState does not get triggered again so we need to call the request again here
    context.read<PurchaseOrderBloc>().add(PurchaseOrderEvent.getPurchaseOrderById(poId));

    // Reload list
    context.read<PaginatedListBloc<PurchaseOrder>>().add(const PaginatedListEvent.fetch());
  }

  void _onLoaded(PurchaseOrder po) {
    _updateCurrentStepByStatus(po);
    _formCubit.loadPurchaseOrder(po);
  }

  void _onSuccess(PurchaseOrder po) {
    PageLoader.close();
    _updateCurrentStepByStatus(po);
    _formCubit.loadPurchaseOrder(po);
    SnackbarUtil.success(context, 'Purchase Order updated successfully.');

    // Reload list
    context.read<PaginatedListBloc<PurchaseOrder>>().add(const PaginatedListEvent.fetch());
  }

  void _onDeleted() {
    PageLoader.close();
    context.goNamed('purchaseOrderList');
    SnackbarUtil.success(context, 'Purchase Order deleted successfully.');

    // Reload list
    context.read<PaginatedListBloc<PurchaseOrder>>().add(const PaginatedListEvent.fetch());
  }

  void _updateCurrentStepToEdit() => setState(() => _currentStep = 1);

  void _updateCurrentStepByStatus(PurchaseOrder po) {
    setState(() {
      if (po.status == StockOrderStatus.NEW) {
        _currentStep = 1;
      } else if (po.status == StockOrderStatus.FOR_RECEIVING) {
        _currentStep = 2;
      } else if (po.status == StockOrderStatus.COMPLETED) {
        _currentStep = 3;
      } else if (po.status == StockOrderStatus.CANCELLED) {
        _currentStep = -1;
      }
    });
  }
}
