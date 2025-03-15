
import 'dart:convert';

import 'package:sigue_adelante_radio/src/core/config/service_locator.dart';
import 'package:sigue_adelante_radio/src/shared/home/services/azura_service.dart';
import 'package:sigue_adelante_radio/src/shared/models/ws_resp.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WsClient {
  static final _wsUrl = Uri.parse('wss://ws.sigueadelanteradio.com/ws');
  static final channel = WebSocketChannel.connect(_wsUrl);
  static final _nowPlaying = getIt<AzuraService>().nowPlaying;
  WsClient._();

  static Future initWs() async {
    await channel.ready;
    channel.stream.listen(( message) {
      try {
        final json = jsonDecode(message);
        final wsResp = WsResponse.fromJson(json);
        _nowPlaying.value = wsResp;        
      } catch (e) {
        print(e);
      }
    });
  }


}


