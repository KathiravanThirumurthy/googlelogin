class Usermodel {
  final String email;
  final String usertype;
  Usermodel({this.email, this.usertype});
  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(email: json["email"], usertype: json["usertype"]);
  }
}
