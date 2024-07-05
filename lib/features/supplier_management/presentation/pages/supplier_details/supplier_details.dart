import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/cubit/supplier/supplier_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/pages/supplier_details/widgets/general_information.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/pages/supplier_details/widgets/address_information.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/pages/supplier_details/widgets/contact_information.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/pages/supplier_details/widgets/supplier_actions.dart';

class SupplierDetails extends StatefulWidget {
  const SupplierDetails(this.dialogContext, {super.key, this.supplier});

  final Supplier? supplier;
  final BuildContext dialogContext;

  @override
  State<SupplierDetails> createState() => _SupplierDetailsState();
}

class _SupplierDetailsState extends State<SupplierDetails> {
  late SupplierCubit _supplierCubit;

  late Supplier? _supplier;

  late TextEditingController _supplierNameController;

  late TextEditingController _mainContactNameController;
  late TextEditingController _faxController;
  late TextEditingController _emailController;
  late TextEditingController _websiteController;
  late TextEditingController _phoneController;

  late TextEditingController _address1Controller;
  late TextEditingController _address2Controller;
  late TextEditingController _cityController;
  late TextEditingController _provinceController;
  late TextEditingController _postalCodeController;
  late TextEditingController _countryController;

  @override
  void initState() {
    super.initState();
    _supplierCubit = BlocProvider.of<SupplierCubit>(context);

    _supplier = widget.supplier;

    _supplierNameController = TextEditingController(text: _supplier?.name)..addListener(() => setState(() {}));
    _mainContactNameController = TextEditingController(text: _supplier?.mainContactName);
    _faxController = TextEditingController(text: _supplier?.fax);
    _emailController = TextEditingController(text: _supplier?.email);
    _websiteController = TextEditingController(text: _supplier?.website);
    _phoneController = TextEditingController(text: _supplier?.phone);

    _address1Controller = TextEditingController(text: _supplier?.street1);
    _address2Controller = TextEditingController(text: _supplier?.street2);
    _cityController = TextEditingController(text: _supplier?.city);
    _provinceController = TextEditingController(text: _supplier?.state);
    _postalCodeController = TextEditingController(text: _supplier?.zipCode);
    _countryController = TextEditingController(text: _supplier?.country);
  }

  @override
  void dispose() {
    _supplierNameController.dispose();

    _mainContactNameController.dispose();
    _faxController.dispose();
    _emailController.dispose();
    _websiteController.dispose();
    _phoneController.dispose();

    _address1Controller.dispose();
    _address2Controller.dispose();
    _cityController.dispose();
    _provinceController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener<SupplierCubit, SupplierState>(
        listener: (context, state) {
          if (state is! SupplierSaveLoading && state is! SupplierDeleteLoading) closeDialog();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralInformation(isSupplierNew, supplierNameController: _supplierNameController),
            ContactInformation(
              mainContactNameController: _mainContactNameController,
              faxController: _faxController,
              emailController: _emailController,
              websiteController: _websiteController,
              phoneController: _phoneController,
            ),
            AddressInformation(
              address1Controller: _address1Controller,
              address2Controller: _address2Controller,
              cityController: _cityController,
              provinceController: _provinceController,
              postalCodeController: _postalCodeController,
              countryController: _countryController,
            ),
            const Spacer(),
            SupplierActions(
              isSupplierExisting: isSupplierExisting,
              isSupplierValid: isSupplierValid,
              onDelete: onDeleteSupplier,
              onSave: onSaveSupplier,
              onCancel: closeDialog,
            ),
          ],
        ),
      );

  bool get isSupplierNew => widget.supplier == null;

  bool get isSupplierExisting => !isSupplierNew;

  /// Check for supplier name(if not empty)
  /// TODO: Add email and phone checking (if valid, ***@email.com and 09** *** ****)
  bool get isSupplierValid => _supplierNameController.text.isNotEmpty;

  Supplier get newSupplier => Supplier(
        id: null,
        name: _supplierNameController.text,
        mainContactName: _mainContactNameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        fax: _faxController.text,
        website: _websiteController.text,
        street1: _address1Controller.text,
        street2: _address2Controller.text,
        city: _cityController.text,
        state: _provinceController.text,
        zipCode: _postalCodeController.text,
        country: _countryController.text,
      );

  void closeDialog() => Navigator.pop(widget.dialogContext);

  void onDeleteSupplier() => _supplierCubit.delete(_supplier!.id!);

  void onSaveSupplier() => isSupplierNew
      ? _supplierCubit.create(newSupplier)
      : _supplierCubit.update(
          _supplier!.copyWith(
            name: _supplierNameController.text,
            mainContactName: _mainContactNameController.text,
            email: _emailController.text,
            phone: _phoneController.text,
            fax: _faxController.text,
            website: _websiteController.text,
            street1: _address1Controller.text,
            street2: _address2Controller.text,
            city: _cityController.text,
            state: _provinceController.text,
            zipCode: _postalCodeController.text,
            country: _countryController.text,
          ),
        );
}
