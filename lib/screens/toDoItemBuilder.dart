import 'package:flutter/material.dart';
import 'package:untitled/screens/toDoItem.dart';

import '../assets/activities.dart';

class Activity {
  final String title;
  final String subtitle;
  bool isChecked;

  Activity({
    required this.title,
    required this.subtitle,
    this.isChecked = false,
  });
}

Widget toDoItemsListBuilder(List<Activity> activities,void Function(int) deleteActivity) {

  return ListView.builder(

    itemCount: activities.length,
    itemBuilder: (
      BuildContext context,
      int index,
    ) {
      return ToDoItem(
        title: activities[index].title,
        isChecked: activities[index].isChecked,
        subtitle: activities[index].subtitle,
        deleteCallback:(){
          deleteActivity(index);
        },
      );
    },
  );
}
