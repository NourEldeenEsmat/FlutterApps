import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'main_state.dart';
import 'package:path/path.dart';

class MainCubit extends Cubit<MainStates>{
  MainCubit() : super(InitState());

  static MainCubit get(context)=>BlocProvider.of(context);

  var addTextController=TextEditingController();

  inisql() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'goals.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Goals (id INTEGER PRIMARY KEY, name TEXT)');
        });
  }
  List<Map> list=[];
  getData () async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'goals.db');
    Database database = await openDatabase(path);

    await database.rawQuery('SELECT * FROM goals').then((value){
      list=value;
      emit(GetDataSuccessStates());
    }).catchError((onError){
      print(onError.toString());
      emit(GetDataErrorStates());
    });
    database.close();

  }
 insertData(String name) async {
   var databasesPath = await getDatabasesPath();
   String path = join(databasesPath, 'goals.db');
   Database database = await openDatabase(path);

   await database.rawInsert(
       'INSERT INTO Goals(name) VALUES(?)',
       ['$name']).then((value){
         emit(InsertDataSuccessStates());
   }).catchError((onError){
     emit(InsertDataErrorStates());
     print(onError.toString());
   });
   database.close();
 }

 removeData(int id) async {
   var databasesPath = await getDatabasesPath();
   String path = join(databasesPath, 'goals.db');
   Database database = await openDatabase(path);

   await database
       .rawDelete('DELETE FROM Goals WHERE id = ?', ['$id']).then((value){
     emit(RemoveDataSuccessStates());
   }).catchError((onError){
     emit(RemoveDataErrorStates());
     print(onError.toString());
   });
   database.close();
 }
 updateData(String name,int id) async {
   var databasesPath = await getDatabasesPath();
   String path = join(databasesPath, 'goals.db');
   Database database = await openDatabase(path);

   await database.rawUpdate(
       'UPDATE Goals SET name = ? WHERE id = ?',
       ['$name', '$id']).then((value){
     emit(UpdateDataSuccessStates());
   }).catchError((onError){
     emit(UpdateDataErrorStates());
     print(onError.toString());
   });
   database.close();
 }

}

