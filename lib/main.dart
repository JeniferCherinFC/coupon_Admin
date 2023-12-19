import 'package:flutter/material.dart';
import 'package:ivs_admin/pages/signin.dart';


void main() {
  runApp(const GetStart());
}

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
