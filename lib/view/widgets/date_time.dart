import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

DateTimePicker picker({
  required dateTimeController,
}) =>
    DateTimePicker(
      type: DateTimePickerType.dateTimeSeparate,
      dateMask: 'd MMM, yyyy',
      // initialValue: DateTime.now().toString(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      icon: Icon(Icons.event),
      dateLabelText: 'Date',
      timeLabelText: "Hour",
      controller: dateTimeController,

      // decoration:InputDecoration(
      //   border:  OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      // ),
      selectableDayPredicate: (date) {
        return true;
      },
      // onChanged: (val) => print(val),
      validator: (val) {
        if (val!.isEmpty) {
          return "please enter date";
        }
        return null;
      },
      // onSaved: (val) => print(val),
    );

DateTimePicker pickerRegister({
  required dateTimeController,
}) =>
    DateTimePicker(
      type: DateTimePickerType.dateTimeSeparate,
      dateMask: 'd MMM, yyyy',
      // initialValue: DateTime.now().toString(),
      firstDate: DateTime(1800),
      lastDate: DateTime(2023),
      icon: Icon(Icons.event),
      dateLabelText: 'Date',
      timeLabelText: "Hour",
      controller: dateTimeController,
      // decoration:InputDecoration(
      //   border:  OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      // ),
      selectableDayPredicate: (date) {
        return true;
      },
      // onChanged: (val) => print(val),
      validator: (val) {
        if (val!.isEmpty) {
          return "please enter date";
        }
        return null;
      },
      // onSaved: (val) => print(val),
    );
