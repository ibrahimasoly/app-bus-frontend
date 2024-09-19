import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../models/Voyage.dart';

class VoyageService {
  String uri = "http://10.0.2.2:3050/Voyage";
  Future<List<Voyage>> afficherAll() async {
    String url = uri;
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> voyageMap = json.decode(response.body);
        List<Voyage> voyage = [];
        for (var element in voyageMap) {
          voyage.add(Voyage.fromJson(element));
        }
        return voyage;
      } else {
        return throw ("Error=> ${response.statusCode}");
      }
    } catch (ex) {
      return throw ("Error=>$ex");
    }
  }

  Future<List<Voyage>> listVoyage(
      String villeDepart, String villeArriver) async {
    String url = '$uri/Recherche?ville1=$villeDepart&ville2=$villeArriver';
    try {
      http.Response value = await http.get(Uri.parse(url));
      print(value.body);
      if (value.statusCode == 200) {
        List<dynamic> voyageListMap = json.decode(value.body);
        List<Voyage> voyage = [];
        for (var val in voyageListMap) {
          voyage.add(Voyage.fromJson(val));
        }
        if (voyage.isEmpty) {
          return throw (" Pas de voyage disponible pour ce jour ");
        } else {
          print(voyage);
          return voyage;
        }
      } else {
        print("Error=> ${value.statusCode}");
        return throw ("Error=> ${value.statusCode}");
      }
    } catch (ex) {
      print("Error=>$ex");
      return throw ("Error=>$ex");
    }
  }

  int nbPassager(String lieuDepart, String lieuArriver, int nbpassager) {
    return 0;
  }

  void updateNbPassagerDate(String lieuDepart, String lieuArriver,
      int nbpassager, DateTime dateDepart) async {
    String url =
        '$uri/$lieuDepart/$lieuArriver?nbpassager=$nbpassager&dateDepart=${DateFormat('yyyy-MM-dd').format(dateDepart)}}';
    try {
      http.Response response = await http.put(Uri.parse(url));
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print("Error=> ${response.statusCode}");
        throw ("Error=> ${response.statusCode}");
      }
    } catch (e) {
      print("Error=>$e");
      throw ("Error=>$e");
    }
  }

  Future<Voyage> voyageById(int id) async {
    String url = "$uri/$id";
    try {
      http.Response response = await http.get(Uri.parse(url));
      print(response.body);
      if (response.statusCode == 200) {
        dynamic voyageMap = json.decode(response.body);
        return Voyage.fromJson(voyageMap);
      } else {
        return throw ("Error=>${response.statusCode}");
      }
    } catch (e) {
      return throw ("Error=>$e");
    }
  }
}
