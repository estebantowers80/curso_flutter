import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  //1. rutas  damos el nombre a la pantalla
  static const routeName = "/layout-screen"; //con guion medio

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///creamos un AppBard
      appBar: AppBar(
        title: const Text("Layout"),
        leading: IconButton(
          onPressed: () {
            /// navegacion 
            /// pop para ir una pagina atrás 
            /// push a una pagina adelante o una determinada 
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        /// PROPIEDADES DEL COLUMN
         /// Alinear los elementeos en el ejeprincipal >  mainAxisAlignment
         /// Alinear los elementos en el ejec secundario -> crossAxisAlignment
         /// Definir el tamaño de lo que ocupa verticalmente -> mainAxisSize
         /// 
        crossAxisAlignment: CrossAxisAlignment.start,   // A LA IZQUIERDA
        //crossAxisAlignment: CrossAxisAlignment.end,   // A LA DERECHA
        //crossAxisAlignment: CrossAxisAlignment.stretch,   // OCUPA todo el espacio 

        //mainAxisAlignment: MainAxisAlignment.center, // centro de la pantalla
        //mainAxisAlignment: MainAxisAlignment.end, // abajo 
        mainAxisAlignment: MainAxisAlignment.start, // arriba
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly, // se queda con epacios centrado de forma vertical 
        //mainAxisAlignment: MainAxisAlignment.spaceAround, // se queda con epacios centrado de forma vertical 

        mainAxisSize: MainAxisSize.max,    // por dejecto ocupa todo el tamaño disponible
        //mainAxisSize: MainAxisSize.min,    // ocupa el minimo tañano 

        children: [
        
          ///widgets
          /// Container - contenedor le podemos dar color, 
          /// bordes sombreado, como una caja donde poner cosas
          Container(
            color: Colors.red,
            height: 100,
            width: MediaQuery.of(context).size.width / 2 ,
          ),

          const SizedBox(
            height: 20
          ),

          Container(
            color: Colors.blue,
            height: 80,
            width: 90,
          ),
          
          Container(
            color: Colors.amber.shade100,
            height: 49,
            width: 40,
          ),
          /// ROW -> FILAS permite poner widget unos con otros 
          /// mainAxisAlignment - eje horizontal
          /// crossAxisAlignment - eje vertical 
          /// mainAxisSize - tamaño total de la fila 
          Row(
            children: [
              Container(
                color: Colors.yellow,
                width: 50,
                height: 50,
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),

                width: 50,
                height: 50,
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  gradient: const RadialGradient(
                    colors: [
                      Colors.pink,
                      Colors.yellow,
                      Colors.orange
                    ],
                  ),
                ),

                width: 50,
                height: 50,
              ),


              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    stops: [0.1, 0.3, 0.1],
                    colors: [
                      Colors.pink,
                      Colors.yellow,
                      Colors.orange
                    ],
                  ),
                ),

                width: 50,
                height: 50,
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 50,
                height: 50,
              ),
              
              //GestureDetector - detectar gestos  envolver el widget que quiere dar un gesto
              GestureDetector
              (
                onTap: () {
                  print("HOLA");
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                  ),
                  width: 50,
                  height: 50,
                ),
              ),

               Tooltip(
                  message: "hola mi tooltip",
                 child: Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                               ),
               ),


            ],

          ),

          
        ],

      ),
    );
  }
}
