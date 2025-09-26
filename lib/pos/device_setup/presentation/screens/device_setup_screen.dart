import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/device_setup/device_setup_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/printer/printer_cubit.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/unassigned_registers/unassigned_register_list_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class DeviceSetupScreen extends StatefulWidget {
  const DeviceSetupScreen({super.key});

  @override
  State<DeviceSetupScreen> createState() => _DeviceSetupScreenState();
}

class _DeviceSetupScreenState extends State<DeviceSetupScreen> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  int _currentStep = 0;

  Register? _register;
  String? _printer;

  @override
  void initState() {
    super.initState();
    context.read<UnassignedRegisterListCubit>().fetch();
    context.read<PrinterCubit>().findPrinters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(
          child: BlocBuilder<DeviceSetupBloc, DeviceSetupState>(
            /// Avoid split second display of setup when transitioning from loading to ready
            buildWhen: (previous, current) => previous.maybeWhen(
              orElse: () => true,
              loading: () => current.maybeWhen(
                orElse: () => true,
                ready: (_) => false,
              ),
            ),
            builder: (context, state) {
              final showSettingUpPlaceholder = state.maybeWhen(
                loading: () => true,
                failure: (_) => true,
                orElse: () => false,
              );

              return showSettingUpPlaceholder
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.icons.cube.setSize(36),
                        const UIVerticalSpace(16),
                        UIText.heading5('Setting Up Your Device'),
                        const UIVerticalSpace(8),
                        UIText.bodyRegular('We\'re loading device register details and preparing your device for use.'),
                        UIText.bodyRegular('Please wait a moment.'),
                        const UIVerticalSpace(30),
                        BlocBuilder<DeviceSetupBloc, DeviceSetupState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () => const CupertinoActivityIndicator(),
                              failure: (message) => Column(
                                children: [
                                  UIText.labelMedium(message, color: UIColors.error),
                                  const UIVerticalSpace(16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      UIButton.text(
                                        'Logout',
                                        onClick: () => context.read<AuthBloc>().add(const LogoutEvent()),
                                      ),
                                      const UIHorizontalSpace(16),
                                      UIButton.outlined(
                                        'Try again',
                                        onClick: () {
                                          context.read<DeviceSetupBloc>().add(const DeviceSetupEvent.rebind());
                                          setState(() => _currentStep = 0);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              orElse: () => const SizedBox.shrink(),
                            );
                          },
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   'Let\'s Get Started',
                        //   style: UIStyleText.headline.copyWith(fontSize: 36, fontWeight: FontWeight.w700),
                        //   textAlign: TextAlign.center,
                        // ),
                        // const UIVerticalSpace(16),
                        Expanded(
                          child: PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              // Step 1: Select register
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Activate Register',
                                    style: UIStyleText.headline.copyWith(fontSize: 36, fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  ),
                                  const UIVerticalSpace(12),
                                  UIText.bodyRegular(
                                    'Before use, this device must be linked to a register. Select a register to activate now.',
                                    align: TextAlign.center,
                                    color: UIColors.textDark,
                                  ),
                                  const UIVerticalSpace(30),
                                  BlocBuilder<UnassignedRegisterListCubit, UnassignedRegisterListState>(
                                    builder: (context, state) => state.maybeWhen(
                                      loaded: (registers) => registers.isEmpty
                                          ? Column(
                                              children: [
                                                Assets.icons.infoCircle.svg(
                                                  width: 20,
                                                  colorFilter: UIColors.borderRegular.toColorFilter,
                                                ),
                                                const UIVerticalSpace(4),
                                                UIText.heading6('No registers available'),
                                                const UIVerticalSpace(4),
                                                Text(
                                                  'This device cannot be activated right now because no registers are currently available.\nPlease contact your administrator before continuing.',
                                                  textAlign: TextAlign.center,
                                                  style: UIStyleText.hintRegular,
                                                ),
                                                const UIVerticalSpace(24),
                                                UIButton.filled(
                                                  'Logout',
                                                  onClick: () => context.read<AuthBloc>().add(const LogoutEvent()),
                                                )
                                              ],
                                            )
                                          : Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ConstrainedBox(
                                                  constraints: const BoxConstraints(maxWidth: 320, maxHeight: 290),
                                                  child: RawScrollbar(
                                                    controller: _scrollController1,
                                                    thumbVisibility: true,
                                                    thickness: 6,
                                                    radius: const Radius.circular(6),
                                                    child: ScrollConfiguration(
                                                      behavior:
                                                          ScrollConfiguration.of(context).copyWith(scrollbars: false),
                                                      child: ListView.separated(
                                                        controller: _scrollController1,
                                                        shrinkWrap: true,
                                                        separatorBuilder: (_, __) => const UIVerticalSpace(16),
                                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                                        itemCount: registers.length,
                                                        itemBuilder: (context, index) {
                                                          final item = registers[index];
                                                          return ListTile(
                                                            onTap: () => setState(() => _register = item),
                                                            contentPadding: EdgeInsets.zero,
                                                            minVerticalPadding: 0,
                                                            hoverColor: UIColors.transparent,
                                                            title: Container(
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: _register?.id == item.id
                                                                      ? UIColors.primary
                                                                      : UIColors.borderRegular,
                                                                ),
                                                                borderRadius: BorderRadius.circular(8),
                                                              ),
                                                              child: RadioListTile<Register>(
                                                                title: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    UIText.heading6(item.name),
                                                                    if (item.assignedBranch != null)
                                                                      UIText.subtitle(item.assignedBranch!.name),
                                                                  ],
                                                                ),
                                                                value: item,
                                                                groupValue: _register,
                                                                onChanged: (value) => setState(() => _register = value),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const UIVerticalSpace(24),
                                                if (_register != null)
                                                  SizedBox(
                                                    width: 200,
                                                    child: UIButton.filled(
                                                      'Next',
                                                      onClick: () {
                                                        _next();
                                                        // if (_register != null) {
                                                        //   context.read<DeviceSetupBloc>().add(DeviceSetupEvent.bind(_register!));
                                                        // }
                                                      },
                                                    ),
                                                  )
                                              ],
                                            ),
                                      failure: (message) => Column(
                                        children: [
                                          UIText.labelMedium(message),
                                          UIButton.text(
                                            'Reload',
                                            onClick: () => context.read<UnassignedRegisterListCubit>().fetch(),
                                          ),
                                        ],
                                      ),
                                      orElse: () => const CupertinoActivityIndicator(),
                                    ),
                                  ),
                                ],
                              ),
                              // Step 2: Select printer
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Set Up Printer',
                                    style: UIStyleText.headline.copyWith(fontSize: 36, fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  ),
                                  const UIVerticalSpace(12),
                                  UIText.bodyRegular(
                                    'Select a printer to use for receipt printing. You can change this later in Settings.',
                                    align: TextAlign.center,
                                    color: UIColors.textDark,
                                  ),
                                  const UIVerticalSpace(30),
                                  BlocBuilder<PrinterCubit, PrinterState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        loaded: (printers) => ConstrainedBox(
                                          constraints: const BoxConstraints(maxWidth: 320, maxHeight: 270),
                                          child: RawScrollbar(
                                            controller: _scrollController2,
                                            thumbVisibility: true,
                                            thickness: 6,
                                            radius: const Radius.circular(6),
                                            child: ScrollConfiguration(
                                              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                                              child: ListView.separated(
                                                controller: _scrollController2,
                                                shrinkWrap: true,
                                                separatorBuilder: (_, __) => const UIVerticalSpace(16),
                                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                                itemCount: printers.length,
                                                itemBuilder: (context, index) {
                                                  final item = printers[index].name;
                                                  return ListTile(
                                                    onTap: () => setState(() => _printer = item),
                                                    contentPadding: EdgeInsets.zero,
                                                    minVerticalPadding: 0,
                                                    hoverColor: UIColors.transparent,
                                                    title: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: _printer == item
                                                              ? UIColors.primary
                                                              : UIColors.borderRegular,
                                                        ),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: RadioListTile<String>(
                                                        title: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            UIText.heading6(item),
                                                          ],
                                                        ),
                                                        value: item,
                                                        groupValue: _printer,
                                                        onChanged: (value) => setState(() => _printer = value),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        failure: (message) => Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            UIText.labelMedium(message, color: UIColors.error),
                                            UIButton.text(
                                              'Reload',
                                              onClick: () => context.read<PrinterCubit>().findPrinters(),
                                            ),
                                          ],
                                        ),
                                        orElse: () => const CupertinoActivityIndicator(),
                                      );
                                    },
                                  ),
                                  const UIVerticalSpace(24),
                                  if (_printer != null)
                                    UIButton.filled(
                                      'Finish Setup',
                                      onClick: () {
                                        if (_register != null) {
                                          context.read<DeviceSetupBloc>().add(DeviceSetupEvent.bind(
                                                _register!,
                                                printer: _printer,
                                              ));
                                        }
                                      },
                                    ),
                                  const UIVerticalSpace(16),
                                  UIButton.text(
                                    'Set Up Printer Later',
                                    onClick: () {
                                      if (_register != null) {
                                        context.read<DeviceSetupBloc>().add(DeviceSetupEvent.bind(_register!));
                                      }
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.5,
                        //   child: BlocSelector<DeviceSetupBloc, DeviceSetupState, String?>(
                        //     builder: (context, errorMessage) {
                        //       return errorMessage?.isNotEmpty == true
                        //           ? UIText.labelMedium(
                        //               errorMessage!,
                        //               color: UIColors.error,
                        //               align: TextAlign.center,
                        //             )
                        //           : const SizedBox.shrink();
                        //     },
                        //     selector: (state) {
                        //       return state.maybeWhen(
                        //         failure: (message) => message,
                        //         orElse: () => null,
                        //       );
                        //     },
                        //   ),
                        // ),
                        // const UIVerticalSpace(16),
                        if (_currentStep == 1)
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: UIButton.text(
                              'Back',
                              iconBuilder: (isHover) => Assets.icons.arrowLeft.setColorOnHover(isHover),
                              onClick: _back,
                            ),
                          ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }

  void _next() {
    if (_currentStep < 1) {
      setState(() => _currentStep++);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _back() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
