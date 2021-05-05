import 'package:intl/intl.dart';

class NumberConverter {
  static String formatNumberToVietNamDong(double price) {
    var numberFormat = new NumberFormat("##,###", "vi_VN");
    var priceInterface = numberFormat.format(price);
    return priceInterface;
  }
}
