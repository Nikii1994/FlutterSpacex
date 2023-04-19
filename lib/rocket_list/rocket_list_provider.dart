import 'package:flutter/material.dart';
import 'package:spacexrockets/Models/dart/Rockets.dart';
import 'package:spacexrockets/data/services/repository/repository.dart';


class RocketProvider extends ChangeNotifier {
  List<Rockets> rocketModel = [];
  final RocketRepository _rocketRepository = RocketRepository();

  RocketProvider() {
    getRocket();
  }

  void getRocket() {

    _rocketRepository.fetchRockets().then((value) {
      rocketModel = value!;
      notifyListeners();
    });
  }
}
