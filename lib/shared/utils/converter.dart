import 'package:intl/intl.dart';

class XConverter {
  static String numberSupply(double input,
      {int decimal = 2, isAbbreviation = false}) {
    int decimalCount = 1;
    for (int x = 1; x <= decimal; x++) {
      decimalCount *= 10;
    }
    double _input = input / decimalCount;
    int inputLength = _input.toString().length;

    String symbol = "";
    if (isAbbreviation && inputLength > 4) {
      int check = (inputLength / 3).floor();
      decimal = 2;
      List<String> listSymbol = [
        "K",
        "M",
        "B",
        "T",
        "Quadrillion",
        "Quintillion"
      ];
      _input /= quadratic(1000, check);
      symbol = listSymbol[check - 1];
    }

    return numberFormat(_input, decimal) + symbol;
  }

  static String numberFormat(double input, [int decimal = 2]) {
    String decimalString = ".";
    for (int x = 1; x <= decimal; x++) {
      decimalString += "#";
    }
    var f = NumberFormat("#,###$decimalString", "en_US");
    return f.format(input);
  }

  static double quadratic(double input, int decimal) {
    double count = 1;
    for (int x = 1; x <= decimal; x++) {
      count *= input;
    }
    return count;
  }

  static String amountFromBigInt(BigInt input, int decimal) {
    double result = input.toDouble() / quadratic(10, decimal);
    return numberFormat(result, decimal);
  }

  static BigInt amountToBigInt(String input, int decimal) {
    double result = double.parse(input) * quadratic(10, decimal);
    return BigInt.from(result);
  }

  String? stringFormatYmd(String? date) {
    if (date == null) {
      return null;
    } else {
      var data = date.split("-");

      if (data.length < 3) data = date.split("/");
      if (data.length < 3) return null;

      var day = data[0];
      var month = data[1];
      var year = data[2];
      return "$year-$month-$day";
    }
  }

  DateTime? dateFormatYmd(String? dateInput) {
    if (dateInput == null) {
      return null;
    } else {
      try {
        var date = dateInput.split(" ").first;
        var data = date.split("-");

        if (data.length < 3) data = date.split("/");
        if (data.length < 3) return null;

        var day = data[0];
        var month = data[1];
        var year = data[2];

        if (year.length < 4) return DateTime.parse(dateInput);

        return DateTime.parse("$year-$month-$day");
      } catch (e) {
        return null;
      }
    }
  }

  String? stringFormatDmy(DateTime? date, [String? stringLocale]) {
    return date == null
        ? null
        : DateFormat("dd-MM-yyyy", stringLocale).format(date);
  }

  String? stringFormatDmyHhMmA(DateTime? date, [String? stringLocale]) {
    return date == null
        ? null
        : DateFormat("dd-MM-yyyy, hh:mm a", stringLocale).format(date);
  }

  String? stringFormatDmyHeader(DateTime? date, [String? stringLocale]) {
    return date == null
        ? null
        : DateFormat("EEEE, dd MMMM yyyy", stringLocale).format(date);
  }

  DateTime? dateFormatYmdOnly(DateTime? date) {
    return date == null
        ? null
        : DateTime.parse(DateFormat("yyyy-MM-dd").format(date));
  }
}
