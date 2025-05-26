import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conference_app/views/app/contacts/contact_details.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanView extends StatefulWidget {
  const QrCodeScanView({super.key});

  @override
  State<QrCodeScanView> createState() => _QrCodeScanViewState();
}

class _QrCodeScanViewState extends State<QrCodeScanView> {
  void _handleScan(BuildContext context, String? data) async {
    if (data == null) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Couldn't scan QR code", textAlign: TextAlign.center),
        ),
      );
      return;
    }

    final db = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> document =
        await db.collection("users").doc(data).get();

    if (!document.exists && context.mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Couldn't scan QR code", textAlign: TextAlign.center),
        ),
      );
      return;
    }

    String uid = data;
    String userName = document.data()!["username"] ?? "";

    if (context.mounted) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContactDetailsView(uid, userName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: MobileScanner(
              fit: BoxFit.fitWidth,
              onDetect: (barcodes) => _handleScan(context, barcodes.barcodes.first.displayValue),
            ),
          ),
        ],
      ),
    );
  }
}
