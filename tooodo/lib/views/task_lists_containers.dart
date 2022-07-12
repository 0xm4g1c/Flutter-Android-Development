
import 'package:flutter/material.dart';

class TaskContainer extends StatefulWidget {
  const TaskContainer({Key? key, required this.child}) : super(key: key);
  final String child;

  @override
  State<TaskContainer> createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  bool _checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.03),
          borderRadius: BorderRadius.circular(7),
        ),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            widget.child,
            style: TextStyle(
              color: _checkBoxValue ? const Color.fromARGB(255, 12, 26, 218): null,
              fontSize: 16.0,
                decoration: _checkBoxValue ? TextDecoration.lineThrough : null),
          ),
          value: _checkBoxValue,
          onChanged: (value) {
            setState(() {
              _checkBoxValue = value!;
            });
          },
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
