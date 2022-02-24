class Currency {
  final bool success;
  final int timestamp;
  final String base;
  final String date;
  final Map<String, dynamic> rates;

  Currency(
      {required this.success,
      required this.timestamp,
      required this.base,
      required this.date,
      required this.rates});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
        success: json["success"],
        timestamp: json["timestamp"],
        base: json["base"],
        date: json["date"],
        rates: json["rates"]);
  }
}
