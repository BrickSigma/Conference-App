import 'package:conference_app/models/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("App"),
            Consumer<AuthProvider>(
              builder:
                  (context, auth, child) => ElevatedButton(
                    onPressed: () => auth.logout(),
                    child: Text("Logout"),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
