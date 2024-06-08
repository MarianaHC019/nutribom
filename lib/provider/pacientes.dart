import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database_paciente.dart';
import 'package:flutter_application_1/models/paciente.dart';

class Pacientes with ChangeNotifier {
  final Map<String, Paciente> _items = {...databasePaciente};

  List<Paciente> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Paciente byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Paciente paciente) {
    if (paciente.id != null &&
        paciente.id!.trim().isNotEmpty &&
        _items.containsKey(paciente.id)) {
      _items.update(
        paciente.id!,
        (_) => Paciente(
          id: paciente.id,
          nome: paciente.nome,
          dataNascimento: paciente.dataNascimento,
          fotoPaciente: paciente.fotoPaciente,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Paciente(
          id: id,
          nome: paciente.nome,
          dataNascimento: paciente.dataNascimento,
          fotoPaciente: paciente.fotoPaciente,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Paciente paciente) {
    _items.remove(paciente.id);
    notifyListeners();
  }

  void loadPacientes() {
    notifyListeners();
  }
}
