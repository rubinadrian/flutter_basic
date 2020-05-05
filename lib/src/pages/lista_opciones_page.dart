import 'package:flutter/material.dart';
import 'package:lista/src/providers/menu_provider.dart';
import 'package:lista/src/utils/icons_util.dart';


class LitaOpciones extends StatelessWidget {
  // const LitaOpciones({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: menuProvider.getMenu(),
      initialData: <Widget>[],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot ) {
        return ListView(children: _crearListaOpciones(snapshot.data, context));
      },
    );
  }

  //
  List<Widget> _crearListaOpciones(List<dynamic> _opciones, BuildContext context) {

    return _opciones.map((opt){
      return Column(
        children: <Widget>[
          ListTile(
                contentPadding: EdgeInsets.only(left: 20),
                dense: false,
                enabled: true,
                isThreeLine: false,
                onLongPress: () { print('OnLongPress'); },
                onTap: () { Navigator.pushNamed(context, opt['ruta']); },
                selected: true,
                title: Text(opt['texto'], style: TextStyle(color: Colors.black54),),
                // subtitle: Text('', style: TextStyle(color: Colors.grey),),
                leading: getIcon(opt['icon']), // icono principal
                trailing: getIcon(opt['arrow_right']), // icono al final
              ),
          Divider()
        ]);
    }).toList();
  }

  

}