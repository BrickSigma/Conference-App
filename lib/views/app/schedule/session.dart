/// Displays session information.
library;

import 'package:conference_app/models/schedule_provider.dart';
import 'package:conference_app/views/components/stacked_background.dart';
import 'package:flutter/material.dart';

class SessionView extends StatefulWidget {
  const SessionView(this.title, this.sessions, {super.key});

  final List<SessionModel> sessions;
  final String title;

  @override
  State<SessionView> createState() => _SessionViewState();
}

class _SessionViewState extends State<SessionView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sessions.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              for (SessionModel session in widget.sessions)
                Tab(text: session.title),
            ],
          ),
        ),
        body: StackedBackground(
          child: TabBarView(
            children: [
              for (SessionModel session in widget.sessions)
                SessionList(session),
            ],
          ),
        ),
      ),
    );
  }
}

class SessionList extends StatelessWidget {
  const SessionList(this.data, {super.key});

  final SessionModel data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (SessionActivity activity in data.activities)
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                  child: SessionCard(activity),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final SessionActivity data;

  const SessionCard(this.data, {super.key});

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
            Text(data.topic),
            SizedBox(height: 6),
            Text(
              "Speaker: ${data.speaker}",
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
