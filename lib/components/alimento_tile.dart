import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/alimento.dart';
import 'package:flutter_application_1/provider/alimentos.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:social_share/social_share.dart';

class AlimentoTile extends StatelessWidget {
  final Alimento alimento;

  const AlimentoTile(this.alimento, {Key? key}) : super(key: key);

  void compartilharAlimento(BuildContext context) {
    final nomeAlimento = alimento.nomeAlimento;
    final categoria = alimento.categoria;
    final tipo = alimento.tipo;

    final message =
        "Confira informações sobre o $nomeAlimento: $categoria, $tipo";

    SocialShare.shareOptions(message).then((data) {
      print('Compartilhamento bem-sucedido!');
    }).catchError((error) {
      print('Erro ao compartilhar: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    final foto = _buildAvatar(alimento.fotoAlimento);

    return ListTile(
      leading: foto,
      title: Text(alimento.nomeAlimento),
      subtitle: Text('${alimento.categoria} - ${alimento.tipo}'),
      trailing: SizedBox(
        width: 146,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () => compartilharAlimento(context),
              icon: const Icon(Icons.share),
              color: Colors.green.shade900,
            ),
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
                  ),
                ).then((confirmed) {
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

  Widget _buildAvatar(String? fotoAlimento) {
    if (fotoAlimento == null || fotoAlimento.isEmpty) {
      return const CircleAvatar(child: Icon(Icons.no_food));
    } else if (fotoAlimento.startsWith('http') ||
        fotoAlimento.startsWith('https')) {
      return CircleAvatar(
        backgroundImage: NetworkImage(fotoAlimento),
      );
    } else {
      return CircleAvatar(
        backgroundImage: FileImage(File(fotoAlimento)),
      );
    }
  }
}
