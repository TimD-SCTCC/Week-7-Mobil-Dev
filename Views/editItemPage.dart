import 'package:flutter/material.dart';
import 'package:starter/Models/globalItems.dart';
import 'package:starter/Models/item.dart';

class EditItemPage extends StatefulWidget {
  final Item item;

  const EditItemPage({Key? key, required this.item}) : super(key: key);

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  late Item _editedItem;

  late TextEditingController itemNameController;
  late TextEditingController itemDescriptionController;

  @override
  void initState() {
    super.initState();
    _editedItem = widget.item;
    itemNameController = TextEditingController(text: _editedItem.Name);
    itemDescriptionController =
        TextEditingController(text: _editedItem.Description);
  }

  void _updateItemPressed() {
    var items = GlobalItems().items;
    Item currentItem =
        items.firstWhere((element) => element.Id == _editedItem.Id);

    if (currentItem.Name != itemNameController.text ||
        currentItem.Description != itemDescriptionController.text) {
      currentItem.Name = itemNameController.text;
      currentItem.Description = itemDescriptionController.text;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LastName Week 7'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: itemNameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: itemDescriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            ElevatedButton(
              onPressed: _updateItemPressed,
              child: Text("Update Item"),
            )
          ],
        ),
      ),
    );
  }
}
