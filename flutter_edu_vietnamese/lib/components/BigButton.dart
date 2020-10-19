import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class BigButton extends StatelessWidget {
  final Function onTap;
  final String text;

  BigButton({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 70.0,
        margin: EdgeInsets.fromLTRB(
            kHDISmallMargin, kHDISmallMargin, kHDISmallMargin, 0),
        decoration: BoxDecoration(
          color: kHDIPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kHDIStandardMargin),
            topRight: Radius.circular(kHDIStandardMargin),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
        ),
        padding: EdgeInsets.only(bottom: kHDIStandardMargin),
      ),
    );
  }
}
