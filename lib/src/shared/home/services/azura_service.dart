
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sigue_adelante_radio/src/core/config/http_client.dart';
import 'package:sigue_adelante_radio/src/shared/models/ws_resp.dart';

class AzuraService {
  SongData nowPlaying = SongData();
  AzuraService();

  Future<WsResponse> getNowPlaying() async {
    final resp = await HttpClient.azura.get('nowplaying/${dotenv.env['STATION_ID']}',);
    return WsResponse.fromJson(resp.data);
  }
}

class SongData extends ValueNotifier<WsResponse?> {
  SongData(): super(null);

}