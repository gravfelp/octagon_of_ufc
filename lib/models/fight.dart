class Fight {
  final String eventName;
  final String fighter1;
  final String fighter2;
  final DateTime dateTime;
  final String location;
  final String? imageUrl;
  final String? description;

  Fight({
    required this.eventName,
    required this.fighter1,
    required this.fighter2,
    required this.dateTime,
    required this.location,
    this.imageUrl,
    this.description,
  });
}