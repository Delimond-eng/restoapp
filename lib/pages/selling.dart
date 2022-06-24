import 'package:dashui/responsive/base_widget.dart';
import 'package:dashui/responsive/enum_screens.dart';
import 'package:dashui/responsive/sizing_info.dart';
import 'package:dashui/widgets/cart_item.dart';
import 'package:dashui/widgets/category_card.dart';
import 'package:dashui/widgets/custom_page.dart';
import 'package:dashui/widgets/filter_field.dart';
import 'package:dashui/widgets/sell_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ribbon/ribbon.dart';

class Selling extends StatefulWidget {
  const Selling({Key key}) : super(key: key);

  @override
  State<Selling> createState() => _SellingState();
}

class _SellingState extends State<Selling> {
  final ScrollController hScrollController = ScrollController();
  final ScrollController vScrollController = ScrollController();
  bool viewCategories = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomPage(
        title: "Vente des produits",
        headerChild: FilterField(
          color: Colors.grey[300],
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Responsive(builder: (context, responsive) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 15.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Produits",
                            style: GoogleFonts.didactGothic(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Filtrez les produits par catégorie !",
                            style: GoogleFonts.didactGothic(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Colors.grey.withOpacity(.3),
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5.0),
                            onTap: () {
                              viewCategories = !viewCategories;
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 10.0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Voir catégories",
                                    style: GoogleFonts.didactGothic(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    viewCategories
                                        ? CupertinoIcons.chevron_up
                                        : CupertinoIcons.chevron_down,
                                    color: Colors.black,
                                    size: 14.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (viewCategories) ...[
                  Scrollbar(
                    radius: const Radius.circular(5.0),
                    thickness: 2.0,
                    controller: hScrollController,
                    child: SingleChildScrollView(
                      controller: hScrollController,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                      child: Row(
                        children: [
                          for (int i = 0; i < 20; i++) ...[
                            CategoryCard(
                              isColored: true,
                              onPressed: () {},
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ],
                _sellingBox(responsive),
              ],
            );
          });
        }),
      ),
    );
  }

  Widget _sellingBox(SizingInfo responsive) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      radius: const Radius.circular(5.0),
                      thickness: 5,
                      controller: vScrollController,
                      child: GridView.builder(
                        controller: vScrollController,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(right: 10.0),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .9,
                          crossAxisCount: (responsive.deviceScreenType ==
                                  DeviceScreenType.Tablet)
                              ? 3
                              : (responsive.deviceScreenType ==
                                      DeviceScreenType.Mobile)
                                  ? 2
                                  : 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: 12,
                        itemBuilder: (context, i) {
                          return SellProductCard(
                            isActived: true,
                            onPressed: () {},
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  flex: 4,
                  child: Ribbon(
                    nearLength: 50,
                    farLength: 100,
                    title: 'Panier',
                    titleStyle: GoogleFonts.didactGothic(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    color: Colors.deepPurple.withOpacity(.7),
                    location: RibbonLocation.topStart,
                    child: Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.2),
                            blurRadius: 10.0,
                            offset: const Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  for (int i = 0; i < 3; i++) ...[
                                    const CartItem(),
                                  ]
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.black,
                                  width: .4,
                                ),
                              ),
                            ),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 5.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "X3 items",
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
                                              text: "6500.00",
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
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
