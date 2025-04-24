import 'package:dogapp/res/app_res.dart';
import 'package:dogapp/tools/extensions.dart';
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
            text: context.tt.dog,
            style: AppTypo.headerL.copyWith(fontWeight: FontWeight.w900),
          ),
          TextSpan(
            text: context.tt.app,
            style: AppTypo.headerL.copyWith(fontWeight: FontWeight.w900, color: AppColors.accent1),
          ),
        ],
      ),
    );
  }
}
