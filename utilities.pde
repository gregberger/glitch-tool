String getDateAsString() {
  int y = year();
  int m = month();
  int d = day();
  String date = String.valueOf(y)+String.valueOf(m)+String.valueOf(d);
  return date;
}

