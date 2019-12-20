
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsPage extends StatefulWidget {
  @override
  _LocalNotificationspageState createState() => _LocalNotificationspageState();
}

class _LocalNotificationspageState extends State<LocalNotificationsPage> {
  List<String> _options = ['Meeting', 'Appointment', 'Birthday'];
  String _selectedOptions;

  DateTime _dateTime = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Set Notification')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: DropdownButton(
                hint: Text(
                    'Please choose an event'), // Not necessary for Option 1
                value: _selectedOptions,
                onChanged: (newValue) {
                  setState(() {
                    _selectedOptions = newValue;
                  });
                },
                items: _options.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 90.0),
              child: RaisedButton(
                child: Text('Pick a date'),
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                      firstDate: DateTime(2019),
                      lastDate: DateTime(2030)
                  ).then((date) {
                    setState(() {
                      _dateTime = date;
                    });
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 90.0),
              child: RaisedButton(
                child: Text('Pick Time'),
                onPressed: () {
                  showTimePicker(
                      context: context,
                      initialTime: _time == null ? DateTime.now() : _time,
                  ).then((time) {
                    setState(() {
                      _time = time;
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

