class Validators {
  static bool isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z]\w*([_.-]\w*)?@[a-zA-Z\d]+([.-][a-zA-Z\d]+)*\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  static bool isNotValidEmail(String email) => !isValidEmail(email);

  static bool isValidPassword(String password) {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9].*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password);
  }

  static bool isNotValidPassword(String password) => !isValidPassword(password);

  static bool isNotValidPhone(String phone) {
    // if (phone.length < 8 || phone.length > 12) {
    //   return true;
    // }

    return RegExp("(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9].*[0-9])(?=.*[^a-zA-Z0-9]).{8,}")
        .hasMatch(phone);
  }


  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}
