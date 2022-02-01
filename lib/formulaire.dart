import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _keyForm = GlobalKey<FormState>();

  String userID = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(// Rend la page scrollable
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'User ID',
                    border: OutlineInputBorder()
                  ),
                  validator: (val) => val!.isEmpty? 'Enter your user id': null,
                  onChanged: (val) => userID = val,
                ),
                SizedBox(height: 40.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder()
                  ),
                  obscureText: true,
                  onChanged: (val) => password = val,
                ),
                SizedBox(height: 40.0),
                OutlinedButton(
                  onPressed: (){
                    if (_keyForm.currentState!.validate()){
                      Navigator.pushReplacementNamed(
                        context,
                        '/home',
                        arguments: {
                          'userID': userID
                        }
                      );
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                  child: Text(
                    'Log In'
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
