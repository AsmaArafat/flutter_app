import 'package:flutter_app/models/User.dart';
class UsersListResponse{
 // String Header,Details;
  List<User> users;

//  UsersListResponse({  this.Header, this.Details,
//    this.users});

  UsersListResponse({this.users});
  factory UsersListResponse.fromJson(Map<String,dynamic>json){
    Iterable usersList = json['data'];
    return UsersListResponse(
       // Header: json['Header'],
        //Details: json['Details'],
      users: usersList.map<User>((element)=> User.fromJson(element)).toList()
    );
  }

}