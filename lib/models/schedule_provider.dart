import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScheduleProvider extends ChangeNotifier {
  List<ScheduleModel> schedules = [];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<DateTime> dates = [];

  /// Gets the number of days the event lasts for.
  int get eventDays => dates.length;

  Future<void> loadSchedule() async {
    // Clear the schedules list in case this is being called by the main instance
    // of the provider.
    schedules.clear();
    dates.clear();

    final db = FirebaseFirestore.instance;

    final QuerySnapshot query = await db.collection("schedule").get();

    for (QueryDocumentSnapshot docSnapshot in query.docs) {
      try {
        final Map<String, dynamic> data =
            docSnapshot.data()! as Map<String, dynamic>;
        ScheduleModel schedule = ScheduleModel(
          data["title"],
          data["start"],
          data["end"],
          data["isSession"] ?? false,
        );
        schedules.add(schedule);
        DateTime date = DateUtils.dateOnly(schedule.start.toDate());
        if (!dates.contains(date)) {
          dates.add(date);
        }
      } on Exception {
        continue;
      }
    }

    dates.sort((a, b) => a.compareTo(b));
    if (dates.isNotEmpty) {
      startDate = dates.first;
      endDate = dates.last;
    }
    print(startDate);
    print(endDate);
  }

  /// Copies data from on schedule provider to this instance.
  ///
  /// Used when loading data in FutureBuilder.
  void copyFrom(ScheduleProvider schedule) {
    schedules = schedule.schedules.toList();
    startDate = schedule.startDate;
    endDate = schedule.endDate;
    dates = schedule.dates.toList();
  }
}

/// Contains the schedules for each day.
class ScheduleModel {
  String title = "";
  Timestamp start = Timestamp(0, 0);
  Timestamp end = Timestamp(0, 0);
  bool isSession = false;
  List<SessionModel> sessions = [];

  String _getDurationText() {
    int hours = end.toDate().difference(start.toDate()).inHours;
    int minutes =
        end.toDate().difference(start.toDate()).inMinutes - hours * 60;

    if (hours > 1) {
      return "$hours hours and $minutes minutes";
    } else if (hours == 1) {
      return "$hours hour and $minutes minutes";
    } else {
      return "$minutes minutes";
    }
  }

  String get durationText => _getDurationText();

  ScheduleModel(
    this.title,
    this.start,
    this.end,
    this.isSession, {
    this.sessions = const [],
  });
}

/// Contains information about a session.
class SessionModel {
  String id = "";
  String title = "";
  List<SessionActivity> activities = [];
}

/// Represents a single activity in a session.
class SessionActivity {
  String topic = "";
  String speaker = "";
}
