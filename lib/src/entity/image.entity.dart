import 'package:cloud_firestore/cloud_firestore.dart';

class ImageEntity {
  String url;

  ImageEntity({this.url = ''});

  ImageEntity.fromMap(Map<dynamic, dynamic> data) : url = data['url'];

  toJson() {
    return { 'Url' :  this.url };
  }

}