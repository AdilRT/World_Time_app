
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

//get the 
class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isDay;

  WorldTime({this.location,this.flag,this.url});
  
  //future=temporary placeholder
  Future<void> getTime() async{
    
    //trying to get the API data
    try {
      Response response=await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);


      //get properties from data
    String datetime = data['utc_datetime'];
    print('datetime:$datetime');
    String offset_hour = data['utc_offset'].substring(1,3);
    String offset_minute = data['utc_offset'].substring(4,6);
    

    //adding offset to datetime
    //change to DateTime object to add it as hour or somthing else 
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours:int.parse(offset_hour),minutes: int.parse(offset_minute)));

    
    //storing in the class itself
    isDay =now.hour>6 && now.hour<19  ? true : false ;
    time = DateFormat.jm().format(now); //due to this datetime.now() problem was occuring

  } catch (e) {
    time='Excception caught:$e';

  } 
    
    
    
  }
}