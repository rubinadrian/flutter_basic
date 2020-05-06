import 'package:flutter/material.dart';

final _iconos = <String, IconData>{
  'add_alert'     : Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open'   : Icons.folder_open,
  'arrow_right'   : Icons.arrow_right,
  'blur_linear'   : Icons.blur_linear,
  'widgets'       : Icons.widgets,
  'swap_horizontal_circle'        : Icons.swap_horizontal_circle,
  'list'          : Icons.list
};


Icon getIcon(String nombreIcono) {

  return Icon(_iconos[nombreIcono], color: Colors.blue);

}