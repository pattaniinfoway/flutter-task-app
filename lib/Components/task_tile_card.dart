import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class TaskTileCard extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final String taskDescription;
  final dynamic taskDate;
  final dynamic taskTime;
  final Function toggleCheckValue;
  final Function longpressCallback;

  TaskTileCard(
      {this.isChecked = false,
      this.taskTitle,
      this.toggleCheckValue,
      this.longpressCallback,
      this.taskDescription,
      this.taskDate,
      this.taskTime});

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontFamily: 'OpenSans',
        ),
      ),
      children: <Widget>[
        Divider(
          thickness: 1.0,
          height: 1.0,
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              taskDescription,
              style: TextStyle(
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              onPressed: null,
              child: Text(taskDate),
            ),
            FlatButton(
              onPressed: null,
              child: Text(taskTime),
            ),
          ],
        ),
      ],
      trailing: Checkbox(
        activeColor: Color(0xFF7f5af0),
        value: isChecked,
        onChanged: toggleCheckValue,
      ),
    );
  }
}
