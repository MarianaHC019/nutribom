import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_drawer.dart';
import 'package:flutter_application_1/components/paciente_tile.dart';
import 'package:flutter_application_1/provider/pacientes.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';

class PesquisarPaciente extends StatefulWidget {
  const PesquisarPaciente({super.key});

  @override
  _PesquisarPacienteState createState() => _PesquisarPacienteState();
}

class _PesquisarPacienteState extends State<PesquisarPaciente> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final Pacientes pacientes = Provider.of<Pacientes>(context);
    final filteredPacientes = pacientes.all.where((paciente) {
      return paciente.nome.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Pacientes", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar Pacientes',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPacientes.length,
              itemBuilder: (ctx, i) => PacienteTile(filteredPacientes[i]),
            ),
          ),
        ],
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
