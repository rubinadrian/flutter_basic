import 'package:flutter/material.dart';

class FormularioPage extends StatefulWidget {
  FormularioPage({Key key}) : super(key: key);

  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {

  String _nombre = '';
  String _mail = '';
  String _password= '';
  String _fecha = '';
  
  TextEditingController _fechaCtrl = new TextEditingController();

  List _opcionesDropDown = ['Gerente', 'Subgerente', 'Presidente', 'Administrativo'];
  String _dropdownOptSelected = '';

  @override
  void initState() {
    _dropdownOptSelected = _opcionesDropDown[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(title: Text('Formulario')),
         body: ListView(
           padding: EdgeInsets.all(8.0),
           children: <Widget>[
           _crearNameField(),
           Divider(),
           _crearMailField(),
           Divider(),
           _crearPasswordField(),
           Divider(),
           _crearDataPicker(context),
           Divider(),
           _crearDropDown(),
           Divider(),
           _showBusinessCard(),
           
         ],),
       ),
    );
  }

  _crearNameField() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      onChanged: (valor) => setState(() => _nombre=valor),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          icon: Icon(Icons.supervised_user_circle),
          suffixIcon: Icon(Icons.supervisor_account),
          counter: Text('${_nombre.length}'),
          helperText: 'Nombre',
          hintText: 'Ingrese el nombre',
          labelText: 'Nombre',
        ),
      );
  }

  _crearMailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress, // cambia el teclado para mail
      onChanged: (valor) => setState(() => _mail=valor),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          icon: Icon(Icons.mail),
          suffixIcon: Icon(Icons.mail_outline),
          counter: Text('${_mail.length}'),
          helperText: 'Mail',
          hintText: 'Ingrese el mail',
          labelText: 'Mail',
        ),
      );
  }

  _crearPasswordField() {
    return TextField(
      obscureText: true, // oculta los caracteres con puntos.
      onChanged: (valor) => setState(() => _password=valor),
      decoration: InputDecoration(
          icon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.lock_outline),
          hintText: 'Ingrese el password',
          labelText: 'Password',
        ),
      );
  }

  _showBusinessCard() {
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            FlutterLogo( size: 100.0 ),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('$_nombre'),
              Text('$_mail'),
              SizedBox(height: 40.0,),
              Text('$_dropdownOptSelected'),
            ],
          ),
          ],
        ),
      ),
    );
  }

  _crearDataPicker( BuildContext context) {

    return TextField(
      controller: _fechaCtrl,
      onTap: () {
        // No permito el foco en este TextField
        FocusScope.of(context).requestFocus(new FocusNode());
        // Llamo al modal del picker
        _selectDate(context);

      },
      decoration: InputDecoration(
          icon: Icon(Icons.calendar_today),
          suffixIcon: Icon(Icons.calendar_view_day),
          labelText: 'Fecha Nacimiento',
        ),
     );

  }

  void _selectDate(BuildContext context) async {
    DateTime picker = await showDatePicker(
          locale: Locale('es'),
          context: context, 
          initialDate: new DateTime.now(), 
          firstDate: new DateTime.now().subtract(Duration(days: 1000)), 
          lastDate: new DateTime.now().add(Duration(days: 1000)),
    );

    if(picker != null) {
      setState((){
        print( picker.toLocal() );
        _fecha = picker.toString();
        _fechaCtrl.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> _getOptionDropDown() {

    List<DropdownMenuItem<String>> _lista = new List();

    _opcionesDropDown.forEach((opt){

      _lista.add(DropdownMenuItem(
        value: opt,
        child: Text(opt),
      ));

    });

    return _lista;

  }

  _crearDropDown() {
    
    return DropdownButtonFormField(
      isDense: true,
      value: _dropdownOptSelected,
      isExpanded: true,
      items: _getOptionDropDown(),
      onChanged: (opt) => setState(()=>_dropdownOptSelected = opt ),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        icon: Icon(Icons.check_box),
        labelText: 'Cargo'
      ),
    );
  }

}


