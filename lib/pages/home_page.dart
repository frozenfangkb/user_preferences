import 'package:flutter/material.dart';
import 'package:user_preferences/pages/settings_page.dart';
import 'package:user_preferences/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User preferences'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: '),
          Divider(),
          Text('Género: '),
          Divider(),
          Text('Nombre de usuario: '),
          Divider(),
        ],
      ),
    );
  }
}
