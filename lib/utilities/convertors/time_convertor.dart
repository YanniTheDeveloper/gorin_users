class TimeToMomentConvertor {
  static convert(DateTime time){
    if (time == null) return "unknown";

    DateTime now = DateTime.now();
    int years = now.year - time.year;
    int months = now.month - time.month;
    int days = now.day - now.day;

    if(years > 1) return "$years years ago";
    else if(years == 1) return "Last year";
    else if(months > 1) return "$months months ago";
    else if(months == 1) return "Last month";
    else if(days > 7) return "This month";
    else if(days > 1) return "This week";
    else if(days == 1) return "Yesterday";
    else if(days == 0) return "Today";

  }


}