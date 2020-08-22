import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :ModalRoute.of(context).settings.arguments;
    String bgimg = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgclr = data['isDayTime'] ? Colors.cyan[800] : Colors.blue[900];
    return Scaffold(
      backgroundColor: bgclr,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgimg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
                child: Center(
                  child: FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/choose_location');
                      setState(() {
                        data = {
                          'time':result['time'],
                          'location':result['location'],
                          'flag':result['flag'],
                          'isDayTime':result['isDayTime']
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                        'Edit Location',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),

                  ),
                ),
              ),
              SizedBox(height: 100.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
