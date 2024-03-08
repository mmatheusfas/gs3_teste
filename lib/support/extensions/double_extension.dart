import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String doubleToStringFormated() {
    NumberFormat formatter = NumberFormat("#,##0.00", "pt_BR");

    return formatter.format(this);
  }
}
