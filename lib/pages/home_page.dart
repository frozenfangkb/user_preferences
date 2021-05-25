import 'package:flutter/material.dart';
import 'package:user_preferences/shared_prefs/user_preferences.dart';
import 'package:user_preferences/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final prefs = new UserPreferences();

    return Scaffold(
      appBar: AppBar(
        title: Text('User preferences'),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Género: ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
