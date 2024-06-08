import 'package:intl/intl.dart';

String getFormattedTime(DateTime time) {
  return DateFormat('ha')
      .format(
        DateTime(
          time.year,
          time.month,
          time.day,
          time.hour,
        ),
      )
      .replaceAll(' ', '');
}
