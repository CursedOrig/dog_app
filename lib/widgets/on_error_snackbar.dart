import 'dart:ui';
import 'package:dogapp/res/app_res.dart';
import 'package:dogapp/tools/extensions.dart';
import 'package:flutter/material.dart';

FrameCallback showOnErrorSnack(BuildContext context) {
  return (Duration _) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            height: 44,
            alignment: Alignment.center,
            decoration: AppDeco.snackDeco,
            padding: const EdgeInsets.all(8),
            child: Text(
              context.tt.serverError,
              overflow: TextOverflow.ellipsis,
              style: AppTypo.body1.copyWith(color: AppColors.mainBg),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  };
}
