import 'package:dashui/models/produit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'round_icon_btn.dart';

class ProductCard extends StatelessWidget {
  final Function onAdded;
  final Produit data;
  const ProductCard({
    Key key,
    this.onAdded,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 10.0,
            offset: const Offset(0, 2),
          )
        ],
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.cover,
                    image: AssetImage(data.productImage),
                  ),
                  color: Colors.grey,
                  borderRadius: const BorderRadius.only(
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
                    data.productTitle,
                    style: GoogleFonts.didactGothic(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          data.productCategory,
                          style: GoogleFonts.didactGothic(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[100],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            Text(
                              "STOCK",
                              style: GoogleFonts.didactGothic(
                                color: Colors.black,
                                fontSize: 8.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Text(
                              "03",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${data.productPrice} ",
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
