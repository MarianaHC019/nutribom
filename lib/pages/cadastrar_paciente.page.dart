import 'package:flutter/material.dart';
import 'package:flutter_application_1/CustomDrawer.dart';

class CadastrarPaciente extends StatefulWidget {
  const CadastrarPaciente({super.key});

  @override
  State<CadastrarPaciente> createState() => _CadastrarPacienteState();
}

class _CadastrarPacienteState extends State<CadastrarPaciente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Paciente", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
      ),
      drawer: CustomDrawer(),
      body: Container(),
    );
  }
}
