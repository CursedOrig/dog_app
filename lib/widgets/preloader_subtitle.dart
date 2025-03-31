import 'package:flutter/material.dart';

class PreloaderSubtitle extends StatelessWidget {
  const PreloaderSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dog',
          style: TextStyle(color: Colors.red, decoration: TextDecoration.none),
        ),
        Text(
          'App',
          style:
          TextStyle(color: Colors.white, decoration: TextDecoration.none),
        )
      ],
    );
  }
}