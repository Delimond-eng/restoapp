import 'package:dashui/responsive/base_widget.dart';
import 'package:dashui/responsive/enum_screens.dart';
import 'package:dashui/responsive/sizing_info.dart';
import 'package:dashui/widgets/category_card.dart';
import 'package:dashui/widgets/custom_page.dart';
import 'package:dashui/widgets/filter_field.dart';
import 'package:dashui/widgets/sell_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Selling extends StatefulWidget {
  const Selling({Key key}) : super(key: key);

  @override
  State<Selling> createState() => _SellingState();
}

class _SellingState extends State<Selling> {
  final ScrollController hScrollController = ScrollController();
  final ScrollController vScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomPage(
        title: "Vente des produits",
        headerChild: Container(),
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
                            "Catégories",
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
                    ],
                  ),
                ),
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
                            "Vendre les produits disponible !",
                            style: GoogleFonts.didactGothic(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Recherche de produits !",
                            style: GoogleFonts.didactGothic(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          FilterField(
                            color: Colors.grey[300],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
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
                  child: Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5.0),
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
