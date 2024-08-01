import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeapYearPage extends StatelessWidget {
  final String date;

  const LeapYearPage({super.key, required this.date});

  bool isLeapYear(int year) {
    if (year % 4 != 0) return false;
    if (year % 100 != 0) return true;
    if (year % 400 != 0) return false;
    return true;
  }

  int weekNumber(DateTime date) {
    DateTime firstDayOfYear = DateTime(date.year, 1, 1);
    int daysDifference = date.difference(firstDayOfYear).inDays;
    return (daysDifference ~/ 7) + 1;
  }

  @override
  Widget build(BuildContext context) {
    
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(date);

    final year = parsedDate.year;
    final isLeap = isLeapYear(year);
    final weekOfYear = weekNumber(parsedDate);

    return Scaffold(
      appBar: AppBar(
        title: Text("Leap Year Check"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "The year $year is ${isLeap ? '' : 'not '}a leap year.",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "Week number: $weekOfYear",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
