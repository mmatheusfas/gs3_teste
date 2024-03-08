extension StringExtensions on String {
  String cardObscureNumber() {
    final splittedStrings = split(' ');
    final secondString = splittedStrings[1];
    return '●●●● $secondString';
  }
}
