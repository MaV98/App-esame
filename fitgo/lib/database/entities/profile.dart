import 'package:floor/floor.dart';

//Here, we are saying to floor that this is a class that defines an entity
@entity
class Profile {
  //id will be the primary key of the table. Moreover, it will be autogenerated.
  //id is nullable since it is autogenerated.
  @PrimaryKey(autoGenerate: true)
  final int? id; 

  //For the sake of simplicity, a Todo has only a name.
  final String name;

  final String username;
  final String password;

  //Default constructor
  Profile(this.id, this.name, this.username, this.password);

  String retUsername(){
    return username;
  }

  String retPassword(){
    return password;
  }
  
}