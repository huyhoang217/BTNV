import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: MyScreen()
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  TextEditingController _inputVariable = TextEditingController();

  String _output = "";
  String _variable = "";
  final listVariable = ItemManager();

  void _addInstance (){
    setState(() {
      _variable = _inputVariable.text;
      listVariable.addItem(Item(_variable), _variable);
      _output = listVariable.show();
    });
  }
  void _removeInstance (){
    setState(() {
      _variable = _inputVariable.text;
      listVariable.removeItem(_variable);
      _output = listVariable.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Enter variable:'),
            TextField(
              controller: _inputVariable,
              decoration: InputDecoration(
                hintText: 'Enter variable',
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: ElevatedButton(
                    onPressed: _addInstance,
                    child: Text('Add instance'),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    onPressed: _removeInstance,
                    child: Text('Remove instance'),
                  ),
                ),
              ],
            ),

            Text('Show instance: $_output',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String name;
  Item(this.name);
}

class ItemManager {
  final Map<String, Item> _items = {} ;

  void addItem(Item item, String nameVariable) {
    _items[nameVariable] = item;
  }

  void removeItem(String nameVariable) {
    _items.remove(nameVariable);
  }

  String show(){
    String s="";
    for(var key in _items.keys){
      s += key + ", ";
    }
    return s;
  }
}
