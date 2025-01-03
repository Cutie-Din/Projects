String formatDate(DateTime date) {
  return "${date.day}/${date.month}/${date.year}";
}

Duration getDaysDifference(DateTime start, DateTime end) {
  return end.difference(start);
}
