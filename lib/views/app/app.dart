import 'package:conference_app/models/login_provider.dart';
import 'package:conference_app/models/user_model.dart';
import 'package:conference_app/views/app/account/account.dart';
import 'package:conference_app/views/app/connections.dart';
import 'package:conference_app/views/app/home.dart';
import 'package:conference_app/views/app/schedule.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Future<UserModel>? _data;

  /// Used to load the user data from firebase.
  Future<UserModel> _getUserData() async {
    UserModel user = UserModel();
    await user.loadUserData(FirebaseAuth.instance.currentUser!);

    return user;
  }

  @override
  void initState() {
    _data = _getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _data,
      builder: (context, snapshot) {
        Widget child;

        LoginProvider loginProvider = Provider.of(context, listen: false);
        UserModel userModel = Provider.of(context, listen: false);

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            userModel.copyFrom(snapshot.data!);

            child = AppNavigation();
          } else {
            child = Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, size: 160),
                    SizedBox(height: 12),
                    Text("Could not load data!"),
                    SizedBox(height: 12),
                    FilledButton(
                      onPressed: () => loginProvider.logout(),
                      child: Text("Go back to login"),
                    ),
                  ],
                ),
              ),
            );
          }
        } else {
          child = Scaffold(
            body: Center(
              child: SizedBox(
                width: 160,
                height: 160,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return child;
      },
    );
  }
}

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
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
