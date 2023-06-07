import 'package:flutter/material.dart';
import 'package:untitled/screens/showDialog.dart';
import 'package:untitled/screens/toDoItemBuilder.dart';

import '../assets/activities.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Activity> itemData = activities.map((activity) {
    return Activity(
        title: activity["title"],
        subtitle: activity["subtitle"],
        isChecked: activity["isChecked"]);
  }).toList();
  void addTask(String title, String subtitle) {
    setState(() {
      activities.insert(0, {
        'title': title,
        'subtitle': subtitle,
        'isChecked': false,
      });
    });
  }

  void deleteActivity(int index) {
    setState(() {
      activities.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Activity> itemData = activities.map((activity) {
      return Activity(
          title: activity["title"],
          subtitle: activity["subtitle"],
          isChecked: activity["isChecked"]);
    }).toList();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("ACTIVITIES"),
      ),
      body: Column(children: [

        Container(
          padding: const EdgeInsets.all(20),
          width: 1000,

          color: Colors.white, // Replace "blue" with the desired color
          child: const Text(
            "MY ACTIVITIES",
            style: TextStyle(color: Colors.black54, fontSize: 24),
          ),
        ),

        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Expanded(
          child: toDoItemsListBuilder(itemData, deleteActivity),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showAddItemModal(context, addTask);
        },
      ),
    );
  }
}
