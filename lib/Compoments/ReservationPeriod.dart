import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show NumberFormat;

class ReservationPeriod extends StatefulWidget {
  final DateTime openTime;
  final DateTime closeTime;
  final int period;
  final DateTime selectedDate;
  final Function pickPeriod;

  ReservationPeriod(
      this.openTime, this.closeTime, this.period, this.selectedDate, {this.pickPeriod});

  @override
  createState() {
    return new ReservationPeriodState();
  }
}

class ReservationPeriodState extends State<ReservationPeriod> {
  List<PeriodModel> periodItems = new List<PeriodModel>();
  Function pickPeriod;

  @override
  void initState() {
    pickPeriod = widget.pickPeriod;
    periodItems =
        _buildPeriodItems(widget.openTime, widget.closeTime, widget.period);
    super.initState();
  }

  List<PeriodModel> _buildPeriodItems(
      DateTime start, DateTime close, int period) {
    List<PeriodModel> items = List();
    DateTime date = start;
    while (date.compareTo(close) < 0) {
      items.add(PeriodModel(false, date));
      date = date.add(Duration(minutes: period));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: periodItems.length,
      itemBuilder: (BuildContext context, int index) {
        return new InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              periodItems.forEach((element) => element.isSelected = false);
              periodItems[index].isSelected = true;
              pickPeriod(periodItems[index].date);
            });
          },
          child: new PeriodItem(periodItems[index]),
        );
      },
    );
  }
}

class PeriodItem extends StatelessWidget {
  final PeriodModel _item;
  PeriodItem(this._item);
  NumberFormat format = NumberFormat('00');

  @override
  Widget build(BuildContext context) {
    String hourFormat = format.format(_item.date.hour);
    String minuteFormat = format.format(_item.date.minute);

    return new Container(
      alignment: Alignment.topCenter,
      margin: new EdgeInsets.all(3),
      child: new Row(
        children: <Widget>[
          new Container(
            height: 90.0,
            width: 90.0,
            child: new Center(
              child: new Text('$hourFormat:$minuteFormat',
                  style: new TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected ? Colors.black26 : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: Colors.black12
              ),
              borderRadius: const BorderRadius.all(const Radius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}

class PeriodModel {
  bool isSelected;
  final DateTime date;

  PeriodModel(this.isSelected, this.date);
}
