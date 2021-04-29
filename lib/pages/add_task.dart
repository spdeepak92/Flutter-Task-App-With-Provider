import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/tasks.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 100.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue.shade100,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'ADD TASKS',
          style: TextStyle(
            fontSize: 25.0,
            letterSpacing: 5.0,
            color: Colors.blue.shade100,
            decoration: TextDecoration.overline,
          ),
        ),
      ),
      body: AddTaskNow(),
    );
  }
}

class AddTaskNow extends StatefulWidget {
  @override
  _AddTaskNowState createState() => _AddTaskNowState();
}

class _AddTaskNowState extends State<AddTaskNow> {
  var fieldText = TextEditingController();
  var fieldDate = TextEditingController();
  String inputText = '';
  String inputDate = '';
  var currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _taskProvider = Provider.of<Tasks>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: fieldText,
                    maxLines: 6,
                    keyboardType: TextInputType.multiline,
                    onChanged: (text) {
                      inputText = text;
                    },
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                    ),
                    decoration: new InputDecoration(
                      hintText: 'Enter a task . . .',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: fieldDate,
                        keyboardType: TextInputType.datetime,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0,
                        ),
                        decoration: new InputDecoration(
                          labelText: 'Date',
                          border: InputBorder.none,
                        ),
                        onChanged: (val) {
                          inputText = val;
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () {
                  print(inputText);
                  print(inputDate);
                  _taskProvider.addTask({
                    'date': inputDate,
                    'task': inputText,
                    'status': 'UPCOMING'
                  });
                  inputDate = '';
                  fieldDate.clear();
                  fieldText.clear();
                },
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  'ADD',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != currentDate)
      setState(() {
        currentDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        fieldDate.text = date;
        inputDate = date;
      });
  }
}
