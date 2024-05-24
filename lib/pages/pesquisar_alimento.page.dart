import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_drawer.dart';
import 'package:flutter_application_1/components/alimento_tile.dart';
import 'package:flutter_application_1/provider/alimentos.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';

class PesquisarAlimento extends StatelessWidget {
  const PesquisarAlimento({super.key});

  @override
  Widget build(BuildContext context) {
    final Alimentos alimentos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Alimentos", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
      ),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemCount: alimentos.count,
        itemBuilder: (ctx, i) => AlimentoTile(alimentos.byIndex(i)),
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
