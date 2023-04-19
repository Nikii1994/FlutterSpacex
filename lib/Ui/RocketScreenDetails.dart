import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacexrockets/Models/dart/Rockets.dart';


class RocketScreenDetail extends StatelessWidget {
  const RocketScreenDetail(this.rocket, {Key? key}) : super(key: key);
  final Rockets rocket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(rocket.name as String),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "${rocket.name}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                      height: 150,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: rocket.flickrImages!.map((image) {
                            return box(image);
                          }).toList(),
                        ),
                      )),
                  Center(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      color: const Color(0xffF9F9F9),
                      elevation: 6.0,
                      margin: const EdgeInsets.only(
                          right: 10.0, left: 10.0, top: 20),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              child: const Text(
                                "Description",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 10),
                            child: Row(children: [
                              const Text(
                                "Active Status",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Container(
                                  child: rocket.active == true
                                      ? const Text(
                                          "Active",
                                        )
                                      : const Text(
                                          "Inactive",
                                        ))
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Row(children: [
                              const Text(
                                "Cost Per Launch",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                "${rocket.costPerLaunch}",
                              )
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Row(children: [
                              const Text(
                                "Success Rate",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                "${rocket.successRatePct}%",
                              )
                            ]),
                          ),
                      Container(
                        margin: const EdgeInsets.only(left: 20,right: 20),
                        child: const Divider(
                          color: Colors.black,
                          height: 3,
                        ),
                      ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: RichText(
                                textAlign:TextAlign.justify,
                                text:TextSpan(
                                    style:const TextStyle(color: Colors.black),
                                    children:[
                                      TextSpan(text:"${rocket.description}"),
                                       ]))



                          ),

                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      color: const Color(0xffF9F9F9),
                      elevation: 6.0,
                      margin: const EdgeInsets.only(
                          right: 10.0, left: 10.0, top: 20),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              child: const Text(
                                "Specification",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 10),
                            child: Row(children: [
                              const Text(
                                "Height",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                "${rocket.height!.feet} feet",
                              )
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Row(children: [
                              const Text(
                                "Diameter",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                "${rocket.diameter!.feet} feet",
                              )
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Row(children: [
                              const Text(
                                "Wikipedia link",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Expanded(
                                child: Container(

                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                        "${rocket.wikipedia}",

                                    ),
                                  ),
                                ),
                              ),


                            ]),
                          ),
//Wikipedia link.



                        ],
                      ),
                    ),
                  ),


                ],
              )),
        ));
  }

  Widget box(String title) {
    return Container(
        margin: EdgeInsets.all(10),
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(title),
          ),
          shape: BoxShape.rectangle,
        ));
  }








}
