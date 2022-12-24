extension BooleanRevert on bool {
  bool revert() => !this;
}

extension StringExtension on String {
  String capitalize() {
    // ignore: unnecessary_this
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String capitalizeAllWord() {
    String value = this;
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " " || value[i - 1] == '\n') {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
      }
    }
    return result;
  }
}
