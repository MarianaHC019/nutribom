import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database_usuario.dart';
import 'package:flutter_application_1/models/usuario.dart';

class Usuarios with ChangeNotifier {
  final Map<String, Usuario> _items = {...databaseUsuario};

  List<Usuario> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Usuario byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Usuario usuario) {
    if (usuario.id != null &&
        usuario.id!.trim().isNotEmpty &&
        _items.containsKey(usuario.id)) {
      _items.update(
        usuario.id!,
        (_) => Usuario(
          id: usuario.id,
          user: usuario.user,
          email: usuario.email,
          senha: usuario.senha,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Usuario(
          id: id,
          user: usuario.user,
          email: usuario.email,
          senha: usuario.senha,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Usuario usuario) {
    _items.remove(usuario.id);
    notifyListeners();
  }

  void loadPacientes() {
    notifyListeners();
  }
}
