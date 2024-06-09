import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/paciente.dart';
import 'package:flutter_application_1/provider/pacientes.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'dart:io';

String calculateAge(String? dateOfBirth) {
  if (dateOfBirth == null || dateOfBirth.isEmpty) return '';

  final parts = dateOfBirth.split('/');
  if (parts.length != 3) return '';

  final day = int.parse(parts[0]);
  final month = int.parse(parts[1]);
  final year = int.parse(parts[2]);

  final birthDate = DateTime(year, month, day);
  final now = DateTime.now();
  final age = now.year - birthDate.year;
  final month1 = now.month;
  final month2 = birthDate.month;
  final day1 = now.day;
  final day2 = birthDate.day;

  if (month2 > month1 || (month2 == month1 && day2 > day1)) {
    return '${age - 1}';
  }
  return '$age';
}

class PacienteTile extends StatelessWidget {
  final Paciente paciente;

  const PacienteTile(this.paciente, {super.key});

  @override
  Widget build(BuildContext context) {
    final foto = _buildAvatar(paciente.fotoPaciente);

    return ListTile(
      leading: foto,
      title: Text(paciente.nome),
      subtitle: Text('Idade: ${calculateAge(paciente.dataNascimento)} anos'),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.pacienteform,
                  arguments: paciente,
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
                          title: const Text('Excluir Usuário'),
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
                    Provider.of<Pacientes>(context, listen: false)
                        .remove(paciente);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(String? fotoPaciente) {
    if (fotoPaciente == null || fotoPaciente.isEmpty) {
      return const CircleAvatar(child: Icon(Icons.person));
    } else if (fotoPaciente.startsWith('http') ||
        fotoPaciente.startsWith('https')) {
      return CircleAvatar(
        backgroundImage: NetworkImage(fotoPaciente),
      );
    } else {
      return CircleAvatar(
        backgroundImage: FileImage(File(fotoPaciente)),
      );
    }
  }
}
