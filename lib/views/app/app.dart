import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_app/models/login_provider.dart';
import 'package:conference_app/models/user_model.dart';
import 'package:conference_app/views/app/account.dart';
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
  final List<Widget> _pages = [
    HomeView(),
    ScheduleView(),
    ConnectionsView(),
    AccountView(),
  ];
  int _pageIndex = 0;

  Future<UserModel>? _data;

  /// Used to load the user data from firebase.
  Future<UserModel> _getUserData() async {
    final db = FirebaseFirestore.instance;
    User currentUser;
    try {
      currentUser = FirebaseAuth.instance.currentUser!;
    } on Exception {
      throw "User is signed out!";
    }

    String uid = currentUser.uid;
    DocumentSnapshot<Map<String, dynamic>> data =
        await db.collection("users").doc(uid).get();

    UserModel user = UserModel();
    user.userInfo = currentUser;
    user.email = currentUser.email!;
    user.userName = data.data()!["username"];

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

            child = Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
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
          } else {
            child = Scaffold(
              body: Center(
                child: Column(
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
