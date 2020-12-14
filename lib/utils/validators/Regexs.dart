class Regexs {
  static RegExp password = RegExp(r'^.{5,}$');
  static RegExp name = RegExp(r'^.{2,}$');
  static RegExp email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}