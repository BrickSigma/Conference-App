import 'package:conference_app/views/components/stacked_background.dart';
import 'package:flutter/material.dart';

class ScheduleData {
  String time;
  String title;
  String duration;

  ScheduleData(this.title, this.time, this.duration);
}

class Day {
  List<ScheduleData> scheduleData;
  String date;

  Day(this.date, this.scheduleData);
}

List<Day> scheduleCalendar = [
  Day("June 15th", [
    ScheduleData("Session 1", "09:20", "1 hour"),
    ScheduleData("Session 2", "11:00", "2 hours"),
    ScheduleData("Session 3", "14:00", "2 hours"),
  ]),
  Day("June 16th", [
    ScheduleData("Opening ceremony", "08:30", "1 hour 30 minutes"),
    ScheduleData("Plenary session", "10:00", "30 minutes"),
    ScheduleData("Parallel paper presentation sessions", "11:00", "2 hours"),
    ScheduleData("Plenary", "14:00", "30 minutes"),
    ScheduleData("Parallel paper presentation sessions", "14:30", "2 hours"),
  ]),
  Day("June 17th", [
    ScheduleData("Plenary session", "08:30", "30 minutes"),
    ScheduleData(
      "Parallel paper presentation sessions",
      "09:00",
      "1 hour 30 minutes",
    ),
    ScheduleData("Parallel paper presentation sessions", "11:00", "2 hours"),
    ScheduleData("Plenary", "14:00", "30 minutes"),
    ScheduleData("Parallel paper presentation sessions", "14:30", "2 hours"),
  ]),
  Day("June 19th", [
    ScheduleData("Plenary session", "08:30", "30 minutes"),
    ScheduleData(
      "Parallel paper presentation sessions",
      "09:00",
      "1 hour 30 minutes",
    ),
    ScheduleData("Parallel paper presentation sessions", "11:00", "2 hours"),
    ScheduleData("Plenary", "14:00", "30 minutes"),
    ScheduleData("Parallel paper presentation sessions", "14:30", "2 hours"),
    ScheduleData("Conference dinner", "18:00", "3 hours"),
  ]),
  Day("June 20th", [
    ScheduleData(
      "Parallel paper presentation sessions",
      "09:00",
      "1 hour 30 minutes",
    ),
    ScheduleData("Closing ceremony", "11:00", "2 hours"),
  ]),
];

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: scheduleCalendar.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Schedule"),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabs: [for (Day day in scheduleCalendar) Tab(text: day.date)],
          ),
        ),
        body: StackedBackground(
          child: TabBarView(
            children: [
              for (Day day in scheduleCalendar) ScheduleList(day.scheduleData),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleList extends StatelessWidget {
  final List<ScheduleData> data;

  const ScheduleList(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (ScheduleData schedule in data)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 6, child: VerticalDivider()),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                            child: Text(
                              schedule.time,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          if (schedule != data.last)
                            Expanded(child: VerticalDivider()),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: ScheduleCard(schedule)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final ScheduleData data;

  const ScheduleCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.title),
            SizedBox(height: 6),
            Text(
              "Duration: ${data.duration}",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
