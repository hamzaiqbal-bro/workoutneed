class StringAssets{
  StringAssets._();

  static String emailExp =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  static String passwordExp =
      r"^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$";
  static String phoneExp = r"^(?:[+0]9)?[0-9]{11}$";
  static RegExp kEmailValidatorRegExp = RegExp(emailExp);
  static RegExp kPasswordValidatorRegExp = RegExp(passwordExp);
  static RegExp kPhoneValidatorRegExp = RegExp(phoneExp);
}