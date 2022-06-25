import 'package:dashui/models/produit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellProductCard extends StatelessWidget {
  final Function onPressed;
  final bool isActived;
  final Produit data;
  const SellProductCard({
    Key key,
    this.onPressed,
    this.isActived = false,
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
      child: Material(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(5.0),
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
                    right: 10.0,
                    child: Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.5),
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(.1),
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(2.0),
                      child: data.isSelected
                          ? Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.deepPurple,
                                    Colors.deepPurple[200],
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.checkmark_alt,
                                  size: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container(),
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
                      Text(
                        data.productCategory,
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
        ),
      ),
    );
  }
}
