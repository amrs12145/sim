class AppValidators {
  static String? Function(String?)? validateEmail() {
    return (text) {
      return (text == null || text.isEmpty)
          ? 'can not be empty'
          : (text.length < 3)
              ? 'min length 3'
              : (!text.contains('@'))
                  ? 'invalid email'
                  : (text.contains(' '))
                      ? 'can not contain empty space'
                      : null;
    };
  }

  static String? Function(String?)? validatePassword() {
    return (text) {
      return (text == null || text.isEmpty)
          ? 'can not be empty'
          : (text.length < 8)
              ? 'min length 8'
              : (text.contains('amr'))
                  ? 'can not contain your name'
                  : null;
    };
  }
}
