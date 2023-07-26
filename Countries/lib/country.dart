import 'package:http/http.dart' as http;
import 'dart:convert';

class PhoneCode{
  final String root;
  final List<String> suffix;

  PhoneCode({required this.root,required this.suffix});

  factory PhoneCode.fromJson(Map<String,dynamic> json){
    return PhoneCode(root: json['root'],suffix: json['suffix']);
  }

}

class Country{
  final String Name;
  final String officialName;
  final String capitalCity;
  final List<dynamic> latLng;
  final dynamic currency;
  final dynamic languages;
  final List<dynamic> timeZone;
  final dynamic areaOccupied;
  final dynamic topDomains;
  final dynamic population;
  final dynamic phoneCode;
  final String region;
  final String carSide;
  final String mapLink;
  final String flag;
  
  Country({required this.Name,
    required this.flag,
    required this.currency,
    required this.capitalCity,
    required this.latLng,
    required this.languages,
    required this.timeZone,
    required this.areaOccupied,
    required this.topDomains,
    required this.population,
    required this.phoneCode,
    required this.region,
    required this.carSide,
    required this.mapLink,
    required this.officialName});
  
  factory Country.fromJson(Map<String,dynamic> json){
    return Country(Name: json['name']['common'],
        officialName: json['name']['official'],
        capitalCity: json['capital'].toString(),
        latLng: json['latlng'],
        currency: json['currencies'],
        languages: json['languages'],
        timeZone: json['timezones'],
        areaOccupied: json['area'],
        topDomains: json['tld'],
        population: json['population'],
        phoneCode: json['idd'],
        region: json['region'],
        carSide: json['car']['side'],
        mapLink: json['maps']['googleMaps'],
        flag: json['flags']['png'],);
  }

}

class CountryService{
  Future<List<Country>> getCountry() async {
    final response = await http.get(Uri.parse("https://restcountries.com/v3.1/all"));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List<Country> list =[];
      data.forEach((entry){
        list.add(Country.fromJson(entry));
      });
      return list;
    }else{
      throw Exception("HTTP failed");
    }
  }

  Future<List<Country>> getCountrySearch(String keyword) async {
    final response = await http.get(Uri.parse("https://restcountries.com/v3.1/name/$keyword"));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List<Country> list =[];
      data.forEach((entry){
        list.add(Country.fromJson(entry));
      });
      return list;
    }else{
      throw Exception("HTTP failed");
    }
  }
}

String convert(List<String> list){
  String out ="";
  for(var i=0;i<list.length;i++){
    out = "$out ${list[i]}";
  }
  return out;
}
