class Task{

  String title;
  String description;
  dynamic date;
  dynamic time;
  bool isDone;


  Task({ this.title, this.description, this.isDone = false, this.time, this.date });

  void toggleDone(){
    isDone = !isDone;
  }

}