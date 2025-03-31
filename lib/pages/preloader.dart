import 'package:dogapp/main.dart';
import 'package:dogapp/pages/dog_breeds_page.dart';
import 'package:flutter/material.dart';

import '../widgets/preloader_subtitle.dart';

class Preloader extends StatelessWidget {
  const Preloader({super.key});

  static bool isNavigated = false;

  @override
  Widget build(BuildContext context) {
    if (!isNavigated) {
      isNavigated = true;
      Future.delayed(const Duration(seconds: 1), () {
        if (context.mounted) {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const DogBreedsPage()),
        );
        }
      });
    }

    return Container(
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: FractionalOffset(0.5, 0.5),
              child: Image.asset(
                'assets/images/dog-poster.png',
                height: 250,
              ),
            ),
            Align(
                alignment: FractionalOffset(0.5, 0.8),
                child: const PreloaderSubtitle()),
          ],
        ));
  }
}


