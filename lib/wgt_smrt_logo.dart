import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WgtMrtLogo extends StatefulWidget {
  const WgtMrtLogo({
    Key? key,
    this.width = 55,
    this.onTap,
  }) : super(key: key);
  final double width;
  final Function()? onTap;

  @override
  State<WgtMrtLogo> createState() => _WgtMrtLogoState();
}

class _WgtMrtLogoState extends State<WgtMrtLogo> {
  double _opacity = 0.82;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        if (widget.onTap == null) return;
        setState(() {
          _opacity = value ? 1 : 0.82;
        });
      },
      onTap: widget.onTap,
      child: Opacity(
        opacity: _opacity,
        child: Container(
          child: SvgPicture.asset(
            'assets/images/mrt-station-seeklogo.com.svg',
            semanticsLabel: 'mrt',
            // height: 20,
            width: widget.width,
          ),
        ),
      ),
    );
  }
}
