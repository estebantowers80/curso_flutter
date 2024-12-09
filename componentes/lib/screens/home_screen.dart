import 'package:componentes/screens/forms_2_screen.dart';

import 'forms_screen_2.dart';

import 'alerts_screen.dart';
import 'animations_screen.dart';
import 'buttons_screen.dart';
import 'forms_screen.dart';
import 'infinity_scroll_screen.dart';
import 'list_screen.dart';
import 'layout_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //1. rutas  damos el nombre a la pantalla 
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COMPONENTES"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // https://api.flutter.dev/flutter/material/ListTile-class.html
          ListTile(
            title: const Text("Estructuras o Layouts"),
            onTap: () {
              /// 1. navegación con un builder - Navigator
              /// https://docs.flutter.dev/cookbook/navigation/navigation-basics
              ///
              /// como se estructura
              /// Route:
              ///   MaterialPageRoute(
              ///                   builder: (context) => const LayoutScreen(),
              ///   ),
              ///
              
              //primera forma del punto uno
              /*
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LayoutScreen(),
                ),
              );
              */
              //OTRA FORMA   es mas facil de utilizar  
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayoutScreen(),
                ),
              );*/

              /// 2. navegación con rutas
              ///   1 debemos darle un nombre a la pantalla
              ///   2 debemos definir un archivo de rutas
              ///   3	Declarar la ruta en el main.dart
              ///   4 PushNamed para ir a otra pantalla 
              
              Navigator.pushNamed(context, LayoutScreen.routeName);
              
            },
            trailing: const Icon(Icons.arrow_forward_ios),
            leading: const Icon(Icons.account_balance_outlined),
            enabled: true,
          ),
          ListTile(
              title: const Text("Tipos de Listas"),
              onTap: (){
                Navigator.pushNamed(context, ListScreen.routeName);
              },
              trailing: const Icon(Icons.list),
              leading: const Icon(Icons.account_balance_outlined)),
          ListTile(
              title: const Text("Botones"),
              onTap: () {
                Navigator.pushNamed(context, ButtonsScreen.routeName);
              },
              trailing: const Icon(Icons.add_box_rounded),
              leading: const Icon(Icons.account_balance_outlined)),
          ListTile(
              title: const Text("Alertas"),
              onTap: () {
                Navigator.pushNamed(context, AlertsScreen.routeName);
              },
              trailing: const Icon(Icons.add_alert_sharp),
              leading: const Icon(Icons.account_balance_outlined)),
          ListTile(
              title: const Text("Imagenes"),
              onTap: () {
                Navigator.pushNamed(context, FormsScreen.routeName);
              },
              trailing: const Icon(Icons.add_card_rounded),
              leading: const Icon(Icons.account_balance_outlined)),
          ListTile(
              title: const Text("Infinity Scroll"),
              onTap: () {
                 Navigator.pushNamed(context, InfinityScrollScreen.routeName);
              },
              trailing: const Icon(Icons.align_horizontal_center_sharp),
              leading: const Icon(Icons.account_balance_outlined)),
          ListTile(
              title: const Text("Animaciones"),
              onTap: () {
                 Navigator.pushNamed(context, AnimationsScreen.routeName);
              },
              trailing: const Icon(Icons.ac_unit_rounded),
              leading: const Icon(Icons.account_balance_outlined)),
          ListTile(
              title: const Text("Formularios"),
              onTap: () {
                Navigator.pushNamed(context, FormsScreen2.routeName);
              },
              trailing: const Icon(Icons.add_card_rounded),
              leading: const Icon(Icons.account_balance_outlined)),
         ListTile(
              title: const Text("Formularios2"),
              onTap: () {
                Navigator.pushNamed(context, Forms2Screen.routeName);
              },
              trailing: const Icon(Icons.add_card_rounded),
              leading: const Icon(Icons.account_balance_outlined)),
        ],
      ),
    );
  }
}
