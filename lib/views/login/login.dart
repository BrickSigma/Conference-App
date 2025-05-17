import 'package:conference_app/models/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Login"),
            Consumer<AuthProvider>(
              builder:
                  (context, auth, child) => ElevatedButton(
                    onPressed: () => auth.login(),
                    child: Text("Proceed"),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
