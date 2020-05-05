import 'dart:math';

import 'package:flutter/material.dart';


class AnimacionesPage extends StatefulWidget {
  AnimacionesPage({Key key}) : super(key: key);

  @override
  _AnimacionesPageState createState() => _AnimacionesPageState();
}

class _AnimacionesPageState extends State<AnimacionesPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(20.0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Animaciones')),
        body: Center(child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: _width,
          height: _height,
          decoration: BoxDecoration( 
            color: _color, 
            borderRadius: _borderRadius)
        )
      ),
      floatingActionButton: FloatingActionButton(onPressed: _animateBox, child: Icon(Icons.play_arrow, color: Colors.white), backgroundColor: Colors.grey),
    );
  }

  void _animateBox() {

    setState(() {
      _width  = Random.secure().nextInt(200).toDouble() + 20.0;
      _height = Random.secure().nextInt(200).toDouble() + 20.0;
      _color  = Color.fromRGBO(Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255), 1);
      _borderRadius = BorderRadius.circular(Random.secure().nextInt(20).toDouble());
    });
  }
}