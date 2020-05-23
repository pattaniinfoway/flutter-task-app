import 'package:flutter/foundation.dart';
import 'Task.dart';

class TaskData extends ChangeNotifier{

  List<Task> tasks = [];

  void addTask({String newTaskTitle, String newDescription, dynamic newDate, dynamic newTime}){
    final task = Task(title: newTaskTitle, description: newDescription, date: newDate, time: newTime);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }

}