import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_drawer.dart';
import 'package:flutter_application_1/components/alimento_tile.dart';
import 'package:flutter_application_1/provider/alimentos.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';

class PesquisarAlimento extends StatefulWidget {
  const PesquisarAlimento({super.key});

  @override
  _PesquisarAlimentoState createState() => _PesquisarAlimentoState();
}

class _PesquisarAlimentoState extends State<PesquisarAlimento> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final Alimentos alimentos = Provider.of(context);
    final filteredAlimentos = alimentos.all.where((alimento) {
      return alimento.nomeAlimento
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Alimentos", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar Alimentos',
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
              itemCount: filteredAlimentos.length,
              itemBuilder: (ctx, i) => AlimentoTile(filteredAlimentos[i]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.alimentoform);
        },
        backgroundColor: Colors.green.shade400,
        child: const Icon(Icons.add),
      ),
    );
  }
}
