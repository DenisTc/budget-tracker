extension NullableStringExtension on String? {
  bool get isNotNullOrEmpty => this?.isNotEmpty ?? false;
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension StringExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}
