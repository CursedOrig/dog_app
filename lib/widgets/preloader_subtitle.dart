import 'package:dogapp/res/app_res.dart';
import 'package:flutter/material.dart';

class PreloaderSubtitle extends StatelessWidget {
  const PreloaderSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: AppTexts.dog,
            style: AppTypo.headerL.copyWith(fontWeight: FontWeight.w900),
          ),
          TextSpan(
            text: AppTexts.app,
            style: AppTypo.headerL.copyWith(fontWeight: FontWeight.w900, color: AppColors.accent1),
          ),
        ],
      ),
    );
  }
}
