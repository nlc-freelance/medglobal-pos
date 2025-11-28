import 'package:flutter/cupertino.dart';
import 'package:medglobal_admin_portal/core/constants/strings.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getAppVersion(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CupertinoActivityIndicator();
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return UIText.labelMedium(
            snapshot.data ?? Strings.noValue,
            color: UIColors.textGray,
          );
        }
      },
    );
  }
}

Future<String> getAppVersion() async {
  final PackageInfo info = await PackageInfo.fromPlatform();
  return 'v${info.version}-preprod (build ${info.buildNumber})';
}
