import 'package:flutter/material.dart';
import '../Compoments/ReservationDatePicker.dart';
import '../Compoments/ReservationAddSeat.dart';
import '../Compoments/ReservationPeriod.dart';
import '../Compoments/CustomRadioButton.dart';


class ReservationPage extends StatefulWidget {
  final Map<String, String> restaurant;
  Map<String, String> reservation;

  ReservationPage(this.restaurant);

  @override
  State<StatefulWidget> createState() {
    return _ResercationPageState();
  }
}

class _ResercationPageState extends State<ReservationPage> {
  DateTime selectedDate;
  DateTime selectedPeriod;
  DateTime openTime;
  DateTime closeTime;
  int seat;

  @override
  void initState() {
    selectedDate = DateTime.now();
    seat = 0;
    openTime = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, 8, 30);
    closeTime = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, 10, 30);
    super.initState();
  }

  void _pickDate(DateTime time) {
    setState(() {
      selectedDate = time;
      selectedPeriod = null;
    });

  }

  void _changeSeat(int change) {
    setState(() {
      seat += change;
    });
  }

  void _pickPeriod(DateTime period) {
    setState(() {
      selectedPeriod = period;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Reservation Details',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
          ReservationDatePicker(selectedDate, pickDate: _pickDate,),
          ReservationAddSeat(changeSeat: _changeSeat),
          Container(
            margin: EdgeInsets.only(
              left: 30,
              top: 10
            ),
            alignment: Alignment.centerLeft,
            // color: Colors.yellow,
            child: Text(
              'Choose Time',
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ),
          // ReservationPeriod(selectedDate, pickPeriod: _pickPeriod),
          Expanded(
            child: ReservationPeriod(openTime, closeTime, 30, selectedDate, pickPeriod: _pickPeriod),
          ),
          Text(selectedDate.toString()),
          Text('$seat'),
          Text('select period: $selectedPeriod')
        ],
      ),
    );
  }
}
