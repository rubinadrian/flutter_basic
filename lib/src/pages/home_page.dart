import 'package:flutter/material.dart';

import 'lista_opciones_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista')),
      body: Container(child: LitaOpciones(), padding: EdgeInsets.only(top: 8),)
    );
  }

  
}

