extension StringExtension on String {
  List<String> separateByComma() {
    return split(',').map((e) => e.trim()).toList();
  }
}
