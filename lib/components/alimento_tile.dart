import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/alimento.dart';
import 'package:flutter_application_1/provider/alimentos.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';

class AlimentoTile extends StatelessWidget {
  final Alimento alimento;

  const AlimentoTile(this.alimento, {super.key});

  @override
  Widget build(BuildContext context) {
    final foto =
        (alimento.fotoAlimento == null || alimento.fotoAlimento!.isEmpty)
            ? const CircleAvatar(child: Icon(Icons.no_food))
            : CircleAvatar(
                backgroundImage: NetworkImage(alimento.fotoAlimento!),
              );

    return ListTile(
      leading: foto,
      title: Text(alimento.nomeAlimento),
      subtitle: Text('${alimento.categoria} - ${alimento.tipo}'),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.alimentoform,
                  arguments: alimento,
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
                          title: const Text('Excluir Alimento'),
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
                        )).then((confirmed) {
                  if (confirmed) {
                    Provider.of<Alimentos>(context, listen: false)
                        .remove(alimento);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
