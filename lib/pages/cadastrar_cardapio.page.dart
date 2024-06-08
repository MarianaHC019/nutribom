import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_drawer.dart';
import 'package:flutter_application_1/models/alimento.dart';
import 'package:flutter_application_1/models/cardapio.dart';
import 'package:flutter_application_1/models/paciente.dart';
import 'package:flutter_application_1/provider/alimentos.dart';
import 'package:flutter_application_1/provider/cardapios.dart';
import 'package:flutter_application_1/provider/pacientes.dart';
import 'package:provider/provider.dart';

class CadastrarCardapio extends StatefulWidget {
  @override
  _CadastrarCardapioState createState() => _CadastrarCardapioState();
}

class _CadastrarCardapioState extends State<CadastrarCardapio> {
  Paciente? nomePaciente;
  Alimento? cafeDaManha1;
  Alimento? cafeDaManha2;
  Alimento? cafeDaManha3;
  Alimento? almoco1;
  Alimento? almoco2;
  Alimento? almoco3;
  Alimento? almoco4;
  Alimento? almoco5;
  Alimento? jantar1;
  Alimento? jantar2;
  Alimento? jantar3;
  Alimento? jantar4;
  final _form = GlobalKey<FormState>();
  final Map<String, String?> _formData = {};

  void _loadFormData(Cardapio? cardapio) {
    if (cardapio != null) {
      _formData['id'] = cardapio.id;
      _formData['nomePaciente'] = cardapio.nomePaciente;
      _formData['ca1'] = cardapio.ca1;
      _formData['ca2'] = cardapio.ca2;
      _formData['ca3'] = cardapio.ca3;
      _formData['al1'] = cardapio.al1;
      _formData['al2'] = cardapio.al2;
      _formData['al3'] = cardapio.al3;
      _formData['al4'] = cardapio.al4;
      _formData['al5'] = cardapio.al5;
      _formData['ja1'] = cardapio.ja1;
      _formData['ja2'] = cardapio.ja2;
      _formData['ja3'] = cardapio.ja3;
      _formData['ja4'] = cardapio.ja4;
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<Pacientes>(context, listen: false).loadPacientes();
    Provider.of<Alimentos>(context, listen: false).loadAlimentos();
  }

  @override
  Widget build(BuildContext context) {
    final pacientesData = Provider.of<Pacientes>(context);
    final pacientes = pacientesData.all;
    final alimentosData = Provider.of<Alimentos>(context);
    final alimentos = alimentosData.all;
    final Cardapio? cardapio =
        ModalRoute.of(context)?.settings.arguments as Cardapio?;

    _loadFormData(cardapio);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          nomePaciente?.nome ?? "Novo cardápio",
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.green.shade400,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValid = _form.currentState?.validate();

              if (isValid == true) {
                _form.currentState?.save();
                _formData['nomePaciente'] = nomePaciente?.nome;
                _formData['ca1'] = cafeDaManha1?.nomeAlimento;
                _formData['ca2'] = cafeDaManha2?.nomeAlimento;
                _formData['ca3'] = cafeDaManha3?.nomeAlimento;
                _formData['al1'] = almoco1?.nomeAlimento;
                _formData['al2'] = almoco2?.nomeAlimento;
                _formData['al3'] = almoco3?.nomeAlimento;
                _formData['al4'] = almoco4?.nomeAlimento;
                _formData['al5'] = almoco5?.nomeAlimento;
                _formData['ja1'] = jantar1?.nomeAlimento;
                _formData['ja2'] = jantar2?.nomeAlimento;
                _formData['ja3'] = jantar3?.nomeAlimento;
                _formData['ja4'] = jantar4?.nomeAlimento;
                Provider.of<Cardapios>(context, listen: false).put(Cardapio(
                  id: _formData['id'],
                  nomePaciente: _formData['nomePaciente'] ?? '',
                  ca1: _formData['ca1'] ?? '',
                  ca2: _formData['ca2'] ?? '',
                  ca3: _formData['ca3'] ?? '',
                  al1: _formData['al1'] ?? '',
                  al2: _formData['al2'] ?? '',
                  al3: _formData['al3'] ?? '',
                  al4: _formData['al4'] ?? '',
                  al5: _formData['al5'] ?? '',
                  ja1: _formData['ja1'] ?? '',
                  ja2: _formData['ja2'] ?? '',
                  ja3: _formData['ja3'] ?? '',
                  ja4: _formData['ja4'] ?? '',
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
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                DropdownButtonFormField<Paciente>(
                  hint: Text('Selecione um Paciente'),
                  value: nomePaciente,
                  onChanged: (Paciente? newValue) {
                    setState(() {
                      nomePaciente = newValue;
                    });
                  },
                  items: pacientes.map((Paciente paciente) {
                    return DropdownMenuItem<Paciente>(
                      value: paciente,
                      child: Text(
                        paciente.nome,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.green.shade400,
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Café da Manhã",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField<Alimento>(
                  hint: Text('Selecione um item'),
                  value: cafeDaManha1,
                  onChanged: (Alimento? newValue) {
                    setState(() {
                      cafeDaManha1 = newValue;
                    });
                  },
                  items: alimentos.map((Alimento alimento) {
                    return DropdownMenuItem<Alimento>(
                      value: alimento,
                      child: Text(
                        alimento.nomeAlimento,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<Alimento>(
                  hint: Text('Selecione um item'),
                  value: cafeDaManha2,
                  onChanged: (Alimento? newValue) {
                    setState(() {
                      cafeDaManha2 = newValue;
                    });
                  },
                  items: alimentos.map((Alimento alimento) {
                    return DropdownMenuItem<Alimento>(
                      value: alimento,
                      child: Text(
                        alimento.nomeAlimento,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<Alimento>(
                  hint: Text('Selecione um item'),
                  value: cafeDaManha3,
                  onChanged: (Alimento? newValue) {
                    setState(() {
                      cafeDaManha3 = newValue;
                    });
                  },
                  items: alimentos.map((Alimento alimento) {
                    return DropdownMenuItem<Alimento>(
                      value: alimento,
                      child: Text(
                        alimento.nomeAlimento,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Divider(color: Colors.green.shade400),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Almoço",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField<Alimento>(
                  hint: Text('Selecione um item'),
                  value: almoco1,
                  onChanged: (Alimento? newValue) {
                    setState(() {
                      almoco1 = newValue;
                    });
                  },
                  items: alimentos.map((Alimento alimento) {
                    return DropdownMenuItem<Alimento>(
                      value: alimento,
                      child: Text(
                        alimento.nomeAlimento,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<Alimento>(
                  hint: Text('Selecione um item'),
                  value: almoco2,
                  onChanged: (Alimento? newValue) {
                    setState(() {
                      almoco2 = newValue;
                    });
                  },
                  items: alimentos.map((Alimento alimento) {
                    return DropdownMenuItem<Alimento>(
                      value: alimento,
                      child: Text(
                        alimento.nomeAlimento,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<Alimento>(
                  hint: Text('Selecione um item'),
                  value: almoco3,
                  onChanged: (Alimento? newValue) {
                    setState(() {
                      almoco3 = newValue;
                    });
                  },
                  items: alimentos.map((Alimento alimento) {
                    return DropdownMenuItem<Alimento>(
                      value: alimento,
                      child: Text(
                        alimento.nomeAlimento,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<Alimento>(
                  hint: Text('Selecione um item'),
                  value: almoco4,
                  onChanged: (Alimento? newValue) {
                    setState(() {
                      almoco4 = newValue;
                    });
                  },
                  items: alimentos.map((Alimento alimento) {
                    return DropdownMenuItem<Alimento>(
                      value: alimento,
                      child: Text(
                        alimento.nomeAlimento,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<Alimento>(
                  hint: Text('Selecione um item'),
                  value: almoco5,
                  onChanged: (Alimento? newValue) {
                    setState(() {
                      almoco5 = newValue;
                    });
                  },
                  items: alimentos.map((Alimento alimento) {
                    return DropdownMenuItem<Alimento>(
                      value: alimento,
                      child: Text(
                        alimento.nomeAlimento,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Divider(color: Colors.green.shade400),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Jantar",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField<Alimento>(
                  hint: Text('Selecione um item'),
                  value: jantar1,
                  onChanged: (Alimento? newValue) {
                    setState(() {
                      jantar1 = newValue;
                    });
                  },
                  items: alimentos.map((Alimento alimento) {
                    return DropdownMenuItem<Alimento>(
                      value: alimento,
                      child: Text(
                        alimento.nomeAlimento,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<Alimento>(
                  hint: Text('Selecione um item'),
                  value: jantar2,
                  onChanged: (Alimento? newValue) {
                    setState(() {
                      jantar2 = newValue;
                    });
                  },
                  items: alimentos.map((Alimento alimento) {
                    return DropdownMenuItem<Alimento>(
                      value: alimento,
                      child: Text(
                        alimento.nomeAlimento,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<Alimento>(
                  hint: Text('Selecione um item'),
                  value: jantar3,
                  onChanged: (Alimento? newValue) {
                    setState(() {
                      jantar3 = newValue;
                    });
                  },
                  items: alimentos.map((Alimento alimento) {
                    return DropdownMenuItem<Alimento>(
                      value: alimento,
                      child: Text(
                        alimento.nomeAlimento,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<Alimento>(
                  hint: Text('Selecione um item'),
                  value: jantar4,
                  onChanged: (Alimento? newValue) {
                    setState(() {
                      jantar4 = newValue;
                    });
                  },
                  items: alimentos.map((Alimento alimento) {
                    return DropdownMenuItem<Alimento>(
                      value: alimento,
                      child: Text(
                        alimento.nomeAlimento,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
