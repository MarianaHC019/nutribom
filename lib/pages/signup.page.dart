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
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmacaoSenhaController = TextEditingController();

  void _submitForm(BuildContext context) {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      Provider.of<Usuarios>(context, listen: false).put(Usuario(
        id: UniqueKey().toString(),
        email: _emailController.text.trim(),
        senha: _senhaController.text.trim(),
        user: '',
      ));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Paciente", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
        color: Colors.white,
        child: Form(
          key: _formKey,
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
                controller: _emailController,
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
                onPressed: () => _submitForm(context),
                child: const Text("Cadastrar-se"),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
