import 'package:dogapp/gen/strings.g.dart';
import 'package:flutter/material.dart';

extension ExtStr on String {
  String get capFirst {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

extension ExtensionsOnContext on BuildContext {
  /// Translations Texts
  Translations get tt => Translations.of(this);
}
