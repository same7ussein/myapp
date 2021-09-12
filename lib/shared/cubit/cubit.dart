import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:untitled/modules/aechived_tasks/archived_tasks_screen.dart';
import 'package:untitled/modules/done_tasks/done_tasks_screen.dart';
import 'package:untitled/modules/new_tasks/new_tasks_screen.dart';
import 'package:untitled/shared/cubit/states.dart';
class appCubit extends Cubit<appStates>{
  appCubit() : super(AppInitialState());
  static appCubit get(context)=>BlocProvider.of(context);
   int CurrentIndex=0;
  List<Widget> Screens=[
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles=[
    'tasks',
    'done tasks',
    'archived tasks',
  ];
  void changeIndex(int index){
    CurrentIndex= index;
    emit(AppChangeBottomNavBarState());
  }
  late Database database;
  List<Map> tasks=[];
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY ,title TEXT,data TEXT,time TEXT,status TEXT)')
            .then((value) {
          print('table created ');
        }).catchError((error) {
          print('error is ${error!!!!!!!!!!}');
        })
        ;
      },
      onOpen: (database) {
        getDataFromDtabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }
  Future insertToDatabase(
      {
        required String title,
        required String time,
        required String date,
      }
      ) async
  {
    await database.transaction((txn)  {
   return txn.rawInsert(
        'INSERT INTO tasks (title,data,time,status) VALUES("$title","$time","$date","new")').then((value)
    {
        print('$value insert successfully');
        emit(AppInsertDatabaseState());
        getDataFromDtabase(database);
      }).catchError((error){
        print('error is ${error!!!!!!!!!!}');
        return null;
      });
    });
  }
 void getDataFromDtabase(database)
  {
    emit(AppGetDatabaseLoadingState());
     database.rawQuery('SELECT * FROM tasks').then((value) {
       tasks = value;
       print(tasks);
       value.forEach((element) {
         if(element['status']=='new')
           {
             newTasks.add(element);

           }
         else if(element['status']=='done')
         {
           doneTasks.add(element);

         }
         else
           {
             archivedTasks.add(element);
           }
       });
       emit(AppGetDatabaseState());
     });
  }

   void UpdateData(
  {
  required String status,
    required int id,
}
       ) async
   {
     database.rawUpdate('UPDATE tasks SET status =?, WHERE id= ?',
         ['$status', id]).then((value){
           emit(AppUpdateDatabaseState());
     });
   }
   void DeleteData
  (
  { required int id,}
  )
       {
    database.rawDelete('DELETE FROM Test WHERE name = ?', [id]).then((value) {
      getDataFromDtabase(database);
      emit(AppDeleteDatabaseState());
    });

      }


  bool isBottomSheetShown=false;
  IconData fabIcon= Icons.edit;
  void ChangeBottomSheetState(
  {
  required bool isShow,
    required IconData icon,
})
  {
    isBottomSheetShown=isShow;
    fabIcon=icon;
    emit(AppChangeBottomSheetState());
  }
}

