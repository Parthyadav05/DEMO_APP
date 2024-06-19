import 'dart:convert';

class Model {
  EventLocation? eventLocation;
  String? id;
  String? userId;
  String? description;
  String? title;
  List<String>? image;
  List<String>? tags;
  List<dynamic>? likedUsers;
  String? eventCategory;
  DateTime? eventStartAt;
  DateTime? eventEndAt;
  String? eventId;
  bool? registrationRequired; // Change to bool?
  List<dynamic>? registration;
  String? eventDescription;
  int? likes;
  List<dynamic>? comments;
  DateTime? createdAt;
  int? v;

  Model({
    this.eventLocation,
    this.id,
    this.userId,
    this.description,
    this.title,
    this.image,
    this.tags,
    this.likedUsers,
    this.eventCategory,
    this.eventStartAt,
    this.eventEndAt,
    this.eventId,
    this.registrationRequired,
    this.registration,
    this.eventDescription,
    this.likes,
    this.comments,
    this.createdAt,
    this.v,
  });



  Map<String, dynamic> toJson() => {
    "eventLocation": eventLocation == null
        ? null
        : jsonEncode(eventLocation!.toJson()),
    "_id": id,
    "userId": userId,
    "description": description,
    "title": title,
    "image": image == null ? null : jsonEncode(image),
    "tags": tags == null ? null : jsonEncode(tags),
    "likedUsers": likedUsers == null ? null : jsonEncode(likedUsers),
    "eventCategory": eventCategory,
    "eventStartAt": eventStartAt?.toIso8601String(),
    "eventEndAt": eventEndAt?.toIso8601String(),
    "eventId": eventId,
    "registrationRequired": registrationRequired == true ? 1 : 0,
    "registration": registration == null ? null : jsonEncode(registration),
    "eventDescription": eventDescription,
    "likes": likes,
    "comments": comments == null ? null : jsonEncode(comments),
    "createdAt": createdAt?.toIso8601String(),
    "__v": v,
  };
  factory Model.fromJson(Map<String, dynamic> json) => Model(
    eventLocation: json["eventLocation"] == null
        ? null
        : EventLocation.fromJson(json["eventLocation"]),
    id: json["_id"],
    userId: json["userId"],
    description: json["description"],
    title: json["title"],
    image: json["image"] == null
        ? null
        : List<String>.from(json["image"].map((x) => x as String)),
    tags: json["tags"] == null
        ? null
        : List<String>.from(json["tags"].map((x) => x as String)),
    likedUsers: json["likedUsers"] == null
        ? null
        : List<dynamic>.from(json["likedUsers"].map((x) => x)),
    eventCategory: json["eventCategory"],
    eventStartAt: json["eventStartAt"] == null
        ? null
        : DateTime.parse(json["eventStartAt"]),
    eventEndAt: json["eventEndAt"] == null
        ? null
        : DateTime.parse(json["eventEndAt"]),
    eventId: json["eventId"],
    registrationRequired: json["registrationRequired"] == 1,
    registration: json["registration"] == null
        ? null
        : List<dynamic>.from(json["registration"].map((x) => x)),
    eventDescription: json["eventDescription"],
    likes: json["likes"],
    comments: json["comments"] == null
        ? null
        : List<dynamic>.from(json["comments"].map((x) => x)),
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    v: json["__v"],
  );

}


class EventLocation {
  String? type;
  List<double>? coordinates;

  EventLocation({
    this.type,
    this.coordinates,
  });

  factory EventLocation.fromJson(Map<String, dynamic> json) => EventLocation(
    type: json["type"],
    coordinates: json["coordinates"] == null
        ? null
        : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null
        ? null
        : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}
