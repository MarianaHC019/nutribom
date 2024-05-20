import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/home.page.dart';
import 'package:flutter_application_1/pages/reset-password.page.dart';
import 'package:flutter_application_1/pages/signup.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 80,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 160,
              height: 160,
              child: Image.asset('assets/images/logoapp.png'),
            ),
            SizedBox(
              height: 40,
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
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: true,
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
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  "Recuperar Senha",
                  style: TextStyle(color: Colors.green.shade900),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(),
                    ),
                  );
                },
                style:
                    TextButton.styleFrom(backgroundColor: Colors.transparent),
              ),
            ),
            SizedBox(height: 25),
            ButtonTheme(
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: const Text(
                    "Entrar",
                  ),
                )),
            SizedBox(
              height: 5,
            ),
            ButtonTheme(
                height: 60.0,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Criar conta",
                    style: TextStyle(
                      color: Color(0xFF1B5E20),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
