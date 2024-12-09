import 'package:flutter/material.dart';

class FormsScreen2 extends StatelessWidget {
  const FormsScreen2({super.key});

  //nombre de pantalla
  static const routeName = "/forms-screen_2";
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
                  "FORMULARIOS",
                  textAlign: TextAlign.center,
                ),
              ),

              ///  1.	Hay dos widget
              ///  2.	TextField -> solo permite ingresar un texto
              ///  Si solo quieres ingresar valores
              ///  3.	TextFormField:  este según el contexto te ayuda a realizar validaciones,
              ///  a.	Si esta vacio
              ///  b.	Si es un email
              ///  c.	Numero de caracteres especifico
              ///  d.	Etc.
              ///  4.	DropDownButton: permiten seleccionar elementos en una lista interna
              ///  No nos va a dar este en clases nos va a pasar para ver
              ///  https://api.flutter.dev/flutter/material/DropdownButton-class.html
              ///  5.	CheckBox
              ///  https://api.flutter.dev/flutter/material/Checkbox-class.html

              ///  6.	RadioButoms: permiten selección  un elemento de una lista
              ///  7.	Switch: permite activar o desactivar una opción   https://api.flutter.dev/flutter/material/Switch-class.html
              ///

              ///  1. TextField

              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  //caracteristicas de los teclados
                  keyboardType: TextInputType.number, //TIPO NUMERICO
                  //maximo de caracteres,  se puede usar builCounter - construir un contador de caracteres
                  maxLength: null,
                  //maximo numero de lineas
                  maxLines: 4,
                  //minimo número de lineas
                  minLines: 2,
                  // deshabilitar el campo por defecto esta siempre en tru
                  enabled: true,
                  //placeholder _ texo que se muestra cuando no hay nada escrito
                  decoration: InputDecoration(
                      hintText: "texto que se muestra antes de digitar",
                      //puedo darle formato  al hint
                      hintStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                      labelText: "nombre del campo ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      //iconos adelante o atras
                      prefixIcon: Icon(Icons.ac_unit_rounded),
                      suffixIcon: Icon(Icons.account_circle_sharp)),
                  //texto que se muestra del campo
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  //caracteristicas de los teclados
                  keyboardType: TextInputType.emailAddress, //TIPO EMAIL
                ),
              ),
              //unfocus
              TextButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
                child: const Text("unfocus"),
              ),

              //campo clave
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  //caracteristicas de los teclados
                  keyboardType: TextInputType.text, //TIPO NUMERICO
                  //maximo de caracteres,  se puede usar builCounter - construir un contador de caracteres
                  maxLength: 5,
                  //campo clave oculto
                  obscureText: true,
                  obscuringCharacter: "*",
                  //placeholder _ texo que se muestra cuando no hay nada escrito
                  decoration: InputDecoration(
                    hintText: "campo como clave oculta",
                    //puedo darle formato  al hint
                    hintStyle: const TextStyle(
                      color: Colors.blueAccent,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),

                  //acciones
                  // se ejecuta cada vez que doy clic en el teclado
                  onChanged: (value) {
                    //callback
                    print(value);
                  },

                  onSubmitted: (value) {
                    //callback
                    print("al final");
                  },
                  //cuando se de tap al obejto
                  onTap: () {
                    print("tap");
                  },

                  //onSae
                  //onEditingComplete
                  //validator
                ),
              ),

              ///2. TexformField siempre va a acompañado del widget form
              ///
              ///

            ],
          ),
        ),
      ),
    );
  }
}
