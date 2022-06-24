import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPage extends StatelessWidget {
  final Widget child;
  final String title;
  final Widget headerChild;
  const CustomPage({
    Key key,
    this.child,
    this.title,
    this.headerChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.pages,
                    color: Colors.deepPurple,
                    size: 15.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.didactGothic(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              if (headerChild != null) ...[headerChild]
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.deepPurple,
          height: 0.5,
          margin: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
        ),
        Expanded(
          child: child,
        )
      ],
    );
  }
}
