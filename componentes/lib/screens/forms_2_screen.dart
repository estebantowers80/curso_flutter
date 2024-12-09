import 'package:flutter/material.dart';

class Forms2Screen extends StatefulWidget {
  const Forms2Screen({super.key});
  static const routeName = "/forms2";

  @override
  State<Forms2Screen> createState() => _Forms2ScreenState();
}

class _Forms2ScreenState extends State<Forms2Screen> {
  /// key ->formstate
  final _formkey = GlobalKey<FormState>();
  String _name = "";
  String _cedula = "";
  String _email = "";
  String _password = "";

  // controladores para no poner como variables ya que permiten hacer muchas mas cosas como borrar,asignar etc
  //final _nameController = TextEditingController();
  //final _cedulaController = TextEditingController();
  //final _emailController = TextEditingController();
  //final _passwordController = TextEditingController( text: "clave inicial");

  //cuando usen controladores deben limpiarlos
  late TextEditingController _nameController ;
  late TextEditingController _cedulaController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  /// initState  -  inicializar el esado cuando se hace el primer renderizado , SOLO EN StatefulWidget
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _cedulaController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  /// dispose   - cuando se cierra la pantalla solo en StatefulWidget
  /// Esto es para limpiar memoria y evitar comsumo execivo de memoria

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _cedulaController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///creamos un AppBard
      appBar: AppBar(
        title: const Text("Formularios 2"),
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
                  "TextFormField",
                  textAlign: TextAlign.center,
                ),
              ),

              ///2. TexformField siempre va a acompañado del widget form
              ///
              ///
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  //llave par aenviar
                  key: _formkey,
                  child: Column(
                    children: [
                      //nombre y apellidol
                      TextFormField(
                        controller: _nameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: "Nombres y Apellidos",
                          hintText: "Ingrese nombres y apellidos",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          print("value del validador $value");
                          //validadmos que no sea nulo o vacio
                          if (value == null || value.isEmpty) {
                            return "Requerido";
                          }
                          //validamos que ingrese por lo menos dos palabras
                          if (value.split(" ").length < 2 ||
                              value.toString().length < 3) {
                            return "Debe ingresar un nombre y apellido";
                          }
                          // si todo esta ok retornamos un null
                          return null;
                        },
                        //aqui se cargan los parametros al guardar
                        onSaved: (newValue) {
                          _name = newValue ?? "";
                        },
                      ),
                      const SizedBox(height: 10.0),
                      //cédula
                      TextFormField(
                        controller: _cedulaController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Cédula",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.toString().length != 10) {
                            return "la cédula debe tener 10 caracteres";
                          }
                          return null;
                        },
                        //aqui se cargan los parametros al guardar
                        onSaved: (newValue) {
                          _cedula = newValue ?? "";
                        },
                      ),
                      const SizedBox(height: 10.0),
                      //correo
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Correo",
                          hintText: "correo@dominio.com",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "el valor es requerido ";
                          }
                          if (value.split("@").length != 2 ||
                              value.split(".").length < 1) {
                            return "el correo debe contener almenos una @ y un . ${value.split("@").length}";
                          }
                          return null;
                        },
                        //aqui se cargan los parametros al guardar
                        onSaved: (newValue) {
                          _email = newValue ?? "";
                        },
                      ),
                      const SizedBox(height: 10.0),
                      //Contraseña
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          labelText: "Contraseña",
                          hintText: "*********",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "el valor de contraseña es requerido";
                          }
                          return null;
                        },
                        //aqui se cargan los parametros al guardar
                        onSaved: (newValue) {
                          _password = newValue ?? "";
                        },
                      ),
                      const SizedBox(height: 10.0),
                      FilledButton(
                        onPressed: () {
                          final valueValidator =
                              _formkey.currentState?.validate();
                          print("value validator: $valueValidator");
                          if (valueValidator == null || !valueValidator) {
                            return;
                          }

                          /// se ejecuta lo demas
                          /// como accedmos a los datos
                          ///
                          _formkey.currentState?.save();

                          print(
                              "nombre desde controller: ${_nameController.text}");
                          print(
                              "cedula desde Controller: ${_cedulaController.text}");

                          /// con controllers podemos hacer varias cosas
                          //_nameController.clear(); //limpiar el campo
                          //_nameController.text = "Marco Polo"; // asigno valores

                          print(
                              "Nombre: $_name \nCédula: $_cedula \nCorreo $_email \nPassword: $_password");
                          
                          Text("Nombre: ${_nameController.text}");
                        },
                        child: const Text("Enviar"),
                      ),

                      FilledButton(
                        onPressed: () {
                        _nameController.text="";
                        _cedulaController.text="";
                        _emailController.text="";
                        _passwordController.text="";
                         
                        },
                        child: const Text("Limpiar"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
