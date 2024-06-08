import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cardapio.dart';
import 'package:flutter_application_1/provider/cardapios.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';

class CardapioTile extends StatelessWidget {
  final Cardapio cardapio;

  const CardapioTile(this.cardapio, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(
                cardapio.nomePaciente.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.cardapioform,
                        arguments: cardapio,
                      );
                    },
                    icon: const Icon(Icons.edit),
                    color: Colors.orange,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Excluir Cardapio?'),
                          content: const Text('Tem certeza?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Não'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Sim'),
                            ),
                          ],
                        ),
                      ).then((confirmed) {
                        if (confirmed) {
                          Provider.of<Cardapios>(context, listen: false)
                              .remove(cardapio);
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Divider(
              color: Colors.green.shade400,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Café da Manhã',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              cardapio.ca1?.toString() ?? 'Não informado',
            ),
            Text(
              cardapio.ca2?.toString() ?? 'Não informado',
            ),
            Text(
              cardapio.ca3?.toString() ?? 'Não informado',
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Almoço',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              cardapio.al1?.toString() ?? 'Não informado',
            ),
            Text(
              cardapio.al2?.toString() ?? 'Não informado',
            ),
            Text(
              cardapio.al3?.toString() ?? 'Não informado',
            ),
            Text(
              cardapio.al4?.toString() ?? 'Não informado',
            ),
            Text(
              cardapio.al5?.toString() ?? 'Não informado',
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Jantar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              cardapio.ja1?.toString() ?? 'Não informado',
            ),
            Text(
              cardapio.ja2?.toString() ?? 'Não informado',
            ),
            Text(
              cardapio.ja3?.toString() ?? 'Não informado',
            ),
            Text(
              cardapio.ja4?.toString() ?? 'Não informado',
            ),
          ],
        ),
      ),
    );
  }
}
