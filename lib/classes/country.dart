import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
    Country({
        this.id,
        this.name,
        this.currency,
    });

    String id;
    String name;
    String currency;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        currency: json["currency"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currency": currency,
    };
}
