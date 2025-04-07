part of 'app_res.dart';

class AppBtnStyles {
  AppBtnStyles._();

  static final mainIconButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) => switch (states.current) {
          MyBtnState.active => AppColors.layer1,
          MyBtnState.pressed => AppColors.accent1,
          MyBtnState.disabled => AppColors.layer4,
        }),
    iconColor: WidgetStateProperty.resolveWith<Color>((states) => switch (states.current) {
      MyBtnState.active => AppColors.mainBg,
      MyBtnState.pressed => AppColors.layer1,
      MyBtnState.disabled => AppColors.layer5,
    }),
    maximumSize: const WidgetStatePropertyAll(Size(44, 44)),
    minimumSize: const WidgetStatePropertyAll(Size(44, 44)),
    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    shape: WidgetStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    )),
  );
}

extension on Set<WidgetState> {
  MyBtnState get current {
    if (contains(WidgetState.pressed)) {
      return MyBtnState.pressed;
    }
    if (contains(WidgetState.disabled)) {
      return MyBtnState.disabled;
    }
    return MyBtnState.active;
  }
}

enum MyBtnState { active, pressed, disabled }
