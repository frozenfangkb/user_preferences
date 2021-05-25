import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences/shared_prefs/user_preferences.dart';
import 'package:user_preferences/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'David';

  TextEditingController _textController;
  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;

    _textController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Color secundario'),
                onChanged: (value) {
                  prefs.colorSecundario = value;
                  setState(() {
                    _colorSecundario = value;
                  });
                }),
            RadioListTile(
              value: 1,
              groupValue: _genero,
              onChanged: _setSelectedRadio,
              title: Text('Masculino'),
            ),
            RadioListTile(
              value: 2,
              groupValue: _genero,
              onChanged: _setSelectedRadio,
              title: Text('Femenino'),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el teléfono'),
                onChanged: (value) {
                  prefs.nombre = value;
                },
                controller: _textController,
              ),
            )
          ],
        ));
  }

  _setSelectedRadio(int value) async {
    prefs.genero = value;

    setState(() {
      _genero = value;
    });
  }
}
