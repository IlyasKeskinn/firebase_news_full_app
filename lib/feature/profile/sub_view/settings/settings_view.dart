import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_news_full_app/feature/auth/authentication_view.dart';
import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:firebase_news_full_app/product/constants/string_constants.dart';
import 'package:firebase_news_full_app/product/widget/text/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await context.navigateToPage(const AuthenticationView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText(value: StringConstants.settingsPage),
      ),
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            const _SettingsTile(
              leadingIcon: Icon(
                Icons.notifications_outlined,
              ),
              settingsName: StringConstants.settingsPage,
            ),
            _lowEmptySizedBox(context),
            const _SettingsTile(
              leadingIcon: Icon(
                Icons.lock_outline,
              ),
              settingsName: StringConstants.settingsPageSecurity,
            ),
            _lowEmptySizedBox(context),
            const _SettingsTile(
              leadingIcon: Icon(
                Icons.help_outline,
              ),
              settingsName: StringConstants.settingsPageHelp,
            ),
            _lowEmptySizedBox(context),
            TextButton.icon(
              onPressed: logOut,
              icon: const Icon(Icons.logout_outlined),
              label: const Text(StringConstants.logout),
            )
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.leadingIcon,
    required this.settingsName,
  });
  final Widget leadingIcon;
  final String settingsName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: ColorConst.titleActive,
      leading: leadingIcon,
      title: Text(
        settingsName,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.chevron_right_outlined),
      ),
    );
  }
}

SizedBox _lowEmptySizedBox(BuildContext context) =>
    SizedBox(child: context.emptySizedHeightBoxLow);
