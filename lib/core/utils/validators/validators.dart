class AppValidators {
//   validate email in uzbek language
  static String? validateEmail(String? value) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (value == null || value.isEmpty || !emailRegExp.hasMatch(value)) {
      return 'Iltimos email manzilini to\'ldiring';
    }
    return null;
  }

  static String? validateUsername(String? value){
    if (value == null || value.isEmpty) {
      return 'Iltimos foydalanuvchi nomini kiriting';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Iltimos parolni kiriting';
    }
    return null;
  }
}
