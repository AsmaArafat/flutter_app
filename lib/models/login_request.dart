class LoginRequest{
  String username, password;

  LoginRequest({this.username, this.password});

  dynamic toJson(){
    Map<String,dynamic> json = Map();
    json['email'] = this.username;
    json['password'] = this.password;
    return json;
  }

}