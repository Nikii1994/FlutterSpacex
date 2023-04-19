//has reference to data source
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:spacexrockets/Models/dart/Rockets.dart';
import 'package:spacexrockets/data/services/rocket_service.dart';
import 'package:spacexrockets/local_storage/db_helper.dart';


class RocketRepository{
  final RocketService _rocketService = RocketService();

  Future<List<Rockets>> fetchRockets() async{


    var connectivityResult = await (Connectivity().checkConnectivity());
    final dbHelper = DbHelper.instance;
    if(connectivityResult == ConnectivityResult.none){
      Fluttertoast.showToast(
          msg: "you are offline",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
      final savedRockets = await dbHelper.queryAllRows();
      return List<Rockets>.from(savedRockets!.map((savedRocket) => Rockets.fromJson(savedRocket)));


    }else{
      Fluttertoast.showToast(
          msg: "you are online",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0
      );
      print("you are online");
      final rocket = await _rocketService.fetchRockets();


      for(final rocket in rocket){

        dbHelper.insert(rocket.toMap());
      }
      return rocket;
    }
  }



}