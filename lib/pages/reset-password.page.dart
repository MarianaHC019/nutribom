import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Icon(Icons.lock_outline,
                  size: 120, color: Colors.green.shade900),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Esqueceu sua senha?",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Informe o E-mail para receber as instruções para a restauração da senha",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: true,
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
            ),
            SizedBox(height: 30),
            ButtonTheme(
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () => {},
                  child: const Text(
                    "Enviar E-mail",
                    //color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
