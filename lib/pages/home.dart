import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg' ;
    Color bgColor = data['isDaytime'] ? Colors.blue.shade400 : Colors.grey.shade800 ;

    return Scaffold( 
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed:() async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState((){
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.amber[800],
                    ),
                  label:Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.amber[700],
                    ),
                    ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        color: data['isDaytime'] ? Colors.black : Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 55.0,
                    color: data['isDaytime'] ? Colors.grey[900] : Colors.grey[200],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}