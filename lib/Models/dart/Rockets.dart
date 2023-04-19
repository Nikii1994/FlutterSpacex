import 'dart:typed_data';

import 'package:spacexrockets/Models/dart/Diameter.dart';
import 'package:spacexrockets/Models/dart/Engines.dart';
import 'package:spacexrockets/Models/dart/FirstStage.dart';
import 'package:spacexrockets/Models/dart/Height.dart';
import 'package:spacexrockets/Models/dart/LandingLegs.dart';
import 'package:spacexrockets/Models/dart/Mass.dart';
import 'package:spacexrockets/Models/dart/PayloadWeights.dart';
import 'package:spacexrockets/Models/dart/SecondStage.dart';
import 'package:spacexrockets/local_storage/db_helper.dart';

class Rockets {

  Height? height;
  Diameter? diameter;
  Mass? mass;
  FirstStage? firstStage;
  SecondStage? secondStage;
  Engines? engines;
  LandingLegs? landingLegs;
  List<PayloadWeights>? payloadWeights;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  int? stages;
  int? boosters;
  int? costPerLaunch;
  int? successRatePct;
  String? firstFlight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;

  Rockets(
      {this.height,
        this.diameter,
        this.mass,
        this.firstStage,
        this.secondStage,
        this.engines,
        this.landingLegs,
        this.payloadWeights,
        this.flickrImages,
        this.name,
        this.type,
        this.active,
        this.stages,
        this.boosters,
        this.costPerLaunch,
        this.successRatePct,
        this.firstFlight,
        this.country,
        this.company,
        this.wikipedia,
        this.description,
        this.id});

  Rockets.fromJson(Map<String, dynamic> json) {
    height =
    json['height'] != null ?   Height.fromJson(json['height']) : null;


    diameter = json['diameter'] != null
        ?  Diameter.fromJson(json['diameter'])
        : null;
    mass = json['mass'] != null ?  Mass.fromJson(json['mass']) : null;
    // firstStage = json['first_stage'] != null
    //     ? new FirstStage.fromJson(json['first_stage'])
    //     : null;
    // secondStage = json['second_stage'] != null
    //     ? new SecondStage.fromJson(json['second_stage'])
    //     : null;
    engines =
    json['engines'] != null ?  Engines.fromJson(json['engines']) : null;
    // landingLegs = json['landing_legs'] != null
    //     ? new LandingLegs.fromJson(json['landing_legs'])
    //     : null;
    // if (json['payload_weights'] != null) {
    //   payloadWeights = <PayloadWeights>[];
    //   json['payload_weights'].forEach((v) {
    //     payloadWeights!.add(new PayloadWeights.fromJson(v));
    //   });
    // }
     flickrImages = json['flickr_images'].cast<String>();


    name = json['name'];
    type = json['type'];
    active = json['active'];
    stages = json['stages'];
    boosters = json['boosters'];
    costPerLaunch = json['cost_per_launch'];
    successRatePct = json['success_rate_pct'];
    firstFlight = json['first_flight'];
    country = json['country'];
    company = json['company'];
    wikipedia = json['wikipedia'];
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.height != null) {
      data['height'] = height!.toJson();
    }
    if (this.diameter != null) {
      data['diameter'] = diameter!.toJson();
    }
    if (this.mass != null) {
      data['mass'] = this.mass!.toJson();
    }
    if (this.firstStage != null) {
      data['first_stage'] = this.firstStage!.toJson();
    }
    if (this.secondStage != null) {
      data['second_stage'] = this.secondStage!.toJson();
    }
    if (this.engines != null) {
      data['engines'] = this.engines!.toJson();
    }
    if (this.landingLegs != null) {
      data['landing_legs'] = this.landingLegs!.toJson();
    }
    if (this.payloadWeights != null) {
      data['payload_weights'] =
          this.payloadWeights!.map((v) => v.toJson()).toList();
    }
    data['flickr_images'] = this.flickrImages;



    data['name'] = this.name;
    data['type'] = this.type;
    data['active'] = this.active;
    data['stages'] = this.stages;
    data['boosters'] = this.boosters;
    data['cost_per_launch'] = this.costPerLaunch;
    data['success_rate_pct'] = this.successRatePct;
    data['first_flight'] = this.firstFlight;
    data['country'] = this.country;
    data['company'] = this.company;
    data['wikipedia'] = this.wikipedia;
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }


  Map<String, dynamic> toMap(){
    return {
      DbHelper.COLUMN_SPACEID:id,
      DbHelper.COLUMN_HEIGHT:height?.feet,
      DbHelper.COLUMN_DIAMETER:diameter?.feet,
      DbHelper.COLUMN_NAME:name,
      DbHelper.COLUMN_IMAGE:flickrImages,
      DbHelper.COLUMN_ACTIVESTATUS:active,
      DbHelper.COLUMN_COUNTRY:country,
      DbHelper.COLUMN_COMPANY:company,
      DbHelper.COLUMN_LINK:wikipedia,
      DbHelper.COLUMN_COST:costPerLaunch,
      DbHelper.COLUMN_SUCCESSRATE:successRatePct,
      DbHelper.COLUMN_DESCRIPTION:description,
      DbHelper.COLUMN_ENGINE_COUNT:engines?.number



    };
  }
}