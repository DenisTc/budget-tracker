extension NullableStringExtension on String? {
  bool get isNotNullOrEmpty => this?.isNotEmpty ?? false;
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
