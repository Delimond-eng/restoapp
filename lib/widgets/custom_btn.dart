import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBtn extends StatelessWidget {
  final MaterialColor color;
  final Function onPressed;
  final String label;
  final IconData icon;
  const CustomBtn({Key key, this.color, this.onPressed, this.label, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      child: RaisedButton(
        color: color.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        splashColor: color.shade200,
        elevation: 10.0,
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[Icon(icon, size: 15.0, color: Colors.white)],
            const SizedBox(
              width: 5.0,
            ),
            Text(
              label.toUpperCase(),
              style: GoogleFonts.didactGothic(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
