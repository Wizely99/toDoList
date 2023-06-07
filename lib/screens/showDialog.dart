import 'package:flutter/material.dart';

void showAddItemModal(BuildContext context,Function(String,String)addTaskCallback) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Define the text editing controllers for the form fields
      final TextEditingController titleController = TextEditingController();
      final TextEditingController descriptionController =
      TextEditingController();

      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: const Text("add new to do"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "title",
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: "description",
              ),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("cancel"),
          ),
          Container(
            width: 50,
            height:30,
            child: FloatingActionButton(
              elevation: 4,
              mini: false,
              onPressed: () {

                addTaskCallback(titleController.text,descriptionController.text);
                Navigator.of(context).pop();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide.none,
              ),
              child: const Text("Add"),

            ),
          ),
        ],
      );
    },
  );
}