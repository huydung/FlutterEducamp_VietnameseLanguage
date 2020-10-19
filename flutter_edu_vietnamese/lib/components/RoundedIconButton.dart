import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final bool selected;

  RoundedIconButton(
      {@required this.icon, @required this.onPressed, @required this.selected});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 1.0,
      fillColor: selected ? kHDIPrimaryColor : Colors.blueGrey[800],
      child: FaIcon(
        icon,
        size: kHDIStandardMargin * 1.5,
      ),
      shape: CircleBorder(),
    );
  }
}
