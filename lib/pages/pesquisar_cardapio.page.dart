import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_drawer.dart';
import 'package:flutter_application_1/components/cardapio_tile.dart';
import 'package:flutter_application_1/provider/cardapios.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';

class PesquisarCardapio extends StatefulWidget {
  const PesquisarCardapio({super.key});

  @override
  _PesquisarCardapioState createState() => _PesquisarCardapioState();
}

class _PesquisarCardapioState extends State<PesquisarCardapio> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final Cardapios cardapios = Provider.of(context);
    final filteredCardapios = cardapios.all.where((cardapio) {
      return cardapio.nomePaciente
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Cardapios", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar Cardapios',
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
              itemCount: filteredCardapios.length,
              itemBuilder: (ctx, i) => CardapioTile(filteredCardapios[i]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.cardapioform);
        },
        backgroundColor: Colors.green.shade400,
        child: const Icon(Icons.add),
      ),
    );
  }
}
