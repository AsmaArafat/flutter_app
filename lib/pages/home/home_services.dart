import 'package:flutter_app/services/services.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/UsersListResponse.dart';
//Acts as home view presenter
class HomeServices{
  Future<List<User>> getUsers()async{
    try {
      Map<String,dynamic> usersResponseJson = await Services().get("NewsTicker");
      UsersListResponse usersListResponse = UsersListResponse.fromJson(usersResponseJson);
      List<User> users = usersListResponse.users;
      //print("News list");
      //print(users.toString());
      return users;
    }  catch (e) {
      throw e;
    }

  }
}