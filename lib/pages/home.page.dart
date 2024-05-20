import 'package:flutter/material.dart';
import 'package:flutter_application_1/CustomDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Tela Inicial", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.green.shade400,
      ),
      drawer: CustomDrawer(),
      body: Container(),
    );
  }
}
