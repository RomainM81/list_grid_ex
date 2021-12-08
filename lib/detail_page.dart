import 'package:flutter/material.dart';
import 'datasource.dart';
import 'place.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Place> places = DataSource().allPlaces;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    dynamic data = ModalRoute.of(context)?.settings.arguments;

    Padding portrait() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              places[data].name,
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Image.asset('assets/${places[data].imagePath}.jpg'),
          const SizedBox(
            height: 20,
          ),
          Text(places[data].desc)
        ]),
      );
    }

    Column paysage() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              places[data].name,
              style: const TextStyle(fontSize: 35),
            ),
          ),
          Image.asset(
            'assets/${places[data].imagePath}.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(places[data].desc),
          )
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail page'),
        ),
        body: SingleChildScrollView(
            child: (orientation == Orientation.portrait)
                ? portrait()
                : paysage()));
  }
}
