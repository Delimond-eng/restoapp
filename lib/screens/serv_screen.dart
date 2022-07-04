import 'package:dashui/global/controllers.dart';
import 'package:dashui/global/data.dart';
import 'package:dashui/responsive/base_widget.dart';
import 'package:dashui/responsive/enum_screens.dart';
import 'package:dashui/widgets/app_logo.dart';
import 'package:dashui/widgets/cart_item.dart';
import 'package:dashui/widgets/outline_btn.dart';
import 'package:dashui/widgets/sell_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ServScreen extends StatefulWidget {
  const ServScreen({Key key}) : super(key: key);

  @override
  State<ServScreen> createState() => _ServScreenState();
}

class _ServScreenState extends State<ServScreen> {
  final ScrollController vScrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool showFilter = false;
  @override
  Widget build(BuildContext context) {
    return Responsive(
      builder: (context, screenSize) {
        return Scaffold(
          key: _scaffoldKey,
          floatingActionButton: Obx(
            () => sellController.cartList.isNotEmpty
                ? FloatingActionButton.extended(
                    backgroundColor: Colors.orange[800],
                    elevation: 10.0,
                    icon: const Icon(
                      CupertinoIcons.cart_fill,
                      size: 15.0,
                    ),
                    label: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.didactGothic(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          children: [
                            const TextSpan(
                              text: "Commande ",
                            ),
                            TextSpan(
                              text:
                                  "(x${sellController.cartList.length} items)",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () => showCart(context),
                  )
                : Container(),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    height: 100.0,
                    width: constraints.maxWidth,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple[800],
                          Colors.deepPurple[500],
                          Colors.deepPurple[800],
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppLogo(
                          size: 20.0,
                          color: Colors.white,
                        ),
                        IconButton(
                          iconSize: 20.0,
                          icon: const Icon(
                            CupertinoIcons.refresh_circled_solid,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    margin: const EdgeInsets.only(top: 50.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("assets/bg/bg_4.jpg"),
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(5.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/svgs/food.svg",
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        "Menu du jour",
                                        style: GoogleFonts.didactGothic(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    iconSize: 20.0,
                                    icon: const Icon(
                                      Icons.filter_list_sharp,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        showFilter = !showFilter;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Veuillez séléctionner un produit dans la liste pour passer une commande !",
                                style: GoogleFonts.didactGothic(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (showFilter) ...[
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 5.0, 10.0, 15.0),
                            child: Row(
                              children: [
                                for (int i = 0; i < 10; i++) ...[
                                  Container(
                                    margin: const EdgeInsets.only(right: 5.0),
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/svgs/food.svg",
                                          height: 15.0,
                                          width: 15.0,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          "Categorie(${i + 1})",
                                          style: GoogleFonts.didactGothic(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ],
                            ),
                          ),
                        ],
                        Expanded(
                          child: Scrollbar(
                            isAlwaysShown: true,
                            radius: const Radius.circular(5.0),
                            thickness: 5,
                            controller: vScrollController,
                            child: GridView.builder(
                              controller: vScrollController,
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio:
                                    (screenSize.deviceScreenType ==
                                            DeviceScreenType.Mobile)
                                        ? .9
                                        : .8,
                                crossAxisCount: (screenSize.deviceScreenType ==
                                        DeviceScreenType.Mobile)
                                    ? 2
                                    : 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10.0,
                              ),
                              itemCount: products.length,
                              itemBuilder: (context, i) {
                                var data = products[i];
                                return SellProductCard(
                                  data: data,
                                  onPressed: () {
                                    data.isSelected = !data.isSelected;
                                    setState(() {});
                                    if (data.isSelected) {
                                      sellController
                                          .addItemToCart(data.productCode);
                                    } else {
                                      sellController
                                          .removeItemFromCart(data.productCode);
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  showCart(BuildContext ctx) {
    showDialog(
        barrierColor: Colors.black38,
        context: ctx,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.fromLTRB(5, 60, 5, 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ), //this right here
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: sellController.cartList
                            .map(
                              (data) => CartItem(
                                data: data,
                                onCleared: () async {
                                  await sellController
                                      .removeItemFromCart(data.productCode);
                                  setState(() {
                                    data.isSelected = false;
                                  });
                                  if (sellController.cartList.isEmpty) {
                                    Get.back();
                                  }
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(5.0),
                      ),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              OutlinedBtn(
                                color: Colors.green,
                                icon: CupertinoIcons.checkmark_alt_circle_fill,
                                label: "Valider",
                                onPressed: () {},
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              OutlinedBtn(
                                color: Colors.red,
                                icon: CupertinoIcons.clear_circled_solid,
                                label: "Annuler",
                                onPressed: () async {
                                  await sellController.removeAllFromCart();
                                  for (var e in products) {
                                    if (e.isSelected == true) {
                                      e.isSelected = false;
                                    }
                                  }
                                  Get.back();
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "(x${sellController.cartList.length}) items",
                                style: GoogleFonts.didactGothic(
                                  color: Colors.grey[800],
                                  fontSize: 14.0,
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
                                      text: "${sellController.cartTotal.value}",
                                      style: GoogleFonts.staatliches(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "  CDF",
                                      style: GoogleFonts.didactGothic(
                                        color: Colors.grey[800],
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
