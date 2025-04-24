import 'package:dogapp/pages/preloader.dart';
import 'package:dogapp/res/app_res.dart';
import 'package:dogapp/tools/extensions.dart';
import 'package:flutter/material.dart';
import 'gen/strings.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  LocaleSettings.useDeviceLocale();

  runApp(
    TranslationProvider(
      child: const DogApp()
    ),
  );
}

class DogApp extends StatelessWidget {
  const DogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '${context.tt.dog}${context.tt.app}',
      theme: ThemeData(
        fontFamily: AppFonts.comfortaa,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Preloader(),
    );
  }
}
