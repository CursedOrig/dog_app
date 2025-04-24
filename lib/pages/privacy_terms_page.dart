import 'package:flutter/material.dart';

import '../res/app_res.dart';

class PrivacyTermsPage extends StatelessWidget {
  const PrivacyTermsPage({super.key, required this.title, required this.content});

  final String title;
  final String content;

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
                title,
                textAlign: TextAlign.center,
                style: AppTypo.headerL.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(width: 44),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          content,
          style: AppTypo.body1,
        ),
      ),
    );
  }
}
