import 'package:dogapp/pages/privacy_terms_page.dart';
import 'package:dogapp/res/app_res.dart';
import 'package:dogapp/tools/extensions.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBg,
      appBar: AppBar(
        titleSpacing: 16.0,
        backgroundColor: AppColors.mainBg,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back, size: 32),
              style: AppBtnStyles.mainIconButtonStyle,
            ),
            Expanded(
              child: Text(
                context.tt.settingsPage.settings,
                textAlign: TextAlign.center,
                style: AppTypo.headerL.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(width: 44),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: [
          SettingsItemsWidget(
            label: context.tt.settingsPage.termsOfUse,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PrivacyTermsPage(
                    title: context.tt.settingsPage.termsOfUse,
                    content: List.generate(150, (index) {
                      return 'Terms of Use $index';
                    }).join(),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          SettingsItemsWidget(
            label: context.tt.settingsPage.privacyPolicy,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PrivacyTermsPage(
                    title: context.tt.settingsPage.privacyPolicy,
                    content: List.generate(150, (index) {
                      return 'Privacy Policy $index';
                    }).join(),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          SettingsItemsWidget(
            label: context.tt.settingsPage.shareApp,
            onTap: () {},
          ),
          const SizedBox(height: 12),
          SettingsItemsWidget(
            label: context.tt.settingsPage.rateApp,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SettingsItemsWidget extends StatelessWidget {
  const SettingsItemsWidget({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 44,
        decoration: AppDeco.mainDeco,
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          overflow: TextOverflow.ellipsis,
          style: AppTypo.body1.copyWith(color: AppColors.layer1),
        ),
      ),
    );
  }
}
