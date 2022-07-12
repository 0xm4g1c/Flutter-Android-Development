// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tooodo/views/task_lists_containers.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // hard-coded a list of words. next we will get our to-do items from a database.
  // the database will contain all user input.
  List<String> toDoItems = [
    'play',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
  ];

  final TextEditingController _taskTextFieldController =
      TextEditingController();

  List<String> _toDoList = ['No tasks!'];

  // load from shared preference
  Future<void> _loadToDoItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _toDoList = prefs.getStringList('toDoList') ?? [];
    });
  }

  // save to shared preferences
  _saveToDoItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('toDoList', _toDoList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 152, 70),
        title: const Text('Tasks'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          // ignore: prefer_const_literals_to_create_immutables
          child: 
            ListView.builder(
                itemCount: _toDoList.length,
                itemBuilder: (context, index) {
                  return TaskContainer(
                    child: _toDoList[index],
                  );
                }),
          ),

      // floating action bar and onpressed function
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Scaffold
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                content: TextField(
                  controller: _taskTextFieldController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(hintText: 'Task'),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text("Save"),
                    onPressed: () {
                      setState(() {
                        _toDoList.add(_taskTextFieldController.text);
                        _taskTextFieldController.clear();
                        _saveToDoItems();
                      });

                      Navigator.of(context).pop();
                      _taskTextFieldController.clear();
                      setState(() {});
                    },
                  ),
                ],
              );
            },
          );
        },
        enableFeedback: true,
        child: const Icon(Icons.add),
      ),
    );
  }

  //  load list from shared preferences
  @override
  void initState() {
    _loadToDoItems();

    super.initState();
  }
}
