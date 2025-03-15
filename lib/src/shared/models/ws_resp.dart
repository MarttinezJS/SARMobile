class WsResponse {
    Live live;
    Playable nowPlaying;

    WsResponse({
        required this.live,
        required this.nowPlaying,
    });

    factory WsResponse.fromJson(Map<String, dynamic> json) => WsResponse(
        live: Live.fromJson(json["live"]),
        nowPlaying: Playable.fromJson(json["now_playing"]),
    );
}

class Live {
    bool isLive;
    String streamerName;
    dynamic broadcastStart;
    dynamic art;

    Live({
        required this.isLive,
        required this.streamerName,
        required this.broadcastStart,
        required this.art,
    });

    factory Live.fromJson(Map<String, dynamic> json) => Live(
        isLive: json["is_live"],
        streamerName: json["streamer_name"],
        broadcastStart: json["broadcast_start"],
        art: json["art"],
    );
}

class Playable {
    int shId;
    int duration;
    Song song;
    int? elapsed;
    int? remaining;

    Playable({
        required this.shId,
        required this.duration,
        required this.song,
        this.elapsed,
        this.remaining,
    });

    factory Playable.fromJson(Map<String, dynamic> json) => Playable(
        shId: json["sh_id"],
        duration: json["duration"],
        song: Song.fromJson(json["song"]),
        elapsed: json["elapsed"],
        remaining: json["remaining"],
    );
}

class Song {
    String art;
    List<dynamic> customFields;
    String text;
    String artist;
    String title;
    String album;
    String genre;
    String lyrics;

    Song({
        required this.art,
        required this.customFields,
        required this.text,
        required this.artist,
        required this.title,
        required this.album,
        required this.genre,
        required this.lyrics,
    });

    factory Song.fromJson(Map<String, dynamic> json) => Song(
        art: json["art"],
        customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
        text: json["text"],
        artist: json["artist"],
        title: json["title"],
        album: json["album"],
        genre: json["genre"],
        lyrics: json["lyrics"],
    );
}