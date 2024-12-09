import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  //nombre de pantalla
  static const routeName = "/alerts-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alertass"),
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
        children: [
          
          //https://api.flutter.dev/flutter/material/showDialog.html
          // ALERTA ANDROID
          TextButton(
              onPressed: () {
                /// 1. Usar el alertDialog
                showDialog(
                  context: context,
                  builder: (context) {
                    /// 2. retornar un alertDialog()

                    return AlertDialog(
                      title: const Text("Alerta Android"),
                      content:
                          const Text("este es un mensaje de alerta en Android"),
                      actions: [
                        //lista de widget
                        ///3. agregar botones
                        /// botón cancelar -> OutLineButton
                        OutlinedButton(
                          onPressed: () {
                            // cerrar la modal
                            Navigator.pop(context);
                          },
                          child: const Text("CANCELAR"),
                        ),

                        /// Botón aceptar -> filledButton
                        FilledButton(
                          onPressed: () {},
                          child: const Text("ACEPTAR"),
                        ),
                      ],
                    );

                    //return Text("Hola");
                  },
                );
              },
              child: const Text("Alerta Android")),
          // ALERTA iOS
          TextButton(
              onPressed: () {
                //1.usar el showCuppertinoDialog
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text("alerta iOS"),
                        content: const Text("esta es una alerta e iOS"),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            isDestructiveAction: true,
                            child: const Text("CANCELAR"),
                          ),
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            isDefaultAction: true,
                            child: const Text("ACEPTAR"),
                          ),
                        ],
                      );
                    });
              },
              child: const Text("Alerta iOS")),
          // ALERTA POR PLATAFORMA
          TextButton(
              onPressed: () {
                /// 1. showDialog
                /// 2. AlerDialog.adaptative
                /// 3. Agregar botones que son adalptables

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog.adaptive(
                      title: const Text("Alerta por plataforma"),
                      content: const Text(
                          "Este es el contenido de la alerta multiplataforma"),
                      actions: [
                        adaptiveAction(
                          context: context,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cerrar"),
                        ),
                        adaptiveAction(
                          context: context,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Aceptar"),
                        ),

                      ],
                    );
                  },
                );
              },
              child: const Text("Alerta por Plataforma")),
        ],
      ),
    );
  }

  ///codigo que permite hacer un boton de accion adaptativo
  ///esto es propuesto por el mismo equipo de flutter
  ///te pide como requerido un context ->identifica donde renderisasse, onpress  para la accion de precionar y child
  ///widget que ter permite renderisar el contenido internamente
  ///
  ///colocar este metodo antes de que se cierre la ultima llave
  Widget adaptiveAction({
    required BuildContext context,
    required VoidCallback onPressed,
    required Widget child,
  }) {
    final ThemeData theme = Theme.of(
        context); // pmerite determinar que plataforma es por medio del Theme
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }
}
