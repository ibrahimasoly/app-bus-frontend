import 'Reserver.dart';

class Passager {
  Passager({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.tel,
    required this.reservers,
  });
  late final int id;
  late final String nom;
  late final String prenom;
  late final String email;
  late final String tel;
  late final List<Reserver> reservers;

  Passager.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    tel = json['tel'];
    if (json['reservers'] != null) {
      reservers = List.from(json['reservers'])
          .map((e) => Reserver.fromJson(e))
          .toList();
    } else {
      reservers = [];
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nom'] = nom;
    _data['prenom'] = prenom;
    _data['email'] = email;
    _data['tel'] = tel;
    _data['reservers'] = reservers.map((e) => e.toJson()).toList();
    return _data;
  }
}
