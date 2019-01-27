import 'package:flutter/material.dart';

class RestaurantFooter extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      return TabBar(
        indicatorColor: Theme.of(context).primaryColor,
        labelColor: Theme.of(context).primaryColor,
        tabs: <Widget>[
          Tab(
            text: 'Detail',
            icon: Icon(Icons.restaurant),
          ),
          Tab(
            text: 'Reserve',
            icon: Icon(Icons.event_available),
          )
        ],
      );
    }
}