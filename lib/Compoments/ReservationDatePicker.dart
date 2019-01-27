import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'dart:async';

class ReservationDatePicker extends StatefulWidget {
  final Function pickDate;
  DateTime selectedDate;

  ReservationDatePicker(selectedDate, {this.pickDate});

  @override
  State<StatefulWidget> createState() {
    return _ReservationDatePickerState();
  }
}

class _ReservationDatePickerState extends State<ReservationDatePicker> {
  String _datePick = '';
  Function pickDate;
  DateTime selectedDate;

  @override
  void initState() {
    DateFormat df = DateFormat('dd MMMM');
    String format = df.format(DateTime.now());
    _datePick = format;
    pickDate = widget.pickDate;
    super.initState();
  }

  Future _selectDate() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(now.year, now.month, now.day);
    DateTime initialDate = selectedDate == null ? DateTime.now() : selectedDate;
    DateTime picked = await showDatePicker(
        context: context,
        firstDate: firstDate,
        initialDate: initialDate,
        lastDate: DateTime(2020));
    if (picked != null) {
      pickDate(picked);
      DateFormat df = DateFormat('dd MMMM');
      String format = df.format(picked);
      setState(() { 
        _datePick = '$format';
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
      width: 270,
      height: 50,
      child: FlatButton(
        highlightColor: Colors.white,
        onPressed: _selectDate,
        child: Stack(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.calendar_today),
                  Container(
                    child: Text('$_datePick'),
                    margin: EdgeInsets.only(left: 10),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 210,
              child: Icon(Icons.arrow_drop_down),
            )
          ],
        ),
      ),
    );
  }
}
