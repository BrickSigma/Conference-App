import 'package:conference_app/models/schedule_provider.dart';
import 'package:conference_app/models/theme_provider.dart';
import 'package:conference_app/models/user_model.dart';
import 'package:conference_app/utils/utils.dart';
import 'package:conference_app/views/components/qr_code_scan.dart';
import 'package:conference_app/views/components/stacked_background.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void _showQrCodeScanner(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder:
          (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: QrCodeScanView(),
          ),
    );
  }

  String _dailyMessage(String? username) {
    final currentTime = DateTime.now();
    if (currentTime.hour < 12) {
      return "Good morning ${username ?? ""}";
    } else if (currentTime.hour < 18) {
      return "Good afternoon ${username ?? ""}";
    } else {
      return "Good evening ${username ?? ""}";
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context, listen: false);
    ScheduleProvider scheduleProvider = Provider.of(context, listen: false);
    List<ScheduleModel> currentSchedules = scheduleProvider.getScheduleForDate(
      DateTime.now(),
    );

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
                  if (currentSchedules.isNotEmpty)
                    for (ScheduleModel schedule in currentSchedules)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SizedBox(
                          width: double.infinity,
                          child: ScheduleCard(schedule),
                        ),
                      ),
                  if (currentSchedules.isEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: SizedBox(
                        width: double.infinity,
                        child: UpcommingSessionCard(),
                      ),
                    ),
                  Text(
                    "Quick actions",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilledButton.icon(
                        onPressed: () => _showQrCodeScanner(context),
                        label: Text("QR Code Connect"),
                        icon: Icon(Icons.qr_code_scanner_rounded),
                      ),
                      SizedBox(height: 12),
                      Consumer<ThemeProvider>(
                        builder:
                            (context, theme, child) => FilledButton.icon(
                              onPressed: () => theme.flipColorTheme(),
                              label: Text(
                                theme.lightTheme ? "Dark Mode" : "Light Mode",
                              ),
                              icon: Icon(
                                theme.lightTheme
                                    ? Icons.dark_mode
                                    : Icons.light_mode,
                              ),
                            ),
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

class ScheduleCard extends StatelessWidget {
  final ScheduleModel data;

  const ScheduleCard(this.data, {super.key});

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
            Text(data.title),
            SizedBox(height: 6),
            Text(
              formatTime(data.start.toDate()),
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
