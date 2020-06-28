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
        primaryColor: Colors.red[900],
        accentColor: Colors.red,
        scaffoldBackgroundColor: Colors.red[900],
      ),
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
