import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ivs_admin/constant/colors.dart';

class SubscriptionDetails extends StatelessWidget {
  final String qrID;
  final String name;

  const SubscriptionDetails({
    Key? key,
    required this.qrID,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 70,
        width: 318,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(245, 245, 245, 1),
        ),
        child: Row(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'QR ID',
                        style: GoogleFonts.commissioner(
                          color: greens,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ': $qrID',
                        style: GoogleFonts.commissioner(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    Text(
                      'Name:',
                      style: GoogleFonts.commissioner(
                        color: greens,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      name,
                      style: GoogleFonts.commissioner(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
                ]),
          ],
        ),
      ),
    );
  }
}
