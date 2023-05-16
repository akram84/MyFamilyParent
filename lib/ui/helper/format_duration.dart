String formatDuration(String? date) {
  if(date == null) return '';

  final parsedDate = DateTime.tryParse(date);
  if(parsedDate == null) return '';

  final duration = DateTime.now().difference(parsedDate);

  print(duration);

  if (duration.inDays > 0) {
    return '${duration.inDays} day${duration.inDays != 1 ? 's' : ''} ago';
  } else if (duration.inHours > 0) {
    return '${duration.inHours} hour${duration.inHours != 1 ? 's' : ''} ago';
  } else if (duration.inMinutes > 0) {
    return '${duration.inMinutes} minute${duration.inMinutes != 1 ? 's' : ''} ago';
  } else {
    return 'just now';
  }
}