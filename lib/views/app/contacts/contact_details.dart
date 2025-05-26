import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_app/models/user_model.dart';
import 'package:conference_app/views/components/stacked_background.dart';
import 'package:flutter/material.dart';
import 'package:hyperlink/hyperlink.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsView extends StatefulWidget {
  const ContactDetailsView(this.uid, this.userName, {super.key});

  final String uid;
  final String userName;

  @override
  State<ContactDetailsView> createState() => _ContactDetailsViewState();
}

class _ContactDetailsViewState extends State<ContactDetailsView> {
  Future<UserModel>? _data;

  Future<UserModel> _loadUserData() async {
    UserModel user = UserModel();

    final db = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> document =
        await db.collection("users").doc(widget.uid).get();

    if (!document.exists) {
      throw "Couldn't find user";
    }

    Map<String, dynamic> data = document.data()!;

    user.userName = data["username"] ?? "";
    user.email = data["email"] ?? "";
    user.bio = data["bio"] ?? "";
    if (data["links"] != null) {
      user.links =
          List.from(
            data["links"],
          ).map((e) => Map<String, String>.from(e)).toList();
    }

    return user;
  }

  @override
  void initState() {
    _data = _loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _data,
      builder: (context, snapshot) {
        Widget child;
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            child = ContactDetails(snapshot.data!);
          } else {
            child = Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, size: 160),
                    SizedBox(height: 12),
                    Text("Could not load user information!"),
                  ],
                ),
              ),
            );
          }
        } else {
          child = Scaffold(
            appBar: AppBar(),
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

class ContactDetails extends StatefulWidget {
  const ContactDetails(this.user, {super.key});

  final UserModel user;

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
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
    UserModel user = widget.user;

    return Scaffold(
      appBar: AppBar(),
      body: StackedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.userName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: 12),
                    Text(
                      user.email,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                              linkCallBack: (msg) => _launchUrl(context, msg),
                              text: "[${link["name"]}](${link["url"]})",
                              linkStyle: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
