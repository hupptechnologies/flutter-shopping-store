class OrderTrackDto {
  String label;
  String date;
  bool parse;

  OrderTrackDto({required this.label, required this.date, this.parse = false});
}
