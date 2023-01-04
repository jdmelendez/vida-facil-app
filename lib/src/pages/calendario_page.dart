import 'dart:collection';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:vida_facil/src/widgets/buttons/custom_icon_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarioPage extends StatefulWidget {
  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[Colors.red, Colors.indigo.shade300],
              ),
            ),
          ),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.blueGrey[800],
          centerTitle: true,
          title: Text(
            'Calendario',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context, false),
            // onPressed:() => exit(0),)
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(children: [
                    Expanded(
                      child: CustomIconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'calendarioPlan');
                          },
                          text: 'Modificar Planning',
                          icon: Icons.mode_edit_outline_rounded),
                    )
                  ]),

                  // CALENDARIO
                  Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(1), blurRadius: 5)
                      ],
                    ),
                    child: TableCalendar<Event>(
                      locale: 'es_ES',
                      firstDay: kFirstDay,
                      lastDay: kLastDay,
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      rangeStartDay: _rangeStart,
                      rangeEndDay: _rangeEnd,
                      calendarFormat: _calendarFormat,
                      rangeSelectionMode: _rangeSelectionMode,
                      eventLoader: _getEventsForDay,
                      startingDayOfWeek: StartingDayOfWeek.monday,

                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Mes',
                        CalendarFormat.twoWeeks: 'Quincena',
                        CalendarFormat.week: 'Semana',
                      },
                      // calendarBuilders: CalendarBuilders(
                      //   dowBuilder: (context, day) {
                      //     if (day.weekday == DateTime.sunday) {
                      //       final text = DateFormat.E().format(day);

                      //       return Center(
                      //         child: Text(
                      //           'dom.',
                      //           style: TextStyle(color: Colors.red),
                      //         ),
                      //       );
                      //     }
                      //   },
                      // ),

                      calendarStyle: CalendarStyle(
                        selectedDecoration: BoxDecoration(
                            color: Colors.blueGrey, shape: BoxShape.circle),
                        todayDecoration: BoxDecoration(
                            color: Colors.orange, shape: BoxShape.circle),
                        // Use `CalendarStyle` to customize the UI
                        outsideDaysVisible: false,
                      ),
                      headerStyle: HeaderStyle(
                        headerMargin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.amber.shade50,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      onDaySelected: _onDaySelected,
                      onRangeSelected: _onRangeSelected,
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(
                    child: ValueListenableBuilder<List<Event>>(
                      valueListenable: _selectedEvents,
                      builder: (context, value, _) {
                        return ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            Event evento = value[index];

                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                color: evento.periodo == 'Comida'
                                    ? Colors.green[200]
                                    : evento.periodo == 'Cena'
                                        ? Colors.blue[200]
                                        : evento.periodo == 'Desayuno'
                                            ? Colors.red[200]
                                            : Colors.yellow[200],
                                border: Border.all(style: BorderStyle.none),
                                // borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ListTile(
                                trailing: IconButton(
                                  splashRadius: 30.0,
                                  iconSize: 35,
                                  hoverColor: Colors.orange,
                                  focusColor: Colors.orange,
                                  color: Colors.blueGrey,
                                  icon: Icon(
                                    Icons.visibility_rounded,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'recetas');
                                  },
                                ),
                                onTap: () => print('${value[index]}'),
                                subtitle: Text('${evento.periodo}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                title: Text('${evento.title}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ]))));
  }
}

class Event {
  final String title;
  final String periodo;

  const Event(this.title, this.periodo);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) =>
        List.generate(item % 4 + 1, (index) => Event('Nombre', 'Periodo')))
  ..addAll({
    kToday: [
      Event('Macarrones a la boloñesa', 'Comida'),
      Event('Tortilla de patatas', 'Cena'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
