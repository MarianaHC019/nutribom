import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/alimento_tile.dart';
import 'package:flutter_application_1/components/cardapio_tile.dart';
import 'package:flutter_application_1/components/paciente_tile.dart';
import 'package:flutter_application_1/custom_drawer.dart';
import 'package:flutter_application_1/provider/alimentos.dart';
import 'package:flutter_application_1/provider/cardapios.dart';
import 'package:flutter_application_1/provider/pacientes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Tela Inicial", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: 100,
              height: 100,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.green.shade400,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Pacientes',
                style: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 200,
              child: Consumer<Pacientes>(
                builder: (context, pacientes, _) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: pacientes.all.length,
                    itemBuilder: (ctx, i) {
                      return PacienteTile(pacientes.all[i]);
                    },
                  );
                },
              ),
            ),
            Divider(
              color: Colors.green.shade400,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Cardapios',
                style: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 200,
              child: Consumer<Cardapios>(
                builder: (context, cardapios, _) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: cardapios.all.length,
                    itemBuilder: (ctx, i) {
                      return CardapioTile(cardapios.all[i]);
                    },
                  );
                },
              ),
            ),
            Divider(
              color: Colors.green.shade400,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Alimentos',
                style: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 200,
              child: Consumer<Alimentos>(
                builder: (context, alimentos, _) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: alimentos.all.length,
                    itemBuilder: (ctx, i) {
                      return AlimentoTile(alimentos.all[i]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
