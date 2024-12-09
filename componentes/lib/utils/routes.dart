import 'package:componentes/screens/alerts_screen.dart';
import 'package:componentes/screens/animations_screen.dart';
import 'package:componentes/screens/buttons_screen.dart';
import 'package:componentes/screens/forms_2_screen.dart';
import 'package:componentes/screens/forms_screen.dart';
import 'package:componentes/screens/forms_screen_2.dart';
import 'package:componentes/screens/home_screen.dart';
import 'package:componentes/screens/infinity_scroll_screen.dart';
import 'package:componentes/screens/list_screen.dart';

import '../screens/layout_screen.dart';

final routes = {
//definmos esta varialbe que va a ha cer un map 
//calve  y valor
/// el nombre de la pantalla . builder -> (context) => NombrePantalla(),

  HomeScreen.routeName   : (context) => const HomeScreen(), 
  LayoutScreen.routeName : (context) => const LayoutScreen(),
  AlertsScreen.routeName : (context) => const AlertsScreen(),
  AnimationsScreen.routeName : (context) => const AnimationsScreen(),
  ButtonsScreen.routeName : (context) => const ButtonsScreen(),
  FormsScreen.routeName : (context) => const FormsScreen(),
  InfinityScrollScreen.routeName : (context) => const InfinityScrollScreen(),
  ListScreen.routeName : (context) => const ListScreen(),
  FormsScreen2.routeName : (context) => const FormsScreen2(),
  Forms2Screen.routeName : (context) => const Forms2Screen(),

};