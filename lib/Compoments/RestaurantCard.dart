import 'package:flutter/material.dart';
import '../pages/Restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final List<Map<String, String>> restaurants;

  RestaurantCard(this.restaurants);

  Widget _buildRestaurantCard(BuildContext context, int index) {
    return RaisedButton(
      highlightColor: Color.fromRGBO(255, 255, 255, 1),
      color: Color.fromRGBO(255, 255, 255, 1),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantPage(restaurants[index])));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: Text('IMG_ALT'),
              decoration: BoxDecoration(border: Border.all()),
            ),
            Container(
              height: 100,
              margin: EdgeInsets.only(left: 10),
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        restaurants[index]['name'],
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      )),
                  Text(
                    restaurants[index]['description'],
                    overflow: TextOverflow.fade,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantList() {
    return restaurants.length > 0
        ? ListView.builder(
            itemBuilder: _buildRestaurantCard,
            itemCount: restaurants.length,
          )
        : Container(
            child: Text('No Restaurant found'),
          );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRestaurantList();
  }
}
