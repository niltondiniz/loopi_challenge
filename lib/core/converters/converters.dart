class Converter {
  static String stringDateYMDToDMY(String stringDate) {
    return "${stringDate.split('-')[2]}/${stringDate.split('-')[1]}/${stringDate.split('-')[0]}";
  }
}
