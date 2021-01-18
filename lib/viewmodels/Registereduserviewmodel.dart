import 'package:flutterSigninsetup/models/usermodel.dart';

class Registereduserviewmodel {
  Usermodel _usermodel;
  Registereduserviewmodel({Usermodel user}) : _usermodel = user;
  String get useremail {
    return _usermodel.email;
  }

  String get usetype {
    return _usermodel.usertype;
  }
}
