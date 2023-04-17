import 'package:flutter/material.dart';
import 'package:g3_project/routes.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class GameScreen extends StatelessWidget {
  static const String routeName = '/game';
  final String collectionId = 'Gu7W4985AZVfnggYHdEgSGiGcs82';
  late final String gameID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title:  Text('GAME'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () async {
                gameID = await FlutterBarcodeScanner.scanBarcode('black', 'EXIT', true, ScanMode.QR);
                if(gameID != null  && gameID.isNotEmpty){
                  Navigator.pushNamed(context, Routes.counter);
                  gameID = "";
                }


              },
              child: Text('Join Game'),
            ),
            SizedBox(height: 32),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Create a New Game',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    QrImage(
                      data:collectionId, // Replace with your game URL
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}