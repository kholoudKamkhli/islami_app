import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_project/model/RadioResponse.dart';
class RadioManager{
  static Future<RadioResponse> fetchAlbum() async{
    final response = await http.get(Uri.parse("http://api.mp3quran.net/radios/radio_arabic.json"));
    return RadioResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }
}