import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leapyear/leapyear.dart';

class Date extends StatefulWidget {
  const Date({super.key});
  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  TextEditingController dateInput = TextEditingController();
  String selectedDate = "";

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DatePicker in Flutter"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: dateInput,
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: "Enter Date",
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                  setState(() {
                    dateInput.text = formattedDate;
                    selectedDate = formattedDate;
                  });
                }
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            selectedDate.isEmpty
                ? "No date selected"
                : "Selected Date: $selectedDate",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: selectedDate.isEmpty
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LeapYearPage(date: selectedDate),
                      ),
                    );
                  },
            child: Text("Check Leap Year"),
          ),
        ],
      ),
    );
  }
}
