import 'package:intl/intl.dart';

class FormatosVibles {
  static String formatoVisibleNumeros(double numero) {
    final formatearNumero = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    );
    return formatearNumero.format(numero);
  }
}
