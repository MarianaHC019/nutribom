import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_drawer.dart';
import 'package:flutter_application_1/components/paciente_tile.dart';
import 'package:flutter_application_1/provider/pacientes.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';

class PesquisarPaciente extends StatelessWidget {
  const PesquisarPaciente({super.key});

  @override
  Widget build(BuildContext context) {
    final Pacientes pacientes = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Pacientes", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
      ),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemCount: pacientes.count,
        itemBuilder: (ctx, i) => PacienteTile(pacientes.byIndex(i)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.pacienteform);
        },
        backgroundColor: Colors.green.shade400,
        child: const Icon(Icons.add),
      ),
    );
  }
}
