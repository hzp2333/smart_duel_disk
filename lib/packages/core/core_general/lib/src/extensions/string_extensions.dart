extension StringExtensions on String {
  bool get isNullOrEmpty {
    return this == null || isEmpty;
  }

  String capitalizeFirstLetter() {
    if (isNullOrEmpty) {
      return this;
    }

    if (length == 1) {
      return toUpperCase();
    }

    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
