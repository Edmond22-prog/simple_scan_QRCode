import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScan extends StatefulWidget {
  const QRScan({Key? key}) : super(key: key);

  @override
  _QRScanState createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {

  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildQrView(context),
            Positioned(bottom: 10, child: buildResult())
          ],
        ),
      ),
    );
  }

  Widget buildResult() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white70
        ),
        child: TextButton(
          child: Text(
            barcode != null ? 'Result : ${barcode!.code}' : 'Scan a code!',
            maxLines: 3,
          ),
          onPressed: (){
            if(barcode != null){
              Navigator.pushReplacementNamed(
                  context,
                  '/registration',
                  arguments: {
                    'information' : barcode!.code
                  }
              );
            }
          },
        )
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
        borderWidth: 10,
        borderLength: 20,
        borderRadius: 20,
        borderColor: Theme.of(context).accentColor,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        barcode = scanData;
      });
    });
  }
}

