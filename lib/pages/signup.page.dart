import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              width: 130,
              height: 130,
              alignment: Alignment(0.0, 1.35),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Container(
                height: 46,
                width: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green.shade900,
                  border: Border.all(
                    width: 3.0,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(46),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: () {},
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome",
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
              height: 5,
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
              height: 5,
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
            SizedBox(
              height: 5,
            ),
            TextFormField(
              autofocus: true,
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
            ),
            SizedBox(height: 20),
            ButtonTheme(
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () => {},
                  child: const Text(
                    "Cadastrar-se",
                  ),
                )),
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
    );
  }
}
