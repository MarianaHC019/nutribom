import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_drawer.dart';
import 'package:flutter_application_1/provider/alimentos.dart';
import 'package:flutter_application_1/models/alimento.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CadastrarAlimento extends StatefulWidget {
  @override
  State<CadastrarAlimento> createState() => CadastrarAlimentoState();
}

class CadastrarAlimentoState extends State<CadastrarAlimento> {
  final _form = GlobalKey<FormState>();
  final Map<String, String?> _formData = {};
  String? _imagePath;

  void _loadFormData(Alimento? alimento) {
    if (alimento != null) {
      _formData['id'] = alimento.id;
      _formData['nomeAlimento'] = alimento.nomeAlimento;
      _formData['categoria'] = alimento.categoria;
      _formData['tipo'] = alimento.tipo;
      _formData['fotoAlimento'] = alimento.fotoAlimento;
      _imagePath = alimento.fotoAlimento;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Alimento? alimento =
        ModalRoute.of(context)?.settings.arguments as Alimento?;

    _loadFormData(alimento);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Cadastrar Alimento", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValid = _form.currentState?.validate();

              if (isValid == true) {
                _form.currentState?.save();
                Provider.of<Alimentos>(context, listen: false).put(Alimento(
                  id: _formData['id'],
                  nomeAlimento: _formData['nomeAlimento'] ?? '',
                  categoria: _formData['categoria'] ?? '',
                  tipo: _formData['tipo'] ?? '',
                  fotoAlimento: _imagePath ?? _formData['fotoAlimento'],
                ));
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nomeAlimento'],
                decoration: InputDecoration(labelText: 'Nome do Alimento'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value.trim().length < 2) {
                    return 'Nome muito pequeno. No mínimo 2 letras';
                  }

                  return null;
                },
                onSaved: (value) => _formData['nomeAlimento'] = value ?? '',
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: _formData['categoria'],
                decoration: InputDecoration(labelText: 'Categoria'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Categoria inválida';
                  }

                  if (value.trim().length < 2) {
                    return 'Categoria muito pequena. No mínimo 2 letras';
                  }

                  return null;
                },
                onSaved: (value) => _formData['categoria'] = value ?? '',
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: _formData['tipo'],
                decoration: InputDecoration(labelText: 'Tipo'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Tipo inválido';
                  }

                  if (value.trim().length < 2) {
                    return 'Tipo muito pequeno. No mínimo 2 letras';
                  }

                  return null;
                },
                onSaved: (value) => _formData['tipo'] = value ?? '',
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () async {
                  final pickedFile =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _imagePath = pickedFile.path;
                      _formData['fotoAlimento'] = _imagePath;
                    });
                  }
                },
                icon: Icon(Icons.photo),
                label: Text('Selecionar Imagem'),
              ),
              _imagePath != null
                  ? Column(
                      children: [
                        SizedBox(height: 20),
                        Image.file(File(_imagePath!), width: 100, height: 100),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _imagePath = null;
                              _formData['fotoAlimento'] = null;
                            });
                          },
                          child: Text('Excluir Imagem'),
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
