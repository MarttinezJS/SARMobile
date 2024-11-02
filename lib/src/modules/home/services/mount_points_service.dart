import 'package:sigue_adelante_radio/src/core/config/http_client.dart';
import 'package:sigue_adelante_radio/src/modules/home/config/endpoints.dart';
import 'package:sigue_adelante_radio/src/modules/home/models/points.dart';

class MountPointsService {
  static Future<List<MountPoint>> getPoints() async {
    try {
    final resp = await HttpClient.client.get(Endpoints.points);
    final data = PointResponse.fromJson(resp.data);
    return data.body ?? [];
    } catch (e) {
      return [];
    }
  }
}