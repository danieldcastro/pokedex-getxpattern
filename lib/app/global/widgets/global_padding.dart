import 'package:flutter/material.dart';

class GlobalPadding extends StatelessWidget {
  final Widget child;
  GlobalPadding({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(child: child, padding: EdgeInsets.symmetric(horizontal: 25));
  }
}
