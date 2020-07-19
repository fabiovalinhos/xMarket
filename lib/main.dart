import 'package:flutter/material.dart';
import 'package:xastremarketmobile/screens/dashboard.dart';

void main() {
  runApp(XMarketMobile());
}

class XMarketMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red[500],
        accentColor: Colors.red,
        scaffoldBackgroundColor: Colors.white70,
      ),
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
