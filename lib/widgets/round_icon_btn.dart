import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  final IconData icon;
  final MaterialColor color;
  final Function onPressed;
  final double size;
  const RoundedIconBtn(
      {Key key, this.icon, this.color, this.onPressed, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 35.0,
      width: size ?? 35.0,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: color.shade600,
        borderRadius: BorderRadius.circular(35.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(.1),
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(35.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(40.0),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 15.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
