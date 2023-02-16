import 'package:flutter/material.dart';
class webScreen extends StatelessWidget {
  const webScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: Center(child: Text("this is web screen layout")),
    ));
  }
}
