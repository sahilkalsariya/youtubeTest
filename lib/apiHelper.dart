import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtubetest/model.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apihelper = APIHelper._();

  Future<Youtube?> fetchData() async {
    String api = "https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics&chart=mostPopular&regionCode=US&key=AIzaSyDqUKeFQQyf2U-4e_yBZHPR2blvAaxUMNU";
        // "https://youtube.googleapis.com/youtube/v3/search?key=AIzaSyDqUKeFQQyf2U-4e_yBZHPR2blvAaxUMNU";
        // "https://youtube.googleapis.com/youtube/v3/search?key=AIzaSyDqUKeFQQyf2U-4e_yBZHPR2blvAaxUMNU";

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map decodedata = jsonDecode(res.body);

      Youtube youtube = Youtube.fromJson(json: decodedata);

      return youtube;
    } else {
      return null;
    }
  }
}
