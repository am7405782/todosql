import 'package:flutter/material.dart';

import 'deafaultTextFromFaild.dart';

class DefaultShowBootom extends StatefulWidget {
  @override
  State<DefaultShowBootom> createState() => _DefaultShowBootomState();
}

class _DefaultShowBootomState extends State<DefaultShowBootom> {
  var titlecontrooler = TextEditingController();
  var timeinput = TextEditingController();
  var Datecontroller = TextEditingController();
  var DateTimeChose;

  var pickedTime;
  var formKey = GlobalKey<FormState>();

  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
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
                  print("P;eas enter Value ");
                }
              },
            ),
            SizedBox(
              height: size.height * 0.05,
            ),

            deafaultTextFromFaild(
                controller: timeinput,
                ladel: "Task time",
                prefixIcon: Icons.watch_later,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    print("Preas enter Value ");
                  }
                },
                onTad: () {
                  showTime().then((value) {
                    timeinput.text = value!.format(context);
                    print(value?.format(context));
                  });
                }),
            SizedBox(
              height: size.height * 0.05,
            ),
            deafaultTextFromFaild(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    print("P;eas enter Value ");
                  }
                },
                controller: Datecontroller,
                ladel: "Date",
                prefixIcon: Icons.date_range,
                onTad: () {
                  ShowDateDicker().then((value) {
                    Datecontroller.text = value.toString().substring(0, 10);
                    print(value.toString().substring(0, 10));
                  });
                }),
            SizedBox(
              height: size.height * 0.05,
            ),
            // MaterialButton(onPressed: (){
            //   formKey.currentState!.validate();
            //
            // },
            //   child: Container(
            //   padding: EdgeInsets.symmetric(horizontal: 60,vertical: 10),
            //   decoration: BoxDecoration(
            //     color: primaryColor,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   width: double.infinity,
            //
            //   child: Center(
            //     child: Text(
            //       "App Task",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 25,
            //
            //       ),
            //     ),
            //   ),
            // ),
            //
            // ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> ShowDateDicker() {
    DateTimeChose = showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));
    return DateTimeChose;
  }

  Future<TimeOfDay?> showTime() {
    pickedTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return pickedTime;
  }
}
