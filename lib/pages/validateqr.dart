// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ivs_admin/constant/colors.dart';
import 'package:ivs_admin/pages/alreadyclaimed.dart';
import 'package:ivs_admin/pages/scanqrcode.dart';
import 'package:ivs_admin/pages/successclaim.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ValidateQR extends StatelessWidget {
  final String? data;
  const ValidateQR({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: greens,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.west_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ScanQR()),
                    );
                  },
                ),

                const SizedBox(width: 8), // Adjust the spacing as needed
                Text(
                  'Scan QR code',
                  style: GoogleFonts.montserrat(
                    color: Colors.white, // Set the text color
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8), // Adjust the spacing as needed
                const Icon(
                  Icons
                      .qr_code_scanner_outlined, // Replace with the second icon you want to use
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 35),
            Container(
              width: 337,
              height: 426,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white, // Set the container color to white
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: QrImageView(
                      data: 'data',
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                  Center(
                    child: Text(
                      data!,
                      style: GoogleFonts.commissioner(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: greens,
                      minimumSize: const Size(131, 36),
                    ),
                    onPressed: () {
                      if (data != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuccessClaim(),
                          ),
                        );
                      } else if (data == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Notclaimed(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Validate',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
