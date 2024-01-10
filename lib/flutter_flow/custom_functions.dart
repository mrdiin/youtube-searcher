String? returnFormatedTime(int? seconds) {
  // write a function that returns time in the format hh:mm:ss when given the argument of seconds.
  if (seconds == null) return null;
  final hours = (seconds / 3600).floor();
  final minutes = ((seconds / 60) % 60).floor();
  final remainingSeconds = (seconds % 60).floor();
  final formattedHours = hours.toString().padLeft(2, '0');
  final formattedMinutes = minutes.toString().padLeft(2, '0');
  final formattedSeconds = remainingSeconds.toString().padLeft(2, '0');

  if (hours != 00) {
    return '$formattedHours:$formattedMinutes:$formattedSeconds';
  } else {
    return '$formattedMinutes:$formattedSeconds';
  }
}

String? returnFormatedViewCount(String? viewCount) {
  // return a more appropriate view count like youtube for big numbers
  if (viewCount == null) return null;

  final count = int.tryParse(viewCount);
  if (count == null) return viewCount;

  if (count < 1000) {
    return viewCount;
  } else if (count < 1000000) {
    final thousands = (count / 1000).toStringAsFixed(1);
    return '$thousands' + 'k';
  } else {
    final millions = (count / 1000000).toStringAsFixed(1);
    return '$millions' + 'm';
  }
}

List<String>? returnReversedList(List<String>? listOfStuff) {
  // return a list reversed
  if (listOfStuff == null) return null;
  return listOfStuff.reversed.toList();
}
