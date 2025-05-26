import 'package:conference_app/models/user_model.dart';
import 'package:conference_app/views/app/contacts/contact_details.dart';
import 'package:conference_app/views/components/qr_code_scan.dart';
import 'package:conference_app/views/components/stacked_background.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class ConnectionsView extends StatefulWidget {
  const ConnectionsView({super.key});

  @override
  State<ConnectionsView> createState() => _ConnectionsViewState();
}

class _ConnectionsViewState extends State<ConnectionsView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StackedBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () => _showQrCodeScanner(context),
                      label: Text("Add a new connection"),
                      icon: Icon(Icons.qr_code_scanner_rounded),
                    ),
                  ),
                  Expanded(
                    child: Consumer<UserModel>(
                      builder: (context, user, child) {
                        return ListView.separated(
                          itemBuilder:
                              (context, index) => ContactLinkButton(
                                user.contacts[index]["uid"]!,
                                user.contacts[index]["username"]!,
                              ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: user.contacts.length,
                        );
                      },
                    ),
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

class ContactLinkButton extends StatelessWidget {
  const ContactLinkButton(this.uid, this.userName, {super.key});

  final String uid;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactDetailsView(uid, userName),
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Text(userName, style: Theme.of(context).textTheme.bodyLarge),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
