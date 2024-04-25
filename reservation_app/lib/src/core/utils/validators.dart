class AppValidators {
  static String? emptyCheck(String? v, String? message) {
    if (v == null || v == '') {
      return message;
    } else {
      return null;
    }
  }

  static String? emailCheck(String? v) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern.toString());
    if (v!.trim().isEmpty) {
      return "Email Required";
    } else if (!regExp.hasMatch(v)) {
      return 'Invalid Email Format';
    }
    return null;
  }

  static String? passwordCheck(String? v) {
    if (v!.trim().isEmpty || v.length < 6) {
      return "Invalid Password";
    }
    return null;
  }
}
