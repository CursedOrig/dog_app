import 'package:dogapp/pages/dog_breeds_page.dart';
import 'package:dogapp/res/app_res.dart';
import 'package:dogapp/widgets/preloader_subtitle.dart';
import 'package:flutter/material.dart';

class Preloader extends StatelessWidget {
  const Preloader({super.key});

  static Future? _navigation;

  @override
  Widget build(BuildContext context) {
    _delayedNavigation(context);

    return Container(
        color: AppColors.mainBg,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: const FractionalOffset(0.5, 0.5),
              child: Image.asset(
                AppImages.preloaderImg,
                height: 250,
              ),
            ),
            const Align(
              alignment: FractionalOffset(0.5, 0.8),
              child: Hero(
                tag: 'hero1',
                child: PreloaderSubtitle(),
              ),
            ),
          ],
        ));
  }

  void _delayedNavigation(BuildContext context) {
    _navigation ??= Future.delayed(const Duration(seconds: 1), () {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MyAnimatedRouteBuilder(nextPage: const DogBreedsPage()),
        );
      }
    });
  }
}

class MyAnimatedRouteBuilder extends PageRouteBuilder {
  final Widget nextPage;

  MyAnimatedRouteBuilder({required this.nextPage})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => nextPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 1000),
        );
}
