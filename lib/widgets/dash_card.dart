import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashCard extends StatelessWidget {
  final IconData icon;
  final String title, value, currency;
  const DashCard({Key key, this.icon, this.title, this.value, this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: color.shade100,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [color.shade900, color.shade700],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Icon(icon, color: color.shade50),
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.didactGothic(
                      color: Colors.grey[800],
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: value,
                          style: GoogleFonts.staatliches(
                            color: color.shade900,
                            fontWeight: FontWeight.w800,
                            fontSize: 25.0,
                          ),
                        ),
                        if (currency != null) ...[
                          TextSpan(
                            text: "  $currency",
                            style: GoogleFonts.didactGothic(
                              color: Colors.grey[800],
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ]
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
