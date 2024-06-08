import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database_alimento.dart';
import 'package:flutter_application_1/models/alimento.dart';

class Alimentos with ChangeNotifier {
  final Map<String, Alimento> _items = {...databaseAlimento};

  List<Alimento> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Alimento byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Alimento alimento) {
    if (alimento.id != null &&
        alimento.id!.trim().isNotEmpty &&
        _items.containsKey(alimento.id)) {
      _items.update(
        alimento.id!,
        (_) => Alimento(
          id: alimento.id,
          nomeAlimento: alimento.nomeAlimento,
          categoria: alimento.categoria,
          tipo: alimento.tipo,
          fotoAlimento: alimento.fotoAlimento,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Alimento(
          id: id,
          nomeAlimento: alimento.nomeAlimento,
          categoria: alimento.categoria,
          tipo: alimento.tipo,
          fotoAlimento: alimento.fotoAlimento,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Alimento alimento) {
    _items.remove(alimento.id);
    notifyListeners();
  }

  void loadAlimentos() {
    notifyListeners();
  }
}
