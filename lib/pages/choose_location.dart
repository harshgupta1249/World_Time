import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  @override
  void initState() {
    super.initState();
    print('init ran');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation:0,
      ),
      body: ElevatedButton(
        onPressed: (){
          setState((){
            counter += 1;
          });
        },
        child:Text('$counter'),
      ),
    );
  }
}