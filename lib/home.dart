import 'package:flutter/material.dart';
import 'package:list_grid_ex/detail_page.dart';
import 'datasource.dart';
import 'place.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Place> places = DataSource().allPlaces;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Marseille"),
        ),
        body: (orientation == Orientation.portrait) ? separetedList() : grid());
  }

  ListTile tile(int index) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: index);
      },
      title: Text(places[index].name),
      trailing: Image.asset(
        'assets/${places[index].imagePath}.jpg',
        width: 120,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget separetedList() {
    return ListView.separated(
      itemCount: places.length,
      itemBuilder: (BuildContext context, int index) {
        return tile(index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 1,
        );
      },
    );
  }

  Widget grid() {
    return GridView.builder(
        itemCount: places.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 4),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: index);
            },
            child: Card(
              elevation: 12,
              child: Column(
                children: [
                  Image.asset(
                    'assets/${places[index].imagePath}.jpg',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.width / 5,
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  Center(
                    child: Text(
                      places[index].name,
                      style: const TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
