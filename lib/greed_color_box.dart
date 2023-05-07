import 'package:flutter/material.dart';
import './colored_day_box.dart';

class GreedColorBox extends StatefulWidget {
  final DateTime _selectedDate;
  const GreedColorBox({Key? key, required DateTime selectedDate})
      : _selectedDate = selectedDate,
        super(key: key);
  @override
  State<GreedColorBox> createState() => _GreedColorBoxState();
}

class _GreedColorBoxState extends State<GreedColorBox> {
  final Map<int, String> dayOfTheWeekShort = {
    1: 'пн',
    2: 'вт',
    3: 'ср',
    4: 'чт',
    5: 'пт',
    6: 'сб',
    7: 'вс'
  };
  final Map<int, int> monthsDays = {
    1: 31,
    2: 28,
    3: 31,
    4: 30,
    5: 31,
    6: 30,
    7: 31,
    8: 31,
    9: 30,
    10: 31,
    11: 30,
    12: 31
  };
  List<List<ColoredDayBox>> coloredBoxes = [[], [], [], [], [], [], []];
  void createColoredBoxes() {
    coloredBoxes = [[], [], [], [], [], [], []];
    int month = widget._selectedDate.month;
    for (var i = 0; i < monthsDays[month]!; i++) {
      coloredBoxes[i % 7].add(ColoredDayBox(
          text: dayOfTheWeekShort[DateTime(2023, month, i + 1).weekday]!,
          day: i + 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      createColoredBoxes();
    });
    return Row(children: [
      Flexible(
          fit: FlexFit.tight,
          child: Column(children: <Widget>[...coloredBoxes[0]])),
      Flexible(
          fit: FlexFit.tight,
          child: Column(children: <Widget>[...coloredBoxes[1]])),
      Flexible(
          fit: FlexFit.tight,
          child: Column(children: <Widget>[...coloredBoxes[2]])),
      Flexible(
          fit: FlexFit.tight,
          child: Column(children: <Widget>[...coloredBoxes[3]])),
      Flexible(
          fit: FlexFit.tight,
          child: Column(children: <Widget>[...coloredBoxes[4]])),
      Flexible(
          fit: FlexFit.tight,
          child: Column(children: <Widget>[...coloredBoxes[5]])),
      Flexible(
          fit: FlexFit.tight,
          child: Column(children: <Widget>[...coloredBoxes[6]])),
    ]);
  }
}
