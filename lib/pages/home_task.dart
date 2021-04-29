import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/pages/add_task.dart';
import 'package:task_app/pages/list_task.dart';
import 'package:task_app/providers/tasks.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<Tasks>(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 60.0,
        title: Text(
          'TASKS',
          style: TextStyle(
            fontSize: 25.0,
            letterSpacing: 5.0,
            color: Colors.blue.shade100,
            decoration: TextDecoration.overline,
          ),
        ),
        actions: [
          IconButton(
            iconSize: 40.0,
            icon: Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTask()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTask(title: 'UPCOMING'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.blue.shade900,
                                      offset: const Offset(
                                        0.0,
                                        0.0,
                                      ),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '${tasksProvider.totalTasksCount(filter: 'UPCOMING').toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'UPCOMING',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontSize: 18.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTask(title: 'PROGRESS'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.blue.shade900,
                                      offset: const Offset(
                                        0.0,
                                        0.0,
                                      ),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '${tasksProvider.totalTasksCount(filter: 'PROGRESS').toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'PROGRESS',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontSize: 18.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ListTask(title: 'COMPLETED'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.blue.shade900,
                                      offset: const Offset(
                                        0.0,
                                        0.0,
                                      ),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '${tasksProvider.totalTasksCount(filter: 'COMPLETED').toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'COMPLETED',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontSize: 18.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTask(title: 'REMOVED'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.blue.shade900,
                                      offset: const Offset(
                                        0.0,
                                        0.0,
                                      ),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '${tasksProvider.totalTasksCount(filter: 'REMOVED').toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'REMOVED',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontSize: 18.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTask(title: 'TOTAL'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'TOTAL TASKS',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontSize: 25.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.blue.shade900,
                                      offset: const Offset(
                                        0.0,
                                        0.0,
                                      ),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '${tasksProvider.totalTasksCount().toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
