import 'package:flutter/material.dart';
import 'package:todosql/shared/color/color.dart';

Widget deafaultTextFromFaild({
  required TextEditingController controller,
  Function()? onTad,
  String? Function(String?)? validator,
  String? Function(String?)? onChanged,
  required String ladel,
  required IconData prefixIcon,
}) =>
    TextFormField(
      controller: controller,
      onTap: onTad,
      keyboardType: TextInputType.name,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 30,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
        ),
        label: Text(ladel),
        prefixIcon: Icon(
          prefixIcon,
        ),
      ),
    );

Widget TaskList(Map Model) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Text("${Model["time"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                backgroundColor: primaryColor,
                radius: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  children: [
                    Text(
                      "${Model["title"]}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${Model["date"]}",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
