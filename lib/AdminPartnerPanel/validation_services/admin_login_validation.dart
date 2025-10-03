class LoginValidationService {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "please Enter your Email !!";
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return "Email is not valid";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "password is required";
    }
    return null;
  }
}
