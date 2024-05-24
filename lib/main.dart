import 'package:flutter_application_1/pages/cadastrar_alimento.page.dart';
import 'package:flutter_application_1/pages/cadastrar_paciente.page.dart';
import 'package:flutter_application_1/pages/login.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/alimentos.dart';
import 'package:flutter_application_1/provider/pacientes.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Pacientes(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Alimentos(),
        )
      ],
      child: MaterialApp(
          title: 'flutter.io',
          theme: ThemeData(
              primarySwatch: Colors.green,
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade900,
                foregroundColor: Colors.white,
              )),
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                backgroundColor: Colors.green.shade100,
                foregroundColor: Colors.green.shade900,
              ))),
          home: LoginPage(),
          routes: {
            AppRoutes.pacienteform: (_) => CadastrarPaciente(),
            AppRoutes.alimentoform: (_) => CadastrarAlimento()
          }),
    );
  }
}
