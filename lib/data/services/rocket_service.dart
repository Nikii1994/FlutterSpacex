import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:spacexrockets/Models/dart/Rockets.dart';

class RocketService{

  Future<List<Rockets>> fetchRockets() async{
    print("fetchRockets inside RocketService");
    final response = await http.get(Uri.parse("https://api.spacexdata.com/v4/rockets"));

    if(response.statusCode == 200){
      print("response rockets: ${response.body}");
      return List<Rockets>.from((json.decode(response.body) as List).map((rocket) => Rockets.fromJson((rocket)))).toList();
    } else{
      throw("Couldn't fetch movies");
    }
  }

}