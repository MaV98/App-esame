import 'package:fitgo/database/entities/profile.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class ProfileDao {

  //Query #1: SELECT -> this allows to obtain all the entries of the Todo table
  @Query('SELECT * FROM Profile')
  Future<List<Profile>> findAllProfiles();

  @Query('SELECT * FROM Profile WHERE username = :username')
  Future<Profile?> findAllUsernames(String username);

  // @Query('SELECT password FROM Profile WHERE username = :username')
  // Future<String?> returnPassword(String username);

  //Query #2: INSERT -> this allows to add a Todo in the table
  @insert
  Future<void> insertProfile(Profile profile);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  @delete
  Future<void> deleteProfile(Profile profile);

  
}//T