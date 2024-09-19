class Reserver {
  Reserver({
    required this.id,
    required this.date,
  });
  late final int id;
  late final DateTime date;

  Reserver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['date'] = date;
    return _data;
  }
}
