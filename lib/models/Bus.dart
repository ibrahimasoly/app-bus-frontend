class Bus {
  late int id;
  late String matricule;
  late String marque;
  late int prix;
  late int capasite;

  Bus({
    required this.id,
    required this.matricule,
    required this.marque,
    required this.prix,
    required this.capasite,
  });

  Bus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matricule = json['matricule'];
    marque = json['marque'];
    prix = json['prix'];
    capasite = json['capasite'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['matricule'] = matricule;
    _data['marque'] = marque;
    _data['prix'] = prix;
    _data['capasite'] = capasite;
    return _data;
  }
}
