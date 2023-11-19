import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WgtMapStation extends StatefulWidget {
  const WgtMapStation({
    Key? key,
    this.width = 32,
    this.height = 18,
    this.xoffset = 0,
    this.yoffset = 0,
    required this.stationInfo,
    this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  final double xoffset;
  final double yoffset;
  final Map<String, dynamic> stationInfo;
  final void Function()? onTap;
  @override
  State<WgtMapStation> createState() => _WgtMapStationState();
}

class _WgtMapStationState extends State<WgtMapStation> {
  late double _width;
  late double _height;
  late Map<String, dynamic> _stationInfo;
  late String _code;
  late String _name;
  late Color _color;

  Color getStationColor() {
    if (_code.contains('EW')) {
      return Colors.green;
    } else if (_code.contains('NS')) {
      return Colors.red.shade300;
    } else if (_code.contains('NE')) {
      return Colors.purple;
    } else if (_code.contains('CC')) {
      return Colors.orange;
    } else if (_code.contains('DT')) {
      return Colors.blue;
    } else if (_code.contains('TE')) {
      return Colors.brown;
    } else if (_code.contains('CG')) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  @override
  void initState() {
    super.initState();
    _width = widget.width;
    _height = widget.height;
    _stationInfo = widget.stationInfo;
    _code = _stationInfo['code'];
    _name = _stationInfo['name'];
    _color = getStationColor();
  }

  @override
  Widget build(BuildContext context) {
    String lineCode = _code.substring(0, 2);
    String stationCode = _code.substring(2);
    return Transform.translate(
      offset: Offset(widget.xoffset, widget.yoffset),
      child: InkWell(
        onTap: widget.onTap ??
            () {
              showBarModalBottomSheet(
                expand: false,
                isDismissible: true,
                context: context,
                backgroundColor: Theme.of(context).colorScheme.background,
                builder: (context) => Container(
                  height: 300,
                  child: Text('${_name}'),
                ),
                enableDrag: true,
                // isScrollControlled: true,
              );
            },
        child: SizedBox(
          width: _width + 5,
          height: _height + 5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Tooltip(
                message: _name,
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        text: lineCode,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: stationCode,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
