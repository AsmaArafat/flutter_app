//import 'package:flutter/material.dart';
//import 'package:iti_app/pages/login/login_services.dart';
//import 'package:iti_app/pages/home/home_view.dart';
//
//class LoginView extends StatefulWidget {
//  @override
//  _LoginViewState createState() => _LoginViewState();
//}
//
//class _LoginViewState extends State<LoginView> {
//  String _username, _password;
//  final _formKey = GlobalKey<FormState>();
//  final scaffoldKey = new GlobalKey<ScaffoldState>();
//  FocusNode passwordNode = FocusNode();
//  bool _isLoading = false;
//
//  void _showLoading() {
//    setState(() {
//      _isLoading = true;
//    });
//  }
//
//  void _dissmissLoading() {
//    setState(() {
//      _isLoading = false;
//    });
//  }
//
//  void _submit() async {
//    if (_formKey.currentState.validate()) {
//      _showLoading();
//      _formKey.currentState.save();
//      print("Username: $_username");
//      print("Password: $_password");
//      LoginServices().performLogin(_username, _password).then((onResponse) {
//        _dissmissLoading();
//        Navigator.of(context).pushReplacement(
//            MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
//      }, onError: (error) {
//        _dissmissLoading();
//        scaffoldKey.currentState
//            .showSnackBar(new SnackBar(content: Text(error.message)));
//      });
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      key: scaffoldKey,
//      body: Center(
//        child: SingleChildScrollView(
//          child: Padding(
//            padding: const EdgeInsets.all(16.0),
//            child: Form(
//                key: _formKey,
//                child: Column(
//                  mainAxisSize: MainAxisSize.max,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    TextFormField(
//                      textInputAction: TextInputAction.next,
//                      keyboardType: TextInputType.text,
//                      onSaved: (String value) {
//                        setState(() {
//                          _username = value;
//                        });
//                      },
//                      onFieldSubmitted: (String value) {
//                        FocusScope.of(context).requestFocus(passwordNode);
//                      },
//                      validator: (String value) {
//                        if (value == null || value.isEmpty) {
//                          return "Please enter username";
//                        }
//                      },
//                      decoration: InputDecoration(
//                          focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color: Colors.grey)),
//                          labelText: "Username",
//                          labelStyle: TextStyle(fontSize: 20.0),
//                          border: OutlineInputBorder()),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top: 15.0),
//                    ),
//                    TextFormField(
//                      textInputAction: TextInputAction.done,
//                      keyboardType: TextInputType.text,
//                      obscureText: true,
//                      onSaved: (String value) {
//                        setState(() {
//                          _password = value;
//                        });
//                      },
//                      focusNode: passwordNode,
//                      validator: (String value) {
//                        if (value == null || value.isEmpty) {
//                          return "Please enter password";
//                        }
//                      },
//                      decoration: InputDecoration(
//                          focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color: Colors.grey)),
//                          labelText: "Password",
//                          labelStyle: TextStyle(fontSize: 20.0),
//                          border: OutlineInputBorder()),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top: 15.0),
//                    ),
//                    _isLoading
//                        ? Center(
//                            child: CircularProgressIndicator(),
//                          )
//                        : Row(
//                            mainAxisSize: MainAxisSize.max,
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              Expanded(
//                                child: RaisedButton(
//                                  onPressed: _submit,
//                                  child: Text("Login"),
//                                ),
//                              ),
//                            ],
//                          ),
//                  ],
//                )),
//          ),
//        ),
//      ),
//    );
//  }
//}
