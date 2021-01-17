import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoggedIn = false;
  bool _isChecked = false;
  String emailStr = "";
  var listIndex = 0;
  var listEmail = [
    "tkathiravan1976@gmail.com",
    "tkathiravan1976image@gmail.com"
  ];
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  _logIn() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  _logOut() async {
    await _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _isLoggedIn
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    _googleSignIn.currentUser.photoUrl,
                    height: 50,
                    width: 50,
                  ),
                  Text(
                    _googleSignIn.currentUser.displayName,
                  ),
                  Text(_googleSignIn.currentUser.email),
                  FlatButton(
                    child: Text("Google SignOut"),
                    onPressed: () => _logOut(),
                    color: Colors.red,
                  ),
                ],
              )
            : FlatButton(
                child: Text("Google SignIn"),
                onPressed: () => _logIn(),
                color: Colors.blue,
              ),
      ),
    );
  }
}
