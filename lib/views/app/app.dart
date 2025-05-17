import 'package:conference_app/models/login_provider.dart';
import 'package:conference_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context, listen: false);

    print(user.userInfo!.emailVerified);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Hello ${user.userName}!"),
            Consumer<LoginProvider>(
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
