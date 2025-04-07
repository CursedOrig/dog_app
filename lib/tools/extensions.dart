extension ExtStr on String {
  String get capFirst {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}