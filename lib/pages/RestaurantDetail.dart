import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatelessWidget {
  final Map<String, String> restaurant;

  RestaurantDetailPage(this.restaurant);

  @override
    Widget build(BuildContext context) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                height: 250,
                width: 250,
                child: Text('IMG_ALT'),
                decoration: BoxDecoration(border: Border.all()),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15,
                left: 15
              ),
              child: Text(
                restaurant['name'],
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              decoration:
                  BoxDecoration(color: Color.fromRGBO(100, 100, 100, 0.5)),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15,
                left: 15
              ),
              child: Text(
                restaurant['description']
              ),
            )
          ],
        ),
      );
    }
}