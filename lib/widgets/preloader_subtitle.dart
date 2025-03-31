import 'package:flutter/material.dart';

class PreloaderSubtitle extends StatelessWidget {
  const PreloaderSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            'Dog',
            style: TextStyle(
              color: Colors.red,
              decoration: TextDecoration.none,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Arial',
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          child: Text(
            'App',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Arial',
            ),
          ),
        )
      ],
    );
  }
}
