import 'package:flutter/cupertino.dart';
import 'package:flutterSigninsetup/models/usermodel.dart';
import 'package:flutterSigninsetup/viewmodels/Registereduserviewmodel.dart';
import 'package:flutterSigninsetup/webservice/webserviceuserapi.dart';

class Registereduserlistviewmodel extends ChangeNotifier {
  List<Registereduserviewmodel> registereduser =
      List<Registereduserviewmodel>();
  Registereduserlistviewmodel({_populateData()});
  void populateData() async {
    List<Usermodel> usermodels = await Webservice().fetchUsers();
    this.registereduser = usermodels
        .map((regusermodel) => Registereduserviewmodel(user: regusermodel))
        .toList();
    notifyListeners();
  }
}
