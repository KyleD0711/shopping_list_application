

 String formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }

  String getDayOfWeek(DateTime date) {
    // List of day names
    List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    // Get the weekday index (0 for Monday, 1 for Tuesday, ..., 6 for Sunday)
    int dayIndex = date.weekday - 1; // Adjust to match list index (0-based)

    // Return the day of the week
    return daysOfWeek[dayIndex];
  }