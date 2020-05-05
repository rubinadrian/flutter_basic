import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lista/src/pages/alertas_page.dart';
import 'package:lista/src/pages/animaciones_page.dart';
import 'package:lista/src/pages/avatars_page.dart';
import 'package:lista/src/pages/formulario_page.dart';
import 'package:lista/src/pages/home_page.dart';
import 'package:lista/src/pages/tarjetas_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
          const Locale('en'), // English
          const Locale('es'), // Spanish
        ],
      title: 'RubinAdrianCursoFernandoHerrera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/'             : ( BuildContext context ) => HomePage(),
        'alert'         : ( BuildContext context ) => AlertasPage(),
        'avatar'        : ( BuildContext context ) => AvatarsPage(),
        'card'          : ( BuildContext context ) => TarjetasPage(),
        'animaciones'   : ( BuildContext context ) => AnimacionesPage(),
        'formulario'    : ( BuildContext context ) => FormularioPage(),
      },
      initialRoute: '/',
      onGenerateRoute: (RouteSettings setting ){

        print('Ruta que fue llamada: ${setting.name}');

        return MaterialPageRoute(
          builder: ( BuildContext context ) => HomePage()
        );

      },
    );
  }
}
