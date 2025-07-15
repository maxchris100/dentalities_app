class StringUtil {
  static String castToString(dynamic val) {
    if (val != null) {
      return val.toString();
    }
    return "";
  }
}
