import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database_cardapio.dart';
import 'package:flutter_application_1/models/cardapio.dart';

class Cardapios with ChangeNotifier {
  final Map<String, Cardapio> _items = {...databaseCardapio};

  List<Cardapio> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Cardapio byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Cardapio cardapio) {
    if (cardapio.id != null && _items.containsKey(cardapio.id)) {
      _items.update(
        cardapio.id!,
        (existingCardapio) => Cardapio(
          id: existingCardapio.id,
          nomePaciente: cardapio.nomePaciente,
          ca1: cardapio.ca1,
          ca2: cardapio.ca2,
          ca3: cardapio.ca3,
          al1: cardapio.al1,
          al2: cardapio.al2,
          al3: cardapio.al3,
          al4: cardapio.al4,
          al5: cardapio.al5,
          ja1: cardapio.ja1,
          ja2: cardapio.ja2,
          ja3: cardapio.ja3,
          ja4: cardapio.ja4,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Cardapio(
          id: id,
          nomePaciente: cardapio.nomePaciente,
          ca1: cardapio.ca1,
          ca2: cardapio.ca2,
          ca3: cardapio.ca3,
          al1: cardapio.al1,
          al2: cardapio.al2,
          al3: cardapio.al3,
          al4: cardapio.al4,
          al5: cardapio.al5,
          ja1: cardapio.ja1,
          ja2: cardapio.ja2,
          ja3: cardapio.ja3,
          ja4: cardapio.ja4,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Cardapio cardapio) {
    _items.removeWhere((key, value) => value == cardapio);
    notifyListeners();
  }

  void loadPacientes() {
    notifyListeners();
  }
}
