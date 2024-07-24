import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/register_repository.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionsPage extends StatefulWidget {
  static String route = '/point-of-sale/transactions';

  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  void initState() {
    super.initState();
    if (context.read<RegisterCubit>().state.register == null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return Dialog(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: Container(
                    color: UIColors.background,
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        UIText.heading5('POS Register'),
                        const Divider(color: UIColors.borderMuted),
                        const UIVerticalSpace(16),
                        Text('Please choose the register you need to use', style: UIStyleText.bodyRegular),
                        const UIVerticalSpace(30),
                        SearchDropdown<Register>.single(
                          hint: 'Select a register',
                          label: 'Register',
                          itemAsString: (register) => register.name!,
                          asyncItemsCallback: GetIt.I<RegisterRepository>().getAllRegisters(),
                          onSelectItem: (value) => context.read<RegisterCubit>().setRegister(value),
                        ),
                        const UIVerticalSpace(30),
                        if (state.error != null) UIText.labelSemiBold(state.error!, color: UIColors.buttonDanger),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: UIButton.filled(
                            'Confirm',
                            onClick: () {
                              if (state.register != null) {
                                Navigator.pop(context);
                              } else {
                                context.read<RegisterCubit>().setRegister(null);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Transactions'),
      ],
    );
  }
}
