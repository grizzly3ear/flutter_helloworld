import 'package:flutter/material.dart';

class RecommendList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        // padding: EdgeInsets.all(10),
        // shrinkWrap: true,
        children: List.generate(6, (index) {
          return _RecommendItem();
        }),
      ),
    );
  }
}

class _RecommendItem extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(100, 0, 0, 0.5)
        ),
        margin: EdgeInsets.only(
          left: 3,
          right: 3,
          top: 5
        ),
        padding: EdgeInsets.only(
          top: 5
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: Text('IMG_ALT'),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1)
              ),
            ),
            Text('name'),
            Text('description')
          ],
        ),
      );
    }
}
