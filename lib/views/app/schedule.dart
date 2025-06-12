import 'package:conference_app/models/schedule_provider.dart';
import 'package:conference_app/utils/utils.dart';
import 'package:conference_app/views/components/stacked_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    ScheduleProvider scheduleProvider = Provider.of(context, listen: false);

    return DefaultTabController(
      length: scheduleProvider.eventDays,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Schedule"),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (DateTime date in scheduleProvider.dates)
                Tab(text: dateToString(date)),
            ],
          ),
        ),
        body: StackedBackground(
          child: TabBarView(
            children: [
              for (DateTime date in scheduleProvider.dates)
                ScheduleList(scheduleProvider.getScheduleForDate(date)),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleList extends StatelessWidget {
  final List<ScheduleModel> data;

  const ScheduleList(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (ScheduleModel schedule in data)
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
                              formatTime(schedule.start.toDate()),
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
  final ScheduleModel data;

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
              "Duration: ${data.durationText}",
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
