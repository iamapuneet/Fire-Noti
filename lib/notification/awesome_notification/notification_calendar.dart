import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationCalendar extends NotificationSchedule {
  /// Constructs a [NotificationCalendar] with specific scheduling options.
  NotificationCalendar({
    required super.timeZone,
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.second,
    required this.millisecond,
    super.allowWhileIdle,
    super.repeats,
    super.preciseAlarm,
    super.delayTolerance,
  });

  /// The year for the scheduled notification.
  int year;

  /// The month for the scheduled notification.
   int month;

  /// The day for the scheduled notification.
   int day;

  /// The hour for the scheduled notification.
   int hour;

  /// The minute for the scheduled notification.
   int minute;

  /// The second for the scheduled notification.
   int second;

  /// The millisecond for the scheduled notification.
   int millisecond;

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map.addAll({
      'year': year,
      'month': month,
      'day': day,
      'hour': hour,
      'minute': minute,
      'second': second,
      'millisecond': millisecond,
    });
    return map;
  }

  @override
  NotificationCalendar? fromMap(Map<String, dynamic> mapData) {
    super.fromMap(mapData);
    year = mapData['year'];
    month = mapData['month'];
    day = mapData['day'];
    hour = mapData['hour'];
    minute = mapData['minute'];
    second = mapData['second'];
    millisecond = mapData['millisecond'];
    return this;
  }

  @override
  void validate() {
    // TODO: implement validate
  }
}
