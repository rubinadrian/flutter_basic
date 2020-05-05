import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


class _MenuProvider {

  Future<List<dynamic>> getMenu() async {
    final dataJson = await rootBundle.loadString('data/menu_opciones.json');
    Map dataMap = json.decode(dataJson);
    return dataMap['rutas'];
  }

}

final menuProvider = new _MenuProvider();

