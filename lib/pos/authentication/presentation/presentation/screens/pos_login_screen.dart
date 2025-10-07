import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/mixins/dialog_mixin.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/pages/widgets/login_form.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PosLoginScreen extends StatelessWidget with DialogMixin {
  const PosLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            // BlocListener<AccessValidationBloc, AccessValidationState>(
            //   listener: (context, state) {
            //     state.maybeWhen(
            //       denied: (message) {
            //         PageLoader.close();
            //         showCustomDialog(
            //           context,
            //           barrierColor: Colors.black12,
            //           dialog: Dialog(
            //             shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
            //             backgroundColor: UIColors.background,
            //             child: Container(
            //               constraints: const BoxConstraints(maxWidth: 500),
            //               padding: const EdgeInsets.all(20),
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   const Icon(Icons.no_accounts),
            //                   const UIVerticalSpace(14),
            //                   UIText.heading5('Access Denied', align: TextAlign.center),
            //                   const UIVerticalSpace(4),
            //                   UIText.bodyRegular(message, align: TextAlign.center),
            //                   const UIVerticalSpace(20),
            //                   UIButton.text('Okay', onClick: () => Navigator.pop(context)),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //       orElse: () {},
            //     );
            //   },
            //   child:
            Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: UIColors.borderMuted),
          ),
          child: const LoginForm(isCentered: true),
        ),
      ),
      // ),
    );
  }
}
