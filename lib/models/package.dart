class GroomModel {
  List<Data>? data;

  GroomModel({this.data});

  GroomModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? contactNumber;
  String? location;
  OpeningHours? openingHours;
  String? salonName;
  List<String>? services;

  Data(
      {this.contactNumber,
      this.location,
      this.openingHours,
      this.salonName,
      this.services});

  Data.fromJson(Map<String, dynamic> json) {
    contactNumber = json['contact_number'];
    location = json['location'];
    openingHours = json['opening_hours'] != null
        ? OpeningHours.fromJson(json['opening_hours'])
        : null;
    salonName = json['salon_name'];
    services = json['services'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contact_number'] = contactNumber;
    data['location'] = location;
    if (openingHours != null) {
      data['opening_hours'] = openingHours!.toJson();
    }
    data['salon_name'] = salonName;
    data['services'] = services;
    return data;
  }
}

class OpeningHours {
  String? friday;
  String? monday;
  String? saturday;
  String? sunday;
  String? thursday;
  String? tuesday;
  String? wednesday;

  OpeningHours(
      {this.friday,
      this.monday,
      this.saturday,
      this.sunday,
      this.thursday,
      this.tuesday,
      this.wednesday});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    friday = json['Friday'];
    monday = json['Monday'];
    saturday = json['Saturday'];
    sunday = json['Sunday'];
    thursday = json['Thursday'];
    tuesday = json['Tuesday'];
    wednesday = json['Wednesday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Friday'] = friday;
    data['Monday'] = monday;
    data['Saturday'] = saturday;
    data['Sunday'] = sunday;
    data['Thursday'] = thursday;
    data['Tuesday'] = tuesday;
    data['Wednesday'] = wednesday;
    return data;
  }
}
