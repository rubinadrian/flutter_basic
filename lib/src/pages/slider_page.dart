import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valueSlider = 100.0;
  bool _enabled = true;

  final _imagenes = [
    'https://pngimg.com/uploads/captain_america/captain_america_PNG50.png',
    'http://www.pngpix.com/wp-content/uploads/2016/10/PNGPIX-COM-Superman-PNG-Transparent-Image-1.png'
  ];

  int _indexImageSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(title: Text('Slider'),),
         floatingActionButton: FloatingActionButton(onPressed: (){
           setState(() {
             _indexImageSelected = _indexImageSelected==1?0:1;
           });
         },
         child: Icon(Icons.swap_horizontal_circle),),
         body: Container(
           padding: EdgeInsets.only(top: 20.0),
           child: Column(
             children: [ 
               _crearCheckbox(),
              _crearSwitch(),
               Slider(
                  value: _valueSlider,
                  min: 50,
                  max: 250,
                  label: 'Tamaño de la imagen',
                  onChanged: (_enabled==false)?null:(newValue){
                    setState(() {
                      _valueSlider = newValue;
                    });
                  },
               ),
               SizedBox(height: 50.0,),
               FadeInImage(
                 height: _valueSlider,
                 placeholder: AssetImage('assets/jar-loading.gif'), 
                 image: NetworkImage(_imagenes[_indexImageSelected]))
             ]
           ),
         ),
    );
  }


  Widget _crearCheckbox() {

    return CheckboxListTile(
      title: Text('Permite cambiar tamaño'),
      value: _enabled,
      onChanged: (value){ 
        setState(() {
          _enabled = value;
        });
      });
  }

  Widget _crearSwitch() {

    return SwitchListTile(
      title: Text('Permite cambiar tamaño'),
      value: _enabled,
      onChanged: (value){ 
        setState(() {
          _enabled = value;
        });
      });
  }


}

