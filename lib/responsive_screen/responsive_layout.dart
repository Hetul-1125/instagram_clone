import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/dimention.dart';

class Responsive extends StatelessWidget {
  final Widget mobileScreenlayout;
  final Widget webScreenlayout;
  const Responsive(
      {Key? key,
      required this.mobileScreenlayout,
      required this.webScreenlayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return constrain.maxWidth > webScreenSize ? webScreenlayout : mobileScreenlayout;
    });
  }
}
