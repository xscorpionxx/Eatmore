import 'package:resturant/main.dart';

class Helper{

  static void save_user(username , password){
    sharedPreferences?.setString("username", username);
    sharedPreferences?.setString("password", password);
  }

}