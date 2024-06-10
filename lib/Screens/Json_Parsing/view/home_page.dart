class DataModel {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  DataModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory DataModel.fromJson(Map json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address:
      json['address'] != null ? Address.fromJson(json['address']) : null,
      company:
      json['company'] != null ? Company.fromJson(json['company']) : null,
      phone: json['phone'],
      username: json['username'],
      website: json['website'],
    );
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipCode;
  Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipCode,
    this.geo,
  });

  factory Address.fromJson(Map json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipCode: json['zipcode'],
      geo: json['geo'] != null ? Geo.fromJson(json['geo']) : null,
    );
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}

