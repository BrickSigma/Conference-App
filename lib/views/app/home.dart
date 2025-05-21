import 'package:conference_app/models/user_model.dart';
import 'package:conference_app/views/components/stacked_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  String _dailyMessage(String? username) {
    final currentTime = DateTime.now();
    if (currentTime.hour < 12) {
      return "Good morning ${username ?? ""}";
    } else if (currentTime.hour < 6) {
      return "Good afternoon ${username ?? ""}";
    } else {
      return "Good evening ${username ?? ""}";
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context, listen: false);

    return Scaffold(
      body: StackedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _dailyMessage(user.userName),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Upcomming sessions",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: UpcommingSessionCard(),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Quick actions",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      FilledButton.icon(
                        onPressed: () {},
                        label: Text("QR Code Connect"),
                        icon: Icon(Icons.qr_code_scanner_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UpcommingSessionCard extends StatelessWidget {
  const UpcommingSessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text("No sessions planned for today"),
      ),
    );
  }
}
