import 'package:flutter/material.dart';
import 'package:starter/Models/globalItems.dart';
import 'package:starter/Views/editItemPage.dart';
import 'package:starter/Models/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'DeLong Week 7'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _handleEditButtonPress(Item item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditItemPage(item: item)),
    ).then((value) {
      setState(() {
        // Update the local item when returning from the edit page
        item =
            GlobalItems().items.firstWhere((element) => element.Id == item.Id);
      });
    });
  }

  void _handleDeleteButtonPress(Item item) {
    setState(() {
      // Remove the item from the global list
      GlobalItems().items.removeWhere((element) => element.Id == item.Id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: GlobalItems().items.length,
        itemBuilder: (context, index) {
          Item item = GlobalItems().items[index];
          return Column(
            children: <Widget>[
              ListTile(
                title: Text("Item ID#: ${item.Id}"),
                subtitle: Text(
                    "Name: ${item.Name}\nDescription: ${item.Description}"),
                onTap: () => _handleEditButtonPress(item),
                trailing: ElevatedButton(
                  onPressed: () => _handleDeleteButtonPress(item),
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
