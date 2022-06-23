import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'round_icon_btn.dart';

class ProductCard extends StatelessWidget {
  final Function onAdded;
  const ProductCard({
    Key key,
    this.onAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100.0,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/food.jpg"),
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100.0),
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                ),
              ),
              Positioned(
                bottom: 5.0,
                right: 5,
                child: RoundedIconBtn(
                  icon: CupertinoIcons.add,
                  color: Colors.blue,
                  onPressed: onAdded,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CheeseBurger",
                    style: GoogleFonts.didactGothic(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    "Hamburger",
                    style: GoogleFonts.didactGothic(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "1500.00 ",
                          style: GoogleFonts.staatliches(
                            color: Colors.orange[900],
                            fontWeight: FontWeight.w800,
                            fontSize: 18.0,
                            letterSpacing: 1.50,
                          ),
                        ),
                        TextSpan(
                          text: "  CDF",
                          style: GoogleFonts.didactGothic(
                            color: Colors.grey[800],
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
