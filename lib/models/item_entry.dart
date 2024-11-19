// To parse this JSON data, do
//
//     final entry = entryFromJson(jsonString);

import 'dart:convert';

List<Entry> entryFromJson(String str) => List<Entry>.from(json.decode(str).map((x) => Entry.fromJson(x)));

String entryToJson(List<Entry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Entry {
    Model model;
    String pk;
    Fields fields;

    Entry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String itemName;
    int price;
    String description;
    int rating;
    DateTime date;

    Fields({
        required this.user,
        required this.itemName,
        required this.price,
        required this.description,
        required this.rating,
        required this.date,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        itemName: json["item_name"],
        price: json["price"],
        description: json["description"],
        rating: json["rating"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "item_name": itemName,
        "price": price,
        "description": description,
        "rating": rating,
        "date": date.toIso8601String(),
    };
}

enum Model {
    MAIN_ENTRY
}

final modelValues = EnumValues({
    "main.entry": Model.MAIN_ENTRY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
