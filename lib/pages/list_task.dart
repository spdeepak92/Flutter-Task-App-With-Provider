import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/tasks.dart';

class ListTask extends StatelessWidget {
  String title = '';
  int i = 1;
  List tasks = [];
  ListTask({Key key, @required this.title});
  @override
  Widget build(BuildContext context) {
    final _taskProvider = Provider.of<Tasks>(context);
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
          '$title TASKS',
          style: TextStyle(
            fontSize: 23.0,
            letterSpacing: 5.0,
            color: Colors.blue.shade100,
            decoration: TextDecoration.overline,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _taskProvider.getTasks.map((task) {
              return (task['status'] == '$title' || this.title == 'TOTAL')
                  ? Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white,
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.indigoAccent,
                                child: Text('${i++}'),
                                foregroundColor: Colors.white,
                              ),
                              title: Text('${task['task']}'),
                              subtitle: Text('${task['date']}'),
                            ),
                          ),
                          actions: <Widget>[
                            IconSlideAction(
                              caption: 'Archive',
                              color: Colors.blue,
                              icon: Icons.archive,
                              onTap: () {},
                            ),
                            IconSlideAction(
                              caption: 'Share',
                              color: Colors.indigo,
                              icon: Icons.share,
                              onTap: () {},
                            ),
                          ],
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'More',
                              color: Colors.black45,
                              icon: Icons.more_horiz,
                              onTap: () {},
                            ),
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container();
            }).toList(),
          ),
        ),
      ),
    );
  }
}
