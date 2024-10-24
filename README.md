## webo_custom_calendar
## Usage

```dart
...
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
```

# Function: showCustomDateRangePicker

This function displays a custom date range picker dialog box and select range date and single date available.

## Parameters

- `context` (required): The context in which to show the dialog.
- `dismissible` (required): A boolean value indicating whether the dialog can be dismissed by tapping outside of it.
- `minimumDate` (required): A `DateTime` object representing the minimum allowable date that can be selected in the date range picker.
- `maximumDate` (required): A `DateTime` object representing the maximum allowable date that can be selected in the date range picker.
- `startDate` (optional): A nullable `DateTime` object representing the initial start date of the date range selection.
- `endDate` (optional): A nullable `DateTime` object representing the initial end date of the date range selection.
- `onApplyClick` (required): A function that takes two `DateTime` parameters representing the selected start and end dates, respectively, and is called when the user taps the "Apply" button.
- `onCancelClick` (required): A function that is called when the user taps the "Cancel" button.
- `backgroundColor` (required): The background color of the dialog.
- `primaryColor` (required): The primary color of the dialog.
- `fontFamily` (optional): The font family to use for the text in the dialog.

## Usage

Inside the function, a `FocusNode` is requested to take focus away from any input field that might be in focus. A `showDialog` function is then called to show the `CustomDateRangePicker` dialog box. The `CustomDateRangePicker` widget is built with the parameters passed to `showCustomDateRangePicker`, and then passed as the `builder` parameter of the `showDialog` function.

When the user interacts with the `CustomDateRangePicker` dialog box, the `onApplyClick` and `onCancelClick` functions are called accordingly.

