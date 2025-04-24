part of 'app_res.dart';

class AppDeco {
  AppDeco._();

  static var mainDeco = BoxDecoration(
    color: AppColors.layer2,
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    border: Border.all(color: AppColors.layer4),
  );

  static var snackDeco = BoxDecoration(
    color: AppColors.layer1,
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    border: Border.all(color: AppColors.layer2),
  );
}