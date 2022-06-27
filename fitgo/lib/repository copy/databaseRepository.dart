import 'package:fitgo/database/database.dart';
import 'package:fitgo/database/entities/profile.dart';
import 'package:fitgo/database/entities/dati.dart';
import 'package:flutter/material.dart';

class DatabaseRepository extends ChangeNotifier{

  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllTodos() method of the DAO
  Future<List<Profile>> findAllProfiles() async{
    final results = await database.profileDao.findAllProfiles();
    return results;
  }//findAllTodos

  Future<Profile?> findAllUsernames(String username) async{
    final usernames = await database.profileDao.findAllUsernames(username);
    return usernames;
  }

  //This method wraps the insertTodo() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> insertProfile(Profile profile)async {
    await database.profileDao.insertProfile(profile);
    notifyListeners();
  }//insertTodo

  //This method wraps the deleteTodo() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> removeProfile(Profile profile) async{
    await database.profileDao.deleteProfile(profile);
    notifyListeners();
  }

  Future<DatiDB?> findAllUserId(String profileName) async{
    final result = await database.dataDao.findAllUserId(profileName);
    return result;
  }

  Future<List<DatiDB>> findAllData(String profileName) async{
    final result = await database.dataDao.findAllData(profileName);
    return result;
  }

  Future<void> insertData(DatiDB dati) async{
    await database.dataDao.insertData(dati);
    notifyListeners();
  }
  
  // Future<String?> returnPassword(String username) async{
  //   await database.profileDao.returnPassword(username);
  //   //notifyListeners();
  //   }//removeTodo
  
}//DatabaseRepository