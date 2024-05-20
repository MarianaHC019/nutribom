import 'package:flutter/material.dart';
import 'package:flutter_application_1/CustomDrawer.dart';

class PesquisarPaciente extends StatefulWidget {
  const PesquisarPaciente({super.key});

  @override
  State<PesquisarPaciente> createState() => _PesquisarPacienteState();
}

class _PesquisarPacienteState extends State<PesquisarPaciente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Pacientes", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
      ),
      drawer: CustomDrawer(),
      body: Container(),
    );
  }
}
