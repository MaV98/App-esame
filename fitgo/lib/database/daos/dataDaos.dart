import 'package:fitgo/database/entities/dati.dart';
import 'package:fitgo/database/entities/dati.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class DataDao {

  //Query #1: SELECT -> this allows to obtain all the entries of the Todo table
  // @Query('SELECT * FROM Dati')
  // Future<List<Dati>> findAllProfiles();

  @Query('SELECT * FROM DatiDB WHERE profileName = :username')
  Future<DatiDB?> findAllUserId(String username);

  // @Query('SELECT password FROM Profile WHERE username = :username')
  // Future<String?> returnPassword(String username);

  @Query('SELECT * FROM DatiDB WHERE profileName = :username')
  Future<List<DatiDB>> findAllData(String username);

  @insert
  Future<void> insertData(DatiDB dati);//Query #2: INSERT -> this allows to add a Todo in the table


  // @update
  // Future<void> updatePassi(double dati);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  // @delete
  // Future<void> deleteProfile(Profile profile);

  
}//T