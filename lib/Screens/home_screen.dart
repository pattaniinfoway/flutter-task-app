import 'package:flutter/material.dart';
import 'package:plantask/Components/task_view.dart';
import 'package:plantask/Models/task_data.dart';
import 'package:plantask/constants.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 35.0,
        ),
        isExtended: true,
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 30.0,
              left: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                   backgroundImage: AssetImage('images/Taskily_icon.png'),
                  radius: 40.0,
                ),
                SizedBox(height: 10.0,),
                Text(
                  'Taskily',
                  style: GoogleFonts.lobster(
                    textStyle: kHeadingStyle,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} Tasks',
                  style: ksubHeadingTextStyle,
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: homepageContainerColor,
              ),
              child: TaskView(),
            ),
          ),
        ],
      ),
    );
  }
}
