extension StringExtensions on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  String? capitalizeFirstLetter() {
    if (isNullOrEmpty) {
      return this;
    }

    if (this!.length == 1) {
      return this!.toUpperCase();
    }

    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }
}
