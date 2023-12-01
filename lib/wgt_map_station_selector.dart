import 'package:flutter/material.dart';
import 'package:maptest/mrt_line_info/CC.dart';
// import 'package:maptest/mrt_line_info/CG.dart';
import 'package:xt_ui/xt_ui.dart';

import 'mrt_line_info/ew.dart';
import 'mrt_line_info/ns.dart';
import 'wgt_map_station.dart';
import 'wgt_smrt_logo.dart';

class WgtMapStationSelector extends StatefulWidget {
  const WgtMapStationSelector({
    Key? key,
  }) : super(key: key);

  @override
  _WgtMapStationSelectorState createState() => _WgtMapStationSelectorState();
}

class _WgtMapStationSelectorState extends State<WgtMapStationSelector> {
  final double _width = 1100;
  final double _height = 760;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        verticalSpaceRegular,
        Stack(
          children: [
            const Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WgtMrtLogo(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                horizontalSpaceMedium,
              ],
            ),
          ],
        ),
        const Divider(),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                image: const DecorationImage(
                  opacity: 0.67,
                  image: AssetImage("assets/images/mrt.all.lines.c.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ...getStations(),
          ],
        ),
      ]),
    );
  }

  List<WgtMapStation> getStations() {
    List<WgtMapStation> stations = [];
    for (var station in stationsEW) {
      stations.add(
        WgtMapStation(
          xoffset: _width * station['coord'][0],
          yoffset: _height * station['coord'][1],
          stationInfo: station,
        ),
      );
    }
    for (var station in stationsNS) {
      stations.add(
        WgtMapStation(
          xoffset: _width * station['coord'][0],
          yoffset: _height * station['coord'][1],
          stationInfo: station,
        ),
      );
    }
    for (var station in stationsCC) {
      stations.add(
        WgtMapStation(
          xoffset: _width * station['coord'][0],
          yoffset: _height * station['coord'][1],
          stationInfo: station,
        ),
      );
    }

    return stations;
  }
}
