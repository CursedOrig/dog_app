import 'package:dogapp/pages/privacy_terms_page.dart';
import 'package:flutter/material.dart';

import '../res/app_res.dart';

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
                'Settings',
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
            label: 'Terms of Use',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PrivacyTermsPage(
                    title: 'Terms of Use',
                    content: List.generate(150, (index) {return 'Terms of Use $index';}).join(),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          SettingsItemsWidget(
            label: 'Privacy Policy',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PrivacyTermsPage(
                    title: 'Privacy Policy',
                    content: List.generate(150, (index) {return 'Privacy Policy $index';}).join(),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          SettingsItemsWidget(
            label: 'Share App',
            onTap: () {},
          ),
          const SizedBox(height: 12),
          SettingsItemsWidget(
            label: 'Rate App',
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
          style: AppTypo.body1.copyWith(color: AppColors.layer1),
        ),
      ),
    );
  }
}
