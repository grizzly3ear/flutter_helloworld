import 'package:flutter/material.dart';
import '../Compoments/RecommendList.dart';
import '../Compoments/SearchBar.dart';
import '../Compoments/RestaurantCard.dart';

class HomePage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _HomePageState();
    }
}
class _HomePageState extends State<HomePage> {
  List<Map<String, String>> _restaurants = [];

  @override
    void initState() {
      _restaurants = [
        {
          'name': 'KFC',
          'description': 'lorem '
        },
        {
          'name': 'Mc',
          'description': 'lorem'
        },
        {
          'name': 'KMUTT',
          'description': 'lorem'
        },
        {
          'name': 'KMITL',
          'description': 'lorem'
        },
      ];
      // print(restaurants);
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SearchBar(),
              RecommendList(),
              Container(
                child: Text(
                  'Recommendation',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                flex: 1,
                child: RestaurantCard(_restaurants),
              )
            ],
          ),
          width: 350,
        ),
      ),
    );
  }
}
