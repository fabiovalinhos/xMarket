import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:xastremarketmobile/components/centered_message.dart';
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
            color: Colors.white12,
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
                // ignore: missing_return
                builder: (context, snapshop) {
                  switch (snapshop.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      break;
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      if (snapshop.hasData) {
                        final List<Product> products = snapshop.data;
                        if (products.isNotEmpty) {
                          return ListView.builder(
                            padding: EdgeInsets.all(10.0),
                            itemBuilder: (context, index) {
                              final Product product = products[index];
                              return Card(
                                color: Color(0xFF880e4f),
                                child: ListTile(
                                  title: Text(
                                    product.produto,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.red[300],
                                    ),
                                  ),
                                  subtitle: Text(
                                    product.localizacao,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: products.length,
                          );
                        }
                      }
                      return CenteredMessage(
                        'Nenhum produto encontrado',
                        icon: Icons.warning,
                      );
                      break;
                  }
                  return CenteredMessage('Unknown error');
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
