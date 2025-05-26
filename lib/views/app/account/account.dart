import 'package:conference_app/models/login_provider.dart';
import 'package:conference_app/models/user_model.dart';
import 'package:conference_app/views/app/account/edit_account.dart';
import 'package:conference_app/views/components/stacked_background.dart';
import 'package:flutter/material.dart';
import 'package:hyperlink/hyperlink.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  Future<void> _launchUrl(BuildContext context, String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Could not open link", textAlign: TextAlign.center),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StackedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                child: Consumer<UserModel>(
                  builder: (context, user, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              user.userName,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Spacer(),
                            TextButton.icon(
                              onPressed:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditAccountView(),
                                    ),
                                  ),
                              label: Text("Edit"),
                              icon: Icon(Icons.edit),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          user.userInfo!.email ?? "",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        SizedBox(height: 12),
                        if (user.bio.isNotEmpty)
                          Text(
                            user.bio,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        if (user.bio.isNotEmpty) SizedBox(height: 12),
                        Text(
                          "Links:",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(height: 12),
                        if (user.links.isEmpty)
                          Text("You don't have any website links yet."),
                        for (Map<String, String> link in user.links)
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Icon(Icons.link),
                                SizedBox(width: 6),
                                HyperLink(
                                  linkCallBack:
                                      (msg) => _launchUrl(context, msg),
                                  text: "[${link["name"]}](${link["url"]})",
                                  linkStyle: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: 12),
                        Center(
                          child: Consumer<LoginProvider>(
                            builder:
                                (context, auth, child) => FilledButton.icon(
                                  onPressed: () => auth.logout(),
                                  label: Text("Log out"),
                                  icon: Icon(Icons.logout_rounded),
                                ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
