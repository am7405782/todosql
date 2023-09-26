import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosql/shared/Dloc/statesDloc.dart';

import '../Screen/Widget/deafaultTextFromFaild.dart';
import '../shared/Dloc/MyBloc.dart';

class HomeLayout extends StatelessWidget {
  static const String id = "HomeLayout";

  @override
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var titlecontrooler = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => MyBloc()..CreatDataBase(),
      child: BlocConsumer<MyBloc, Mystates>(
        listener: (context, state) {
          if (state is AppinsertDataBaserState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: ScaffoldKey,
            appBar: AppBar(
              title: Text(
                MyBloc.get(context).title[MyBloc.get(context).index],
              ),
            ),
            body: MyBloc.get(context).tasks.length == 0
                ? Center(child: CircularProgressIndicator())
                : MyBloc.get(context).tads[MyBloc.get(context).index],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (MyBloc.get(context).showBottomSheet) {
                  if (formKey.currentState!.validate()) {
                    MyBloc.get(context)
                        .InsertDataBase(
                      title: titlecontrooler.text,
                      date: MyBloc.get(context).Datecontroller.text,
                      time: MyBloc.get(context).timeinput.text,
                    )
                        .then((value) {
                      MyBloc.get(context).ChangeIcon(false, Icons.edit);
                    });
                  }
                } else {
                  ScaffoldKey.currentState
                      ?.showBottomSheet(
                        (context) => Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  deafaultTextFromFaild(
                                    controller: titlecontrooler,
                                    ladel: "Title",
                                    prefixIcon: Icons.text_fields_rounded,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "pleas enter time ";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                  deafaultTextFromFaild(
                                      controller: MyBloc.get(context).timeinput,
                                      ladel: "Task time",
                                      prefixIcon: Icons.watch_later,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "pleas enter time ";
                                        }
                                        return null;
                                      },
                                      onTad: () {
                                        MyBloc.get(context).showTime(context);
                                      }),
                                  SizedBox(
                                    height: size.height * 0.06,
                                  ),
                                  deafaultTextFromFaild(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "pleas enter time ";
                                        }
                                        return null;
                                      },
                                      controller:
                                          MyBloc.get(context).Datecontroller,
                                      ladel: "Date",
                                      prefixIcon: Icons.date_range,
                                      onTad: () {
                                        MyBloc.get(context)
                                            .ShowDateDicker(context);
                                      }),
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        elevation: 0,
                      )
                      .closed
                      .then((value) {
                    MyBloc.get(context).ChangeIcon(false, Icons.edit);
                  });
                  MyBloc.get(context).ChangeIcon(true, Icons.add);
                }
              },
              child: Icon(
                MyBloc.get(context).iconshow,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: MyBloc.get(context).index,
              onTap: (Index) {
                MyBloc.get(context).ChangengeIndex(Index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: "Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.ac_unit,
                  ),
                  label: "Done",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive,
                  ),
                  label: "archive",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: "settings",
                ),
              ],
            ),
          );
        },
      ),
    );
  }

// Future<DateTime?> ShowDateDicker(){
//   DateTimeChose= showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2025)
//   ) ;
//   return DateTimeChose;
// }
// Future<TimeOfDay?> showTime(){
//   pickedTime =  showTimePicker(
//     context: context,
//     initialTime:TimeOfDay.now(),
//   );
//
//   return pickedTime ;
// }
//
}
