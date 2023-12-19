// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ivs_admin/pages/create_user.dart';

class SuccessClaim extends StatefulWidget {
  const SuccessClaim({super.key});

  @override
  State<SuccessClaim> createState() => _SuccessClaimState();
}

class _SuccessClaimState extends State<SuccessClaim> {
  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
      return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CreateUser()));
        return false;
      },
    child:Scaffold(
      body: Center(
        child: Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: Colors.white,
          child: Container(
            width: 350,
            height: 170,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: Color.fromRGBO(43, 135, 97, 1),
                  size: 60.0,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Your coupon Successfully claimed...!",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  // overflow: TextOverflow.ellipsis,
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
