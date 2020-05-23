import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plantask/Components/form_text_field.dart';
import 'package:provider/provider.dart';
import 'package:plantask/Models/task_data.dart';


class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DateTime selectedDate;
  TimeOfDay selectedTime;
  final selectedTasktitle = TextEditingController();
  final selectedTaskDescription = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    selectedTasktitle.dispose();
    selectedTaskDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    String dateAsString = selectedDate.toString();
    String timeAsString = selectedTime.toString();

    return Scaffold(
      backgroundColor: Color(0xFF242629),
      appBar: AppBar(
        title: Text('ADD TASK'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.title, size: 30.0),
                    title: FormTextField(
                      hintText: 'Title of Task',
                      controller: selectedTasktitle,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ListTile(
                    leading: const Icon(Icons.description, size: 30.0),
                    title: FormTextField(
                      hintText: 'Description',
                      controller: selectedTaskDescription,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ListTile(
                    leading: const Icon(Icons.date_range, size: 30.0),
                    title: InkWell(
                      onTap: () {
                        _selectDate(context);   // Call Function that has showDatePicker()
                      },
                      child: IgnorePointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: selectedDate==null ? 'Select Date' : dateAsString.substring(0,10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              borderSide: BorderSide(),
                            ),
                          ),
                          onSaved: (val) {
                            dateAsString = val;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ListTile(
                    leading: const Icon(Icons.access_time, size: 30.0),
                    title: InkWell(
                      onTap: () {
                        _pickTime(context);   // Call Function that has showDatePicker()
                      },
                      child: IgnorePointer(
                        child: new TextFormField(
                          decoration: new InputDecoration(hintText:
                          selectedTime==null ? 'Select Time ' : timeAsString.substring(10,15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide: BorderSide(),
                          ),
                      ),
                          onSaved: (val) {
                            dateAsString = val;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RaisedButton(
                    elevation: 10.0,
                    color: Color(0xFF6200EE),
                    child: const Text(
                      'ADD TASK',
                      style: TextStyle(
                        letterSpacing: 2.0,
                      ),
                    ),
                    onPressed: () {

                      if(!_formkey.currentState.validate()){
                        return;
                      }

                        Provider.of<TaskData>(context, listen: false).addTask(
                          newTaskTitle: selectedTasktitle.text,
                          newDescription: selectedTaskDescription.text,
                          newDate: selectedDate,
                          newTime: selectedTime,
                        );
                        Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _pickTime(BuildContext context) async {
    final TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (t != null)
      setState(() {
        selectedTime = t;
      });
  }

}

