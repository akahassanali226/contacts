abstract class AppValidation {
  static String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return "This Field can't be Empty";
    }
    final RegExp emailRegExp = RegExp(
      r'^(?!.*\.\.)(?=.{1,254}$)(?=.{1,64}@)'
      r"[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+"
      r"(?:\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*"
      r'@'
      r'(?:(?:[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?\.)+'
      r'[A-Za-z]{2,63})$',
    );
    if (!emailRegExp.hasMatch(email)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "This Field can't be Empty";
    }
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[a-z])'
      r'(?=.*[A-Z])'
      r'(?=.*\d)'
      r'(?=.*[@$!%*?&^#_~\-])'
      r'[A-Za-z\d@$!%*?&^#_~\-]{8,}$',
    );
    if (!passwordRegExp.hasMatch(password)) {
      return "Password must be at least 8 characters,\n"
          "include uppercase, lowercase, number, and special character.";
    }
    return null;
  }

  static String? userNameValidation(String? userName) {
    if (userName == null || userName.isEmpty) {
      return "This Field can't be Empty";
    }
    final RegExp userNameRegex = RegExp(r'^[A-Za-z][A-Za-z0-9_]{2,15}$');

    if (!userNameRegex.hasMatch(userName)) {
      return "Please enter a valid userName";
    }
    return null;
  }

  static String? phoneValidation(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "This field can't be empty";
    }
    final RegExp regExp = RegExp(r'^\+?[1-9]\d{6,14}$'); // E.164 standard
    if (!regExp.hasMatch(phone)) {
      return "Enter a valid phone number";
    }
    return null;
  }
}
