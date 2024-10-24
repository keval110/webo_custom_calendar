import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'datePicker/custom_date_range_picker.dart'; // Assuming you are using the Get package for `Get.context!`

void main() {
  runApp(const CustomDateApp()); // Updated class name
}

class CustomDateApp extends StatelessWidget { // Changed MyApp to CustomDateApp
  const CustomDateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomDatePicker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Webo Custom Date Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DateTime? start;
  DateTime? end;

  // The showDatePicker function
  void showDatePicker() {
    showCustomDateRangePicker(
      context,
      dismissible: true,
      minimumDate: DateTime.now().subtract(const Duration(days: 365)),
      maximumDate: DateTime.now().add(const Duration(days: 0)),
      endDate: end,
      startDate: start,
      backgroundColor: Colors.grey[200]!, // Replace with AppColors.primaryShade1
      primaryColor: Colors.deepPurple,    // Replace with AppColors.primaryShade9
      onApplyClick: (startDate, endDate) {
        setState(() {
          start = startDate;
          end = endDate;
        });
      },
      onCancelClick: () {},
    );
  }

  // Format date using DateFormat from intl package
  String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('yyyy-MM-dd').format(date); // Format the date
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: showDatePicker, // Button to show date picker
              child: const Text('Pick Date Range'),
            ),
            if (start != null && end != null) ...[
              const SizedBox(height: 10),
              const Text(
                "Selected Date:",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text("Start Date: ${formatDate(start)}"), // Formatted start date
              Text("End Date: ${formatDate(end)}"),     // Formatted end date
            ],
          ],
        ),
      ),
    );
  }
}
