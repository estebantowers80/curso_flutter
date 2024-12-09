import 'dart:convert';

import 'package:componentes/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen({super.key});

  //nombre de pantalla
  static const routeName = "/forms-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///creamos un AppBard
      appBar: AppBar(
        title: const Text("Formularios e Imagenes"),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// renderizar imagenes
              ///
              ///ponemos un subtítulo
              ///
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "RENDERIZAR IMAGENES",
                  textAlign: TextAlign.center,
                ),
              ),

              ///
              //IMAGEN TENGA UN LOADING
              // FadeInImage  es un proveedor de imagen
              const FadeInImage(
                image: NetworkImage(
                    "https://static.vecteezy.com/system/resources/thumbnails/006/054/084/small/retro-style-background-with-grunge-texture-free-vector.jpg"),
                placeholder: AssetImage("assets/images/loading2.gif"),
                width: 500,
              ),

              ///
              /// PARA RENDERIZAR IMAGENES HAY 3 METODOS
              /// todos son a partir de Imagen(proveedor)  o por widget
              ///
              /// 1. A partir de los assets
              /// documentación de imagenes https://api.flutter.dev/flutter/widgets/Image-class.html
              const Image(
                image: AssetImage("assets/images/image.jpeg"),
                width: 200,
                //MediaQuery.of(context).size.width - ancho de la pantalla
                height: 300,
                fit: BoxFit.contain,
              ),
              // a partir de un widget
              Image.asset("assets/images/pets.png"),

              //background de un contenedor
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), //RADIO
                  border: Border.all(
                    //BORDE
                    color: Colors.red,
                    width: 5,
                  ),
                  image: const DecorationImage(
                    //DECORACION DE FONDO
                    image: AssetImage("assets/images/pets.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    //SOMBRA
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(5.0, 5.0)),
                  ],
                ),
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(10.0), //EN LA PARTE INTERNA
                margin: const EdgeInsets.all(40), //EN LA PARTE EXTERNA
                child: const Text("BACK GROUND CONTENEDOR"),
              ),

              /// 2. a partir de una url  enlace de internet  ->.jpg .png  .gif   .webp(fuincional?)
              ///   Se hace con un proveedor   este es el NetworkImage
              ///
              const Image(
                image: NetworkImage(
                    "https://media.istockphoto.com/id/92715562/es/vector/salto-trucha-arco-iris.jpg?s=612x612&w=0&k=20&c=NrwCnZLfKOrCOn02U2NezadyVETePuGwG3Bu5i-msTI="),
                width: 300,
                height: 300,
              ),

              //IMAGEN TENGA UN LOADING
              // FadeInImage  es un proveedor de imagen
              const FadeInImage(
                image: NetworkImage(
                    "https://static.vecteezy.com/system/resources/thumbnails/006/054/084/small/retro-style-background-with-grunge-texture-free-vector.jpg"),
                placeholder: AssetImage("assets/images/loading2.gif"),
                width: 500,
              ),

              //tambien se usa cached_network_image

              /// 3. a partir de una base64
              ///
              const Text("IMAGEN EN BASE 64 DEL PERRITO"),
              Image(
                image: MemoryImage(
                  base64Decode(base64Example),
                ),
              ),

              //otra forma mas rapido a partir de un widget
              const Text("IMAGEN EN BASE 64 con wintget"),
              Image.memory(base64Decode(base64Example)),

              ///RENDERIZAR UN SVG
              /// flutter no tiene un metodo para hacer eso
              ///

              //const String assetName = 'assets/dart.svg';
              const Text("IMAGEN SVG"),
              SvgPicture.asset(
                "assets/svg/archivo.svg",
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
