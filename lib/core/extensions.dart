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

  String driveLink() {
    final originalLink = this;
    final RegExp regExp = RegExp(
        r'^https:\/\/drive\.google\.com\/file\/d\/([a-zA-Z0-9_-]+)\/.*$');
    final Match? match = regExp.firstMatch(originalLink);
    if (match != null) {
      final String fileId = match.group(1)!;
      final String transformedLink =
          'https://drive.google.com/uc?export=download&id=$fileId';
      return transformedLink;
    }

    // Return the original link if it doesn't match the expected format
    return originalLink;
  }
}

extension numExtension on num {
  String toStringFixed(int fractionDigits) {
    String valueString = toStringAsFixed(fractionDigits);

    final int indexOfDot = valueString.indexOf('.');

    if (indexOfDot != -1) {
      final String fractionDigitsValue = valueString.substring(
        indexOfDot + 1,
        valueString.length,
      );

      if (double.parse(fractionDigitsValue) == 0.0) {
        valueString = valueString.substring(0, indexOfDot);
      }
    }

    return valueString;
  }
}

extension DateExtension on DateTime {
  String get md =>
      'June 28th'; //TODO: to search for the specific date format syntax
}
