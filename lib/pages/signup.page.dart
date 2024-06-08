import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:flutter_application_1/pages/login.page.dart';
import 'package:flutter_application_1/provider/usuarios.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _form = GlobalKey<FormState>();
  final Map<String, String?> _formData = {};
  final _senhaController = TextEditingController();
  final _confirmacaoSenhaController = TextEditingController();

  void _loadFormData(Usuario? usuario) {
    if (usuario != null) {
      _formData['id'] = usuario.id;
      _formData['user'] = usuario.user;
      _formData['email'] = usuario.email;
      _formData['senha'] = usuario.senha;
      _senhaController.text = usuario.senha ?? '';
      _confirmacaoSenhaController.text = usuario.senha ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Usuario? usuario =
        ModalRoute.of(context)?.settings.arguments as Usuario?;

    _loadFormData(usuario);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Paciente", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
        color: Colors.white,
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              Text(
                "Preencha as informações para criar um login.",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: _formData['user'],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade900)),
                ),
                style: TextStyle(fontSize: 18),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno. No mínimo 3 letras';
                  }

                  return null;
                },
                onSaved: (value) => _formData['user'] = value ?? '',
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                initialValue: _formData['email'],
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade900)),
                ),
                style: TextStyle(fontSize: 18),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email inválido';
                  }

                  return null;
                },
                onSaved: (value) => _formData['email'] = value ?? '',
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade900)),
                ),
                style: TextStyle(fontSize: 18),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Senha inválida';
                  }

                  if (value.trim().length < 5) {
                    return 'Senha muito pequena. No mínimo 5 dígitos';
                  }

                  return null;
                },
                onSaved: (value) => _formData['senha'] = value ?? '',
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _confirmacaoSenhaController,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Repita sua Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade900)),
                ),
                style: TextStyle(fontSize: 18),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Senha inválida';
                  }

                  if (value != _senhaController.text) {
                    return 'Senhas não conferem';
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final isValid = _form.currentState?.validate();
                  if (isValid == true) {
                    _form.currentState?.save();
                    Provider.of<Usuarios>(context, listen: false).put(Usuario(
                      id: _formData['id'] ?? '',
                      user: _formData['user'] ?? '',
                      email: _formData['email'] ?? '',
                      senha: _formData['senha'] ?? '',
                    ));
                    Navigator.of(context).pop();
                  }
                },
                child: const Text(
                  "Cadastrar-se",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                child: TextButton(
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.green.shade900),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
