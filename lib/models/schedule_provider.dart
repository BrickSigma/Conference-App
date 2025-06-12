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

        String id = docSnapshot.id;

        // Load the session information for a schedule
        if (schedule.isSession) {
          final QuerySnapshot sessionQuery =
              await db
                  .collection("schedule")
                  .doc(id)
                  .collection("sessions")
                  .get();

          List<SessionModel> sessions = [];

          for (QueryDocumentSnapshot documentSnapshot in sessionQuery.docs) {
            final Map<String, String> data = Map<String, String>.from(
              documentSnapshot.data()! as Map<String, dynamic>,
            );

            int index = sessions.indexWhere(
              (element) => element.title == data["session"]!,
            );
            if (index != -1) {
              sessions[index].activities.add(
                SessionActivity(data["topic"] ?? "", data["speaker"] ?? ""),
              );
            } else {
              sessions.add(SessionModel(data["session"] ?? ""));
              sessions.last.activities.add(
                SessionActivity(data["topic"] ?? "", data["speaker"] ?? ""),
              );
            }
          }

          sessions.sort((a, b) => a.title.compareTo(b.title));
          for (SessionModel element in sessions) {
            schedule.sessions.add(element);
          }
        }

        schedules.add(schedule);
        DateTime date = DateUtils.dateOnly(schedule.start.toDate());
        if (!dates.contains(date)) {
          dates.add(date);
        }
      } on Exception {
        throw Exception("Could not load schedule!");
      }
    }

    schedules.sort((a, b) => a.start.compareTo(b.start));
    dates.sort((a, b) => a.compareTo(b));
    if (dates.isNotEmpty) {
      startDate = dates.first;
      endDate = dates.last;
    }
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

  /// Gets the schedule list for a specified day.
  List<ScheduleModel> getScheduleForDate(DateTime date) {
    return schedules
        .where(
          (element) =>
              DateUtils.dateOnly(element.start.toDate()) ==
              DateUtils.dateOnly(date),
        )
        .toList();
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

  ScheduleModel(this.title, this.start, this.end, this.isSession);
}

/// Contains information about a session.
class SessionModel {
  String title = "";
  List<SessionActivity> activities = [];

  SessionModel(this.title);
}

/// Represents a single activity in a session.
class SessionActivity {
  String topic = "";
  String speaker = "";

  SessionActivity(this.topic, this.speaker);
}
