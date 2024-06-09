import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_drawer.dart';
import 'package:flutter_application_1/provider/pacientes.dart';
import 'package:flutter_application_1/models/paciente.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CadastrarPaciente extends StatefulWidget {
  @override
  State<CadastrarPaciente> createState() => _CadastrarPacienteState();
}

class _CadastrarPacienteState extends State<CadastrarPaciente> {
  final _form = GlobalKey<FormState>();
  final Map<String, String?> _formData = {};
  String? _imagePath;

  void _loadFormData(Paciente? paciente) {
    if (paciente != null) {
      _formData['id'] = paciente.id;
      _formData['nome'] = paciente.nome;
      _formData['dataNascimento'] = paciente.dataNascimento;
      _formData['fotoPaciente'] = paciente.fotoPaciente;
      _imagePath = paciente.fotoPaciente;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Paciente? paciente =
        ModalRoute.of(context)?.settings.arguments as Paciente?;

    _loadFormData(paciente);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Cadastrar Paciente", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValid = _form.currentState?.validate();

              if (isValid == true) {
                _form.currentState?.save();
                Provider.of<Pacientes>(context, listen: false).put(Paciente(
                  id: _formData['id'],
                  nome: _formData['nome'] ?? '',
                  dataNascimento: _formData['dataNascimento'] ?? '',
                  fotoPaciente: _imagePath,
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
          padding: const EdgeInsets.all(20),
          child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: _formData['nome'],
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nome inválido';
                      }

                      if (value.trim().length < 3) {
                        return 'Nome muito pequeno. No minímo 3 letras';
                      }

                      return null;
                    },
                    onSaved: (value) => _formData['nome'] = value ?? '',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: _formData['dataNascimento'],
                    decoration: InputDecoration(
                      labelText: 'Data de Nascimento (dd/mm/aaaa)',
                    ),
                    keyboardType: TextInputType.datetime,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DataInputFormatter(),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a data de nascimento';
                      }
                      final RegExp regex = RegExp(
                          r'^(?:(?:31(\/)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d{2}))$|^(?:29(\/)0?2\3(?:(?:(?:1[6-9]|[2-9]\d{2})?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:19|20)?\d{2})$');
                      if (!regex.hasMatch(value)) {
                        return 'Formato inválido. Use dd/mm/aaaa';
                      }
                      return null;
                    },
                    onSaved: (value) =>
                        _formData['dataNascimento'] = value ?? '',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final pickedFile = await ImagePicker()
                          .getImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          _imagePath = pickedFile.path;
                          _formData['fotoPaciente'] = _imagePath;
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
                            Image.file(File(_imagePath!),
                                width: 100, height: 100),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _imagePath = null;
                                  _formData['fotoPaciente'] = null;
                                });
                              },
                              child: Text('Excluir Imagem'),
                            ),
                          ],
                        )
                      : SizedBox(),
                ],
              ))),
    );
  }
}

class DataInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final StringBuffer newText = StringBuffer();
    if (newValue.text.length > 8) {
      return oldValue;
    }
    for (int i = 0; i < newValue.text.length; i++) {
      if (i == 2 || i == 4) {
        newText.write('/');
      }
      newText.write(newValue.text[i]);
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
