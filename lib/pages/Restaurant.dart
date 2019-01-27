import 'package:flutter/material.dart';
import '../Compoments/RestaurantFooter.dart';
import './RestaurantDetail.dart';
import './Reservation.dart';

class RestaurantPage extends StatelessWidget {
  Map<String, String> restaurant;

  RestaurantPage(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(restaurant['name']),
        ),
        body: TabBarView(
          children: <Widget>[
            RestaurantDetailPage(restaurant), 
            ReservationPage(restaurant)
          ],
        ),
        bottomNavigationBar: RestaurantFooter()
      ),
    );
  }
}
