import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleField extends StatelessWidget {
  final TextEditingController controller;
  final String title, hintText;
  final IconData icon;

  const SimpleField({
    Key key,
    this.controller,
    this.hintText,
    this.icon,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.didactGothic(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                color: Colors.black.withOpacity(.1),
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.deepPurple,
                  size: 18.0,
                ),
                Flexible(
                  child: TextField(
                    controller: controller,
                    style: GoogleFonts.didactGothic(fontSize: 15.0),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8.0),
                      hintText: hintText,
                      hintStyle: GoogleFonts.didactGothic(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      counterText: '',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
