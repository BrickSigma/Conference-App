import 'package:conference_app/views/app/account.dart';
import 'package:conference_app/views/app/connections.dart';
import 'package:conference_app/views/app/home.dart';
import 'package:conference_app/views/app/schedule.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Widget> _pages = [
    HomeView(),
    ScheduleView(),
    ConnectionsView(),
    AccountView(),
  ];
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outlined),
            label: "Connections",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Account",
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
