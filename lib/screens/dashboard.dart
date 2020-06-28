import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:xastremarketmobile/http/webclients/product_webclient.dart';
import 'package:xastremarketmobile/models/product.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ProductWebClient _webClient = ProductWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xastre Market'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: double.infinity,
            color: Colors.red[800],
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Image.asset(
                'images/xastreLogo.png',
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            child: Expanded(
              child: FutureBuilder<List<Product>>(
                future: _webClient.findAll(),
                builder: (context, snapshop) {
                  switch (snapshop.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      break;
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      final List<Product> products = snapshop.data;
                      if (products.isNotEmpty) {}
                      break;
                  }
                  ;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Container(
//child: Expanded(
//child: ListView(
//padding: EdgeInsets.all(10.0),
//children: [
//Card(
//color: Color(0xFF880e4f),
//child: ListTile(
//title: Text(
//'Produto 1',
//style: TextStyle(
//fontSize: 16.0,
//color: Colors.red[300],
//),
//),
//subtitle: Text(
//'Descricação do produto 1',
//style: TextStyle(
//fontSize: 12.0,
//color: Colors.black,
//),
//),
//),
//),
//],
//),
//),
//),
