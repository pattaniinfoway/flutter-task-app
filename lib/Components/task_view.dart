import 'package:flutter/material.dart';
import 'task_tile_card.dart';
import 'package:plantask/Models/task_data.dart';
import 'package:provider/provider.dart';

class TaskView extends StatefulWidget {
  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context,index){
          return Dismissible(
            child: TaskTileCard(
              taskTitle: Provider.of<TaskData>(context).tasks[index].title,
              taskDescription: Provider.of<TaskData>(context).tasks[index].description,
              taskDate: Provider.of<TaskData>(context).tasks[index].date.toString().substring(0,10) ,
              taskTime: Provider.of<TaskData>(context).tasks[index].time.toString().substring(10,15),
              isChecked: Provider.of<TaskData>(context).tasks[index].isDone,

              toggleCheckValue: (newValue) {
                Provider.of<TaskData>(context,listen: false).updateTask(Provider.of<TaskData>(context, listen: false).tasks[index]);
              },
            ),
            onDismissed: (DismissDirection direction){
              setState(() {
                Provider.of<TaskData>(context,listen: false).deleteTask(Provider.of<TaskData>(context, listen: false).tasks[index]);
              });
            },
            secondaryBackground: Container(
              child: Center(
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.red,
            ),
            background: Container(),
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
          );
        },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}


