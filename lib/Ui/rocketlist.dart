import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacexrockets/Models/dart/Rockets.dart';
import 'package:spacexrockets/Ui/RocketScreenDetails.dart';
import 'package:spacexrockets/rocket_list/rocket_list_provider.dart';
class RocketList extends StatelessWidget {
  const RocketList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SpaceX"),
        ),
        body: ChangeNotifierProvider<RocketProvider>(
          create: (context) => RocketProvider(),
          child: Consumer<RocketProvider>(
            builder: (buildContext, moviesProvider, _) {
              return ListView.builder(
                  itemCount: moviesProvider.rocketModel.length,
                  itemBuilder: (context, index) {

                    return RocketListWidget(
                      rocket: moviesProvider.rocketModel[index],
                    );
                  });
              // Center(child: CircularProgressIndicator(),);
            },
          ),
        ));
  }
}

class RocketListWidget extends StatelessWidget {
  const RocketListWidget({Key? key, required this.rocket}) : super(key: key);

  final Rockets rocket;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        child: Card(
          elevation: 6.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Hero(
                tag: "${rocket.name}",
                child:

                Container(
                  width: 120,
                  height: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(rocket.flickrImages![0]),
                      fit: BoxFit.fitWidth,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(bottom: 5.0),
                        child: Text('${rocket.name ?? "Empty"}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                          //TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ),
                      Text(
                          rocket.country as String,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: false,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        'Engine Count : ${rocket.engines?.number ?? "Empty"}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: false,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ]),
              ),
            ],
          ),
        ),
        onTap: () {
           Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RocketScreenDetail(rocket)));
        },
      ),
    );
  }
}

