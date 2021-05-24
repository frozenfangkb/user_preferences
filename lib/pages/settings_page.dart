import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();

    _textController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
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
                  setState(() {
                    _colorSecundario = value;
                  });
                }),
            RadioListTile(
              value: 1,
              groupValue: _genero,
              onChanged: (value) {
                setState(() {
                  _genero = value;
                });
              },
              title: Text('Masculino'),
            ),
            RadioListTile(
              value: 2,
              groupValue: _genero,
              onChanged: (value) {
                setState(() {
                  _genero = value;
                });
              },
              title: Text('Femenino'),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el teléfono'),
                onChanged: (value) {},
                controller: _textController,
              ),
            )
          ],
        ));
  }
}
