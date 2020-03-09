import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflix/src/entity/entity.dart';

class MovieService {
  static final String _baseUrl = "movie";

  final CollectionReference _db;

  MovieService() : _db = Firestore.instance.collection(_baseUrl);

  Future<MovieEntity> save(MovieEntity entity) async {

    if(entity.id == null) entity.id = _db
      .document()
      .documentID;

    await _db.document(entity.id).setData(entity.toJson());
    return entity;

  }

  Future<List<MovieEntity>> getByTypeAll(String type) async {
    final CollectionReference _dbs = Firestore.instance.collection(_baseUrl);
    QuerySnapshot query = 
      await _dbs.where("typeMovie", isEqualTo: type).getDocuments();
    
    return query
      .documents
      .map((doc) => MovieEntity.fromSnapshotJson(doc))
      .toList();
  }

}