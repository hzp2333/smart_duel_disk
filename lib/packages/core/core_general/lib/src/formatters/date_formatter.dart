import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@LazySingleton()
class DateFormatter {
  static final _dateWithFullMonthNameFormat = DateFormat('d MMMM, yyyy');

  String formatWithFullMonthName(DateTime date) => _dateWithFullMonthNameFormat.format(date);
}
