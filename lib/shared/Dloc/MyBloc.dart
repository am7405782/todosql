import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todosql/shared/Dloc/statesDloc.dart';

import '../../Screen/arachive.dart';
import '../../Screen/done.dart';
import '../../Screen/setting.dart';
import '../../Screen/tasks.dart';

class MyBloc extends Cubit<Mystates> {
  MyBloc() : super(initialstate());

  static MyBloc get(context) => BlocProvider.of(context);
  int index = 0;
  List<Widget> tads = [
    Tasks(),
    Done(),
    Arachive(),
    Setting(),
  ];
  List<String> title = ["New Task", "Done Task", "Arachive TAsk", "Setting"];
  Database? database;
  List<Map> tasks = [];

  Future<Database?> CreatDataBase() async {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        print("Creat DataBase ");
        await database
            .execute('CREATE TABLE tasks('
                'id INTEGER PRIMARY KEY, '
                'title TEXT, '
                'date TEXT, '
                'time TEXT,'
                'status TEXT)')
            .catchError((error) {
          print("eerror in creat table in database ${error}");
        });
      },
      onOpen: (database) {
        print("DataBase Open");
        GetDataFromData(database).then((value) {
          tasks = value;
          print(tasks);
          emit(AppGetDataBaserState());
        });
      },
    ).then((value) {
      database = value;
      emit(AppCreatDataBaserState());
    });
  }

  Future<void> InsertDataBase({
    required String title,
    required String time,
    required String date,
  }) async {
    try {
      await database?.transaction((txn) async {
        final value =
            await txn.rawInsert('INSERT INTO tasks(title, date, time, status)'
                ' VALUES("$title", "$date", "$time", "new")');

        if (value != null) {
          print("Insert successful. Inserted row ID: $value");
          emit(AppinsertDataBaserState());
          GetDataFromData(database).then((value) {
            tasks = value;
            print(tasks);
            emit(AppGetDataBaserState());
          });
        } else {
          print("Insert failed. No row ID returned.");
        }
      });
    } catch (error) {
      print("Error during insert: $error");
    }
  }

  Future<List<Map>> GetDataFromData(database) async {
    return await database?.rawQuery('SELECT * FROM tasks');
  }

  void ChangengeIndex(int Index) {
    index = Index;
    emit(AppChangeBootonNavBarState());
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////

  bool showBottomSheet = false;
  IconData iconshow = Icons.edit;

  void ChangeIcon(bool Isshow, IconData icon) {
    showBottomSheet = Isshow;
    iconshow = icon;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  var pickedTime;
  var Datecontroller = TextEditingController();

  ShowDateDicker(BuildContext context) async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2025))
        .then((value) {
      Datecontroller.text = value.toString().substring(0, 10);
      emit(AppChangeData());
    });
  }

/////////////////////////////////////////////////////////////////////////////////////////////////

  var timeinput = TextEditingController();

  showTime(BuildContext context) {
    pickedTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      timeinput.text = value!.format(context);
      emit(AppChangetime());
    });
  }
}
