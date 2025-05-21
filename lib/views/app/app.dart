import 'package:conference_app/views/app/home.dart';
import 'package:conference_app/views/app/schedule.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Widget> _pages = [HomeView(), ScheduleView()];
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
          ),
        ],
        currentIndex: _pageIndex,
        onTap:
            (value) => setState(() {
              _pageIndex = value;
            }),
      ),
      body: _pages[_pageIndex],
    );
  }
}
