import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  //nombre de la pantalla
  static const routeName = "/list-screen";

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final listaDeElementos = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LISTAS"),
      ),

      // expanded -> widget que hace que todo lo que tiene disponible se expanda
      body: Row(
        children: [
          Expanded(
            child: ListView(
              // PROPIEDADES
              // para toda lista que esta dentro de un row hay que definir un ancho
              // DIreccion del scroll  horizontal y vertical
              scrollDirection: Axis.vertical,
              // fISICA DEL sCROLL
              // BouncingScrollPhysics - fisica iOs
              //alwaysScrollableScrollPhysics - fisica en andoriod
              //Never ScrollableScrollPhysics - no se pued hacer scroll
              //
              physics: const AlwaysScrollableScrollPhysics(),
              //physics: BouncingScrollPhysics() ,

              children: const [
                Text("Elemento1"),
                Text("Elemento2"),
                Text("Elemento3"),
                Text("Elemento4"),
                Text("Elemento5"),
                Text("Elemento6"),
                Text("Elemento7"),
                Text("Elemento8"),
                Text("Elemento9"),
              ],
            ),
          ),
          const Expanded(child: Text("HOLA")),

          ///2. SingleChildScrollView  esta acompañdo del column y row
          ///

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.red,
                    height: 500,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 500,
                  ),
                ],
              ),
            ),
          ),

          ///3. ListView.builder
          ///tenemos que crear una lista de elementos
          ///
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return Text("ELEMENTO ES $index");
              },
              itemCount: listaDeElementos.length,   //es el limite en función de itemCount
            ),
          ),
        ],
      ),
    );
  }
}
