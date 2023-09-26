import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosql/shared/Dloc/MyBloc.dart';

import '../shared/Dloc/statesDloc.dart';
import 'Widget/deafaultTextFromFaild.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, Mystates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) => TaskList(
                  MyBloc.get(context).tasks[index],
                ),
            separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: 4,
                  ),
                ),
            itemCount: MyBloc.get(context).tasks.length);
      },
    );
  }
}
