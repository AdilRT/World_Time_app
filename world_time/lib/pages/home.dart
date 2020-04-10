import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
    
    //we receive the route data inside the build function
    
    //Q.Why dont we need setState() here because we are
    // defining the data first then building the widget tree. So we dont 
    //need to update data until now.
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments; //receiving data
    print(data);

    //String bgimage= data['isDay'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/day.png'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("YOU ARE HOME"),
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result != null){
                      setState(() {
                        data = {
                          'location':result['location'],
                          'flag':result['flag'],
                          'time':result['time'],
                          'isDay':result['isDay'],
                        };
                        print(data['time']);
                      });
                    }
                  }, 
                  icon: Icon(Icons.location_city), 
                  label: Text('Choose Location')
                  ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      ),
                  ],
                ),
                SizedBox(height:8.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 20.0,
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