import 'package:flutter/material.dart';

class BirthdateForm extends StatefulWidget {
  @override
  _BirthdateFormState createState() => _BirthdateFormState();
}

class _BirthdateFormState extends State<BirthdateForm> {
  DateTime? selectedDate;
  TextEditingController? _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _textEditingController!.text = selectedDate.toString().substring(0, 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _textEditingController,
            onTap: () => _selectDate(context),
          ),
        ],
      ),
    );
  }
}
