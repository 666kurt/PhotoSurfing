import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/event.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TextEditingController _controller = TextEditingController();

  // Хранилище для событий
  Map<DateTime, List<Event>> events = {};

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  List<Event> _getEvents(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add event'),
                content: TextField(
                  controller: _controller,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedDay != null) {
                        if (events[_selectedDay] != null) {
                          events[_selectedDay!]!
                              .add(Event(title: _controller.text));
                        } else {
                          events[_selectedDay!] = [
                            Event(title: _controller.text)
                          ];
                        }
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text("Save"),
                  )
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2022, 1, 1),
            lastDay: DateTime.utc(2030, 1, 1),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            eventLoader: _getEvents,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
          ),
          SizedBox(height: 16),
          // мапа с евентами - event. Куда их выводить???
          Expanded(
            child: ListView.builder(
              itemCount: _getEvents(_selectedDay ?? DateTime.now()).length,
              itemBuilder: (context, index) {
                final event = _getEvents(_selectedDay ?? DateTime.now())[index];
                return ListTile(
                  title: Text(event.title),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
