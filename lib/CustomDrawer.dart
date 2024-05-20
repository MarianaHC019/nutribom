import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cadastrar_paciente.page.dart';
import 'package:flutter_application_1/pages/login.page.dart';
import 'package:flutter_application_1/pages/pesquisar_paciente.page.dart';
import 'pages/home.page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCardapiosExpanded = false;
  bool _isPacientesExpanded = false;
  bool _isAlimetosExpanded = false;

  void _resetExpansionState() {
    setState(() {
      _isCardapiosExpanded = false;
      _isPacientesExpanded = false;
      _isAlimetosExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green.shade400,
              //image: DecorationImage(
              //fit: BoxFit.fill,
              //image: AssetImage("assets/images/Foto.png"),
              //),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "Foto",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Nome do usuário",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              _resetExpansionState();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            leading: Icon(
              Icons.home,
              size: 26,
              color: Colors.green.shade900,
            ),
            title: Text(
              "Tela Inicial",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ExpansionTile(
            leading: Icon(
              Icons.person,
              size: 26,
              color: Colors.green.shade900,
            ),
            title: Text(
              "Pacientes",
              style: TextStyle(fontSize: 20),
            ),
            initiallyExpanded: _isPacientesExpanded,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isPacientesExpanded = expanded;
                if (expanded) {
                  _isCardapiosExpanded = false;
                  _isAlimetosExpanded = false;
                }
              });
            },
            children: [
              ListTile(
                onTap: () {
                  _resetExpansionState();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PesquisarPaciente()),
                  );
                },
                title: Text("Pesquisar", style: TextStyle(fontSize: 18)),
              ),
              ListTile(
                onTap: () {
                  _resetExpansionState();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CadastrarPaciente()));
                },
                title: Text(
                  "Cadastrar Novo",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(
              Icons.menu_book_rounded,
              size: 26,
              color: Colors.green.shade900,
            ),
            title: Text(
              "Cardapios",
              style: TextStyle(fontSize: 20),
            ),
            initiallyExpanded: _isCardapiosExpanded,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isCardapiosExpanded = expanded;
                if (expanded) {
                  _isPacientesExpanded = false;
                  _isAlimetosExpanded = false;
                }
              });
            },
            children: [
              ListTile(
                onTap: () {
                  _resetExpansionState();
                  //navegação pesquisar
                },
                title: Text("Pesquisar", style: TextStyle(fontSize: 18)),
              ),
              ListTile(
                onTap: () {
                  _resetExpansionState();
                  //navegação pesqquisa;
                },
                title: Text("Cadastrar Novo", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(
              Icons.flatware_outlined,
              size: 26,
              color: Colors.green.shade900,
            ),
            title: Text("Alimentos", style: TextStyle(fontSize: 18)),
            initiallyExpanded: _isAlimetosExpanded,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isAlimetosExpanded = expanded;
                if (expanded) {
                  _isCardapiosExpanded = false;
                  _isPacientesExpanded = false;
                }
              });
            },
            children: [
              ListTile(
                onTap: () {
                  _resetExpansionState();
                  //navegação pesquisar
                },
                title: Text("Pesquisar", style: TextStyle(fontSize: 18)),
              ),
              ListTile(
                onTap: () {
                  _resetExpansionState();
                  //navegação cadastrar
                },
                title: Text("Cadastrar Novo", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          ListTile(
            onTap: () {
              _resetExpansionState();
              // navegação créditos
            },
            leading: Icon(
              Icons.description_outlined,
              size: 26,
              color: Colors.green.shade900,
            ),
            title: Text(
              "Créditos",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () {
              _resetExpansionState();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            leading: Icon(
              Icons.logout,
              size: 26,
              color: Colors.green.shade900,
            ),
            title: Text(
              "Sair",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
