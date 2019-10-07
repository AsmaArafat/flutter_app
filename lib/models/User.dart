class User {
  //int id;
  String Header, Details;

  User({this.Header, this.Details});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        Header: json['Header'],
        Details: json['Details']
//        firstName: json['first_name'],
//        lastName: json['last_name'],
//        image: json['avatar']
);
  }
  @override
  String toString() {
    return "{firstName: ${this.Header}, lastName: ${this.Details}}";
  }
}
