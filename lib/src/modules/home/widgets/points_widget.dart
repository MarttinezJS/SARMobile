import 'package:flutter/material.dart';
import 'package:sigue_adelante_radio/src/modules/home/models/points.dart';
import 'package:sigue_adelante_radio/src/modules/home/services/mount_points_service.dart';

class PointsWidget extends StatefulWidget {
  const PointsWidget({super.key});

  @override
  State<PointsWidget> createState() => _PointsWidgetState();
}

class _PointsWidgetState extends State<PointsWidget> {

  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MountPointsService.getPoints(),
      builder: (_, AsyncSnapshot<List<MountPoint>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.done:
            return snapshot.hasData ? DropdownButton(
              items: snapshot.data!.map((e) => DropdownMenuItem(
                value: e,
                child: Text(e.name)
              ),).toList(),
              onChanged: (value){},
            ) : SizedBox();
          default:
          return SizedBox();
          
        }
      },
    );
  }
}