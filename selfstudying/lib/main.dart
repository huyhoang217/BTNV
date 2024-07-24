import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  TextEditingController _inputNumber = TextEditingController();
  TextEditingController _inputTarget = TextEditingController();
  String _output = "";
  List<int> _listResult = [];
  void _handleButtonPress() {

    setState(() {
      _listResult = sumTarget(_inputNumber.text.split(','), _inputTarget.text);
      _output = _listResult.join(" ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Bài 5'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Input of Problem:'),
            TextField(
              controller: _inputNumber,
              decoration: InputDecoration(
                hintText: 'Enter list here',
              ),
            ),
            TextField(
              controller: _inputTarget,
              decoration: InputDecoration(
                hintText: 'Enter target here',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleButtonPress,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text('Output: $_output'),
          ],
        ),
      ),
    );
  }
}

List<int> sumTarget (List<String> list, String text){
  List<int> arr = convertToNum(list);
  int target = int.parse(text);
  if(arr.isEmpty){
    return [];
  }

  Map <int, int> numToIndex = {};
  var firstIndex = arr.length;
  var secondIndex = 0;
  for(int i = 0; i < arr.length; i++){
    var valueNeedFind = target - arr[i];

    if(numToIndex.containsKey(arr[i])){
      //return [numToIndex[arr[i]]!, i];
      if(firstIndex > numToIndex[arr[i]]!){
        firstIndex = numToIndex[arr[i]]!;
        secondIndex = i;
      }
    }else{
      if(!numToIndex.containsKey(valueNeedFind))
        numToIndex[valueNeedFind] = i;
    }
  }
  return  firstIndex < secondIndex?[firstIndex, secondIndex]:[];
}

List<int> convertStrToNum(List<String> arr){
  List<int> arrReturn = [];
  if(arr.isEmpty){
    return [];
  }
  for(var item in arr){
    arrReturn.add(int.parse(item));
  }
  return arrReturn;
}