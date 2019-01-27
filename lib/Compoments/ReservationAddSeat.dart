import 'package:flutter/material.dart';

class ReservationAddSeat extends StatefulWidget {
  final Function changeSeat;

  ReservationAddSeat({this.changeSeat});

  @override
  State<StatefulWidget> createState() {
    return _ReservationAddSeatState();
  }
}

class _ReservationAddSeatState extends State<ReservationAddSeat> {
  Function changeSeat;
  int seat;

  @override
  void initState() {
    changeSeat = widget.changeSeat;
    seat = 0;
    super.initState();
  }

  void _addSeat() {
    setState(() {
      seat += 1;
    });
    changeSeat(1);
  }

  void _deleteSeat() {
    setState(() {
      seat -= 1;
    });
    changeSeat(-1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
      width: 270,
      height: 50,
      child: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 18,
              height: 45,
              child: Row(
                children: <Widget>[
                  Icon(Icons.people),
                  Container(
                    child: Text('$seat People'),
                    margin: EdgeInsets.only(left: 10),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 180,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 40,
                      child: FlatButton(
                        child: Text('+'),
                        onPressed: _addSeat,
                      ),
                    ),
                    Container(
                      width: 40,
                      child: FlatButton(
                        child: Text('-'),
                        onPressed: seat < 1 ? null : _deleteSeat,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
