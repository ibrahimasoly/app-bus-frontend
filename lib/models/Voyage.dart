import 'package:intl/intl.dart';

import 'Bus.dart';

class Voyage {
  late int id;
  late DateTime dateDepart;
  late DateTime heurDepart;
  late DateTime heurArriver;
  late String lieuDepart;
  late String lieuArriver;
  late int nbpassager;
  late Bus bus;

  Voyage({
    required this.id,
    required this.dateDepart,
    required this.heurDepart,
    required this.heurArriver,
    required this.lieuDepart,
    required this.lieuArriver,
    required this.nbpassager,
    required this.bus,
  });

  Voyage.fromJson(Map<String, dynamic> json) {
    final dateFormat = DateFormat("yyyy-MM-dd");
    final timeFormat = DateFormat("HH:mm:ss");
    id = json['id'];
    dateDepart = dateFormat.parse(json['dateDepart']);
    heurDepart = timeFormat.parse(json['heurDepart']);
    heurArriver = timeFormat.parse(json['heurArriver']);
    lieuDepart = json['lieuDepart'];
    lieuArriver = json['lieuArriver'];
    nbpassager = json['nbpassager'];
    bus = Bus.fromJson(json['bus']);
  }
}
