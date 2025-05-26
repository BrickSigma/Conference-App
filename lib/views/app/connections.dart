import 'package:conference_app/views/components/qr_code_scan.dart';
import 'package:conference_app/views/components/stacked_background.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
          child: SingleChildScrollView(
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
