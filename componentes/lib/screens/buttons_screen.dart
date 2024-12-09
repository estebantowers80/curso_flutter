import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  //nombre de la pantalla
  static const routeName = "/buttons-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///CustomScrollView  es un widget  usa un concepto llamado
      ///SLIVERS (Appbar, sliverlist, slivergrid)
      ///solo va a a manejar los slivers  siempre va a ir con un CustomScrollview
      body: CustomScrollView(
        slivers: <Widget>[
          // este debe estar siempre envuelto dentro de un customscrollview
          SliverAppBar(
            title: const Text("Buttoms Screen"),
            floating: true,
            pinned:
                true, //si hace scroll se queda siempre arriba en false se desaparece
            expandedHeight: 50.0,
            /*flexibleSpace: Container(
              color: Colors.blue,
              child: const FlexibleSpaceBar(
                title: Text("Botones"),
              ),
            ),*/

            flexibleSpace: Image.network(
              'https://cms-imgp.jw-cdn.org/img/p/2023605/univ/art/2023605_univ_lsr_lg.jpg',
              fit: BoxFit.cover,
            ),
          ),

          //SliverList.builder(itemBuilder: (context, index) {
          //  return const Text("Hola");
          //})
          //no puedo pasarle un widget normal ocmo listview tiene que ser un SliverList

          //SliverList   es similar al ListView (widget)
          //SliverList.builder similar al ListView.bulder
          SliverList.list(
            children: [
              const Text("LOS BOTONES"),

              ///1. FilledButton  (boton de color lleno)
              ///de color completo y el texto es blanco
              const Text("\nFilled Button"),
              FilledButton(
                //todo boton tiene esta propiedad onPressed esta detona un callback
                //funcion vasia (){},
                onPressed: () {
                  //aqui se llama al api
                  // navegar a otra pantalla
                },
                //cambiar el color del boton el fondo etc
                //aqui se puede ver https://api.flutter.dev/flutter/material/ButtonStyle-class.html
                style: ButtonStyle(
                  //cambiar color boton
                  //backgroundColor: WidgetStateProperty.all(Colors.amber),
                  backgroundColor: WidgetStateProperty.resolveWith(
                    (states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Colors.red;
                      }
                      return Colors.amber;
                    },
                  ),
                ),
                //onPressed: null,   //boton desactivado
                // aqui se puede poner un widget
                //child: Text("FilledButton"),      // aqui se puede poner un widget

                //CircularProgressIndicator
                /*child: CircularProgressIndicator(
                  color: Colors.white,
                ),*/ // aqui se puede poner un widget
                child: const Text("FilledButton"),
              ),

              ///2. OutLineButton
              /// tiene un border morado y no tiene color de fondo si no le pongo
              const Text("\n OutLineButton"),
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: 200,
                  height: 30,
                  child: OutlinedButton(
                    onPressed: () {
                      //aqui accion
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.yellow),
                    ),
                    child: const Text("OnLineButton"),
                  ),
                ),
              ),

              ///3. TextButton
              /// solo aparece un texto  sin fondo sin border pero si tiene una animación de boton
              ///
              const Text("\n TextButton"),
              TextButton(
                  onPressed: () {
                    //aquie la acción a donde va o funcion
                  },
                  child: const Text("TextButton")),

              ///4. ElevatedButton
              ///

              const Text("\n ElevatedButton"),
              ElevatedButton(
                onPressed: () {
                  //aqui la accion del boton
                },
                child: const Text("ElevatedButton"),
              ),

              ///5. IconButton
              ///
              const Text("\nIconButton"),
              IconButton(
                onPressed: () {
                  //aqui la accion
                },
                icon: const Icon(
                  Icons.account_circle_outlined,
                  size: 50,
                ),
                //iconSize: 40,
                tooltip: "Usuario",
              ),
              //6. FilledButton y icon
              const Text("\nFilledButton y icon "),
              FilledButton.icon(
                onPressed: () {
                  //aqui la accion
                },
                label: const Text("FilledButton e Icono"),
                icon: const Icon(
                  Icons.add_a_photo_rounded,
                  size: 80,
                ),
              ),

              //7. Estilos de texto
              // 7.1. abierta
              const Center(
                child: Text(
                  "prueba de estilo de texto",
                  style: TextStyle(
                    //tamaño
                    fontSize: 20,
                    //color
                    color: Colors.pink,
                    //mas o menos negrita
                    fontWeight: FontWeight.w900,
                    //estilo como el italic
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              // 7.2 cerrada -> context
              // siempre va a estar cerrada en Theme.of(context)  accede al tema de la aplicacion
              // Theme.of(context).textThem  _>  los estilos de texto de la aplicación
              Text(
                "Texo con estililo de la aplicación",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "Texo con estililo de la aplicación",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "Texo con estililo de la aplicación",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
/*

import 'package:flutter/material.dart';

class ButtonsSreen extends StatelessWidget {
  const ButtonsSreen({super.key});

  static const routeName = "/buttons-screen";

  @override
  Widget build(BuildContext context) {
    
    );
  }
}*/
