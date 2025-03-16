import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/core/config/service_locator.dart';
import 'package:sigue_adelante_radio/src/shared/home/services/azura_service.dart';
import 'package:sigue_adelante_radio/src/shared/models/ws_resp.dart';

class SongData extends StatelessWidget {

  final Color secondaryColor;
  const SongData({super.key, required this.secondaryColor});

  @override
  Widget build(BuildContext context) {
    final azuraService = getIt<AzuraService>();
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: azuraService.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<WsResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        WsResponse? playable = snapshot.data;
        if (playable == null) {
          return SizedBox();
        }
        return ValueListenableBuilder(
          valueListenable: azuraService.nowPlaying,
          builder: (context, value, child) {
            if (value != null) {
              playable = value;
            }
            return Row(
              children: [
                Image(
                  image: NetworkImage(playable!.live.isLive ? playable!.live.art : playable!.nowPlaying.song.art),
                  height: size.height * 0.05,
                ),
                SizedBox(width: 2,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(playable!.live.isLive ? playable!.live.streamerName : playable!.nowPlaying.song.title, style: TextStyle(fontWeight: FontWeight.bold, color: secondaryColor),),
                    playable!.live.isLive 
                    ? Chip(
                      label: Text('En vivo', style: TextStyle(color: Colors.white),),
                      backgroundColor: Colors.red,
                      shape: StadiumBorder(),
                    )
                    :Text(playable!.nowPlaying.song.artist, style: TextStyle(color: secondaryColor),),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}