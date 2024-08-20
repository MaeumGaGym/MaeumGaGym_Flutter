class TimerFormatFunc {
  static String formatContainerCurrentTime({required Duration currentTime}) {
    String twoDigits(int n) {
      return n < 10 ? "0$n" : "$n";
    }

    int hours = currentTime.inHours;
    int minutes = currentTime.inMinutes.remainder(60);
    int seconds = currentTime.inSeconds.remainder(60);

    String formattedDuration = "";

    if (hours != 0) {
      formattedDuration += "$hours:";
    }

    if (minutes != 0) {
      formattedDuration +=
      hours != 0 ? "${twoDigits(minutes)}:" : "$minutes:";
    } else if (hours != 0) {
      formattedDuration += "00:";
    }

    formattedDuration +=
    hours == 0 && minutes == 0 ? "$seconds" : twoDigits(seconds);

    return formattedDuration;
  }

  static String formatInitialTime({required Duration initialTime}) {
    int seconds = initialTime.inSeconds % 60;
    int minutes = (initialTime.inSeconds ~/ 60) % 60;
    int hours = initialTime.inHours;

    String formattedDuration = '';

    if (hours > 0) {
      formattedDuration += '$hours시간 ';
    }

    if (minutes > 0) {
      formattedDuration += '$minutes분 ';
    }

    if (seconds > 0 || (seconds == 0 && hours == 0 && minutes == 0)) {
      formattedDuration += '$seconds초';
    }

    return formattedDuration.trim();
  }

  static String formatCurrentTime({required Duration currentTime}) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    if (currentTime.inHours > 0) {
      return '${twoDigits(currentTime.inHours)} : ${twoDigits(currentTime.inMinutes.remainder(60))} : ${twoDigits(currentTime.inSeconds.remainder(60))}';
    } else {
      return '${twoDigits(currentTime.inMinutes.remainder(60))} : ${twoDigits(currentTime.inSeconds.remainder(60))}';
    }
  }

  static String formatFinishTime({required Duration currentTime}) {
    DateTime dateTime = DateTime.now();

    int dateTimeMill = dateTime.millisecondsSinceEpoch + currentTime.inMilliseconds;
    DateTime finishTime = DateTime.fromMillisecondsSinceEpoch(dateTimeMill);

    String hour =
    finishTime.hour > 12 ? '${finishTime.hour - 12}' : '${finishTime.hour}';
    String minute = '${finishTime.minute}'.padLeft(2, '0');

    return '${finishTime.hour >= 12 ? '오후' : '오전'} $hour:$minute';
  }
}