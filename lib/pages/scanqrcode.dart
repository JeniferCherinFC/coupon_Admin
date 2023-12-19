// ignore: unused_import
// ignore_for_file: unused_local_variable



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ivs_admin/constant/colors.dart';
import 'package:ivs_admin/pages/claimeddetails.dart';
import 'package:ivs_admin/pages/validateqr.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({Key? key}) : super(key: key);

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  late Future<String?> cameraScanResult;
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? qrcontroller;
  String result = "";
  void _qrscanFunction(QRViewController qrviewcontroller) {
    qrcontroller = qrviewcontroller;
    qrviewcontroller.scannedDataStream.listen((event) {
      setState(() {
        result = event.code!;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // cameraScanResult = scanner.scan();
  }

  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greens,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.token_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClaimDetails()),
              );
              // do something
            },
          )
        ],
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0.0,0,15,40,),
                //   child: Align(
                //     alignment: Alignment.topRight,
                //     child: Icon(
                //       Icons.qr_code_scanner_outlined,
                //       color: greens,
                //       size: 25,
                //     ),
                //   ),
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Scan QR code',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: greens,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                        height: 270,
                        width: 270,
                        child: QRView(
                            key: qrKey, onQRViewCreated: _qrscanFunction)),
                    const SizedBox(height: 25),
                    Text(
                      'Place the code inside the frame',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: greens,
                        minimumSize: const Size(150, 31),
                      ),
                      onPressed: () {
                        if (result != "") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ValidateQR(data: result),
                            ),
                          );
                          // log(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::${result.toString()}");
                        }
                      },
                      child: Text(
                        'Scan',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
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
    );
  }
}
