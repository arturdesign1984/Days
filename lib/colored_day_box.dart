import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './my_model.dart';

class RedDays {
  static Map<DateTime, bool> _redDays = {};

  bool isRedDay(DateTime value) => _redDays[value] ?? false;
  addRedDay(DateTime value) {
    _redDays[value] = true;
    if (_redDays.length > 1) {
      _redDays[(_redDays.entries.last.key.add(Duration(
          days: _redDays.entries.last.key
              .difference(_redDays.entries.elementAt(_redDays.length - 2).key)
              .inDays)))] = true;
    }
  }

  removeRedDay(DateTime value) => _redDays.remove(value);
}

class ColoredDayBox extends StatefulWidget {
  final String _text;
  final int _day;
  const ColoredDayBox({Key? key, required String text, required int day})
      : _text = text,
        _day = day,
        super(key: key);

  @override
  State<ColoredDayBox> createState() => _ColoredDayBoxState();
}

class _ColoredDayBoxState extends State<ColoredDayBox> {
  RedDays isDay = RedDays();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: isDay.isRedDay(DateTime(
                2023,
                Provider.of<MyModel>(context, listen: false).month,
                widget._day))
            ? Colors.red[100]
            : widget._day == DateTime.now().day &&
                    context.watch<MyModel>().month == DateTime.now().month
                ? Colors.cyan[100]
                : Colors.green[100],
        border: Border.all(
          color: widget._day == DateTime.now().day &&
                  context.watch<MyModel>().month == DateTime.now().month
              ? Colors.white
              : Colors.black,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: TextButton(
        child: Text(
          '${widget._text}\n${widget._day.toString()}',
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: isDay.isRedDay(DateTime(
                      2023,
                      Provider.of<MyModel>(context, listen: false).month,
                      widget._day))
                  ? FontWeight.w600
                  : FontWeight.normal),
        ),
        onPressed: () => setState(() {
          isDay.isRedDay(DateTime(
                  2023,
                  Provider.of<MyModel>(context, listen: false).month,
                  widget._day))
              ? {
                  isDay.removeRedDay(DateTime(
                      2023,
                      Provider.of<MyModel>(context, listen: false).month,
                      widget._day))
                }
              : {
                  isDay.addRedDay(DateTime(
                      2023,
                      Provider.of<MyModel>(context, listen: false).month,
                      widget._day))
                };
          Provider.of<MyModel>(context, listen: false).notifyListeners();
        }),
      ),
    );
  }
}
