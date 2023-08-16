import 'dart:convert';
import 'package:albumapiwithbloc/model/album_model.dart';
import 'package:http/http.dart';

class AlbumRepository {
  String endpoint = 'https://jsonplaceholder.typicode.com/albums';

  Future<List<AlbumModel>> getAlbums() async {
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      return result.map((e) => AlbumModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
