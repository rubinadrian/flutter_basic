import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  bool _isLoading = false;
  List<String> _listaOpciones = [];
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() { 
    _addImages();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // _addImages();
        _demorarConsultaImagenes();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista Dinamica')),
      body: Stack(children: <Widget>[
        _crearListView(),
        _crearLoading()
      ],),
    );
  }

  Widget _crearListView() {
    
    return RefreshIndicator(
          onRefresh: _refrescarPagina,
          child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaOpciones.length,
          itemBuilder: (context, index){
            return FadeInImage(
              image: NetworkImage(_listaOpciones[index]),
              placeholder:  AssetImage('assets/jar-loading.gif'),
              height: 300,
              );
          }),
    );
  }

  Future<void> _demorarConsultaImagenes() async{
    
    setState(() {
      _isLoading = true;
    });


    return new Timer(Duration(seconds: 2), (){
      _addImages();
      _moveScroll();
    });
  

  }

  Future<Null> _refrescarPagina() async {
    final length = _listaOpciones.length;
    List<String> _tempList = [];

    for(int i = length; i<length+5 ;i++) {
      _tempList.add(_getUrlImagen(i+1));
    }

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _listaOpciones.insertAll(0, _tempList);
    });
  }

  void _moveScroll() {
    _scrollController.animateTo(
              _scrollController.position.pixels + 100,
              curve: Curves.fastOutSlowIn,
              duration: Duration( milliseconds: 250)
            );
  }

  void _addImages() {
    final length = _listaOpciones.length;

    setState((){
      _isLoading = false;
      for(int i = length; i<length+5 ;i++) {
      _listaOpciones.add(_getUrlImagen(i+1));
      }
    });

  
  }

  String _getUrlImagen(index) {
    return 'https://picsum.photos/id/$index/400/300';
  }

  _crearLoading() {
    if(_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
                child: CircularProgressIndicator(),
                height: 30.0,
                width: 30.0,
              ),
            SizedBox(height: 20,)
          ],
        ),
      );
    } else {
      return Container();
    }
  }


  

}