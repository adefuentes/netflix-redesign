
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'image.entity.dart';

class MovieEntity {

  String id;
  String title;
  String categories;
  String typeMovie;
  String year;
  String description;
  String country;
  String time;
  String trailer;
  List<ImageEntity> screenShots;
  ImageEntity screenShot;
  DateTime createdIn;
  DateTime modifiedIn;

  MovieEntity({
    this.id,
    this.title = '',
    this.categories,
    this.year,
    this.description,
    this.time,
    this.country,
    this.trailer,
    this.typeMovie,
    this.screenShot,
    this.screenShots,
    this.createdIn,
    this.modifiedIn
  });

  MovieEntity.fromSnapshotJson(DocumentSnapshot snapshot)
    : this.id = snapshot.documentID,
      this.title = snapshot.data["title"],
      this.trailer = snapshot.data["trailer"],
      this.description = snapshot.data["description"],
      this.typeMovie = snapshot.data["typeMovie"],
      this.categories = snapshot.data["categories"],
      this.year = snapshot.data["year"],
      this.country = snapshot.data["country"],
      this.screenShot = ImageEntity.fromMap(snapshot['screenShot']),
      this.screenShots =
          snapshot.data["screenShots"].map<ImageEntity>((item) {
        return ImageEntity.fromMap(item);
      }).toList(),
      this.createdIn = snapshot.data['createdIn'].toDate(),
      this.modifiedIn = snapshot.data['modifiedIn'].toDate();


  static Map<String, dynamic> stringToMap(String s) {
    Map<String, dynamic> map = json.decode(s);
    return map;
  }

  toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "categories": this.categories,
      "trailer": this.trailer,
      "description": this.description,
      "year": this.year,
      "typeMovie": this.typeMovie,
      'screenShot':
          this.screenShot == null ? ImageEntity() : this.screenShot.toJson(),
      "country": this.country,
      "screenShots": this.screenShots == null
          ? List<ImageEntity>()
          : this.screenShots.map((i) => i.toJson()).toList(),
      "createdIn": this.createdIn == null ? DateTime.now() : this.createdIn,
      "modifiedIn": this.createdIn == null ? DateTime.now() : this.createdIn,
    };
  }

}