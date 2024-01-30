import 'package:intl/intl.dart';

final uzbekCurrencyFormat = NumberFormat.currency(
  locale: 'uz_UZ', // 'uz_UZ' represents the Uzbek locale
  symbol: 'uzs',
  decimalDigits: 0, // Set the number of decimal digits
);
// 1 234 000 so’m
final currencyFormat = NumberFormat.currency(
  locale: 'uz_UZ', // 'uz_UZ' represents the Uzbek locale
  symbol: 'so’m',
  decimalDigits: 0, // Set the number of decimal digits
);