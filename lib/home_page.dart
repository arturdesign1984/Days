import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import './my_model.dart';
import './greed_color_box.dart';

class HomePage extends StatelessWidget {
  final List<String> dayOfTheWeek = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье'
  ];
  final List<String> ruMonthsGenitive = [
    'Января',
    'Февраля',
    'Марта',
    'Апреля',
    'Мая',
    'Июня',
    'Июля',
    'Августа',
    'Сентября',
    'Октября',
    'Ноября',
    'Декабря'
  ];
  final List<String> ruMonths = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Красный календарь')),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.blueAccent[100],
        ),
        // padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 5.0,
                        color: Colors.cyan[100],
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '${DateTime.now().day.toString()} '
                            '${ruMonthsGenitive[DateTime.now().month - 1]} '
                            '${DateTime.now().year.toString()}',
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5.0,
                        color: Colors.cyan[100],
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            dayOfTheWeek[DateTime.now().weekday - 1],
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 5.0,
                      color: Colors.cyan[100],
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.read<MyModel>().month--;
                                },
                                icon: const Icon(Icons.chevron_left)),
                            Text(
                              ruMonths[context.watch<MyModel>().month - 1],
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            IconButton(
                                onPressed: () {
                                  context.read<MyModel>().month++;
                                },
                                icon: const Icon(Icons.chevron_right)),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 370,
                  width: double.infinity,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: GreedColorBox(
                      selectedDate: DateTime(
                          DateTime.now().year, context.watch<MyModel>().month),
                    ),
                  ),
                ),
              ]),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                width: double.infinity,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage('assets/images/cow.png'),
                    ),
                    Transform.scale(
                      scaleX: -1,
                      child: Image(
                        image: AssetImage('assets/images/cow.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
