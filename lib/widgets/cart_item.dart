import 'package:dashui/global/controllers.dart';
import 'package:dashui/models/produit.dart';
import 'package:dashui/responsive/base_widget.dart';
import 'package:dashui/responsive/enum_screens.dart';
import 'package:dashui/widgets/round_icon_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatefulWidget {
  final Produit data;
  final Function onCleared;
  const CartItem({
    Key key,
    this.data,
    this.onCleared,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      builder: (context, screenSize) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 80.0,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                border: Border.all(
                  color: Colors.deepPurple,
                  width: .5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.scaleDown,
                          image: AssetImage(widget.data.productImage),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.data.productTitle,
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
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.data.productCategory,
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
                                          text: "${widget.data.productPrice} ",
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
                              Row(
                                children: [
                                  RoundedIconBtn(
                                    color: widget.data.productQty <= 1
                                        ? Colors.grey
                                        : Colors.deepPurple,
                                    icon: CupertinoIcons.minus,
                                    size: 25.0,
                                    onPressed: () async {
                                      if (widget.data.productQty > 1) {
                                        widget.data.productQty--;
                                        setState(() {});
                                        await sellController.initCartTotal();
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    "${widget.data.productQty}".padLeft(2, "0"),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  RoundedIconBtn(
                                    color: Colors.deepPurple,
                                    icon: CupertinoIcons.add,
                                    size: 25.0,
                                    onPressed: () async {
                                      widget.data.productQty++;
                                      setState(() {});
                                      await sellController.initCartTotal();
                                    },
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (screenSize.deviceScreenType != DeviceScreenType.Desktop) ...[
              Positioned(
                top: 0,
                right: 5.0,
                child: IconButton(
                  iconSize: 15.0,
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.pink,
                  ),
                  onPressed: widget.onCleared,
                ),
              )
            ]
          ],
        );
      },
    );
  }
}
