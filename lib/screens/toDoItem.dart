import 'package:flutter/material.dart';

class ToDoItem extends StatefulWidget {
  final String title;
  final String subtitle;
  bool isChecked;
  final VoidCallback deleteCallback;
  ToDoItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isChecked,
    required this.deleteCallback,
  }) : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(5),
      child: CheckboxListTile(
        value: widget.isChecked,
        onChanged: (bool? value) {
          setState(() {
            widget.isChecked = value ??
                false; //update isChecked with the value if no value passed default is false
          });
        },
        contentPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(widget.title),
        subtitle: Text(widget.subtitle),
        tileColor: Colors.white,
        secondary: IconButton(
          icon: const Icon(
            Icons.delete_outline_outlined,
            size: 30,
            color: Colors.red,
          ),
          onPressed: widget.deleteCallback,
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
