import 'package:flutter/material.dart';
import './Home.dart';

class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }  
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.supervisor_account),
                    hintText: 'Input the email'),
                validator: (value) {
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: 'Input the password'),
                validator: (value) {
                  return value.length < 6 ? 'Your password must contains at least 6 tua': null;
                },
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage())
                  );
                },
              )
            ],
          ),
          width: 300,
        ),
      ),
    );
  }
}

