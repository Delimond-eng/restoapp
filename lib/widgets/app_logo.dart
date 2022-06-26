import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final Color color;
  const AppLogo({
    Key key,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/svgs/food.svg",
          height: size ?? 40.0,
          width: size ?? 40.0,
          color: color ?? Colors.deepPurple,
        ),
        const SizedBox(
          width: 8.0,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Resto",
                style: GoogleFonts.bungeeInline(
                  color: color ?? Colors.deepPurple,
                  fontWeight: FontWeight.w900,
                  fontSize: size != null ? size - 5 : 35.0,
                ),
              ),
              TextSpan(
                text: " APP",
                style: GoogleFonts.bungeeInline(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.w900,
                  fontSize: size != null ? size - 5 : 35.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
