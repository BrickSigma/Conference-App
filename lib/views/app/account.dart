import 'package:conference_app/models/login_provider.dart';
import 'package:conference_app/views/components/stacked_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StackedBackground(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<LoginProvider>(
                  builder:
                      (context, auth, child) => FilledButton.icon(
                        onPressed: () => auth.logout(),
                        label: Text("Log out"),
                        icon: Icon(Icons.logout_rounded),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
