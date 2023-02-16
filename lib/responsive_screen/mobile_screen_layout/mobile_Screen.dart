import 'package:flutter/material.dart';
class mobileScreen extends StatelessWidget {
  const mobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: Center(child: Text("This is mobile screen layout")),
    ));
  }
}
