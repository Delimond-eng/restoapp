import 'package:dashui/global/data.dart';
import 'package:dashui/responsive/base_widget.dart';
import 'package:dashui/responsive/enum_screens.dart';
import 'package:dashui/widgets/category_card.dart';
import 'package:dashui/widgets/custom_page.dart';
import 'package:dashui/widgets/filter_field.dart';
import 'package:dashui/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/add_category_drawer.dart';
import 'components/product_drawer.dart';
import 'components/update_product_drawer.dart';

class Product extends StatefulWidget {
  const Product({Key key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final ScrollController hScrollController = ScrollController();
  final ScrollController vScrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Widget _customDrawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.black12,
      endDrawer: _customDrawer,
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      body: CustomPage(
        title: "Produits",
        headerChild: const FilterField(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Responsive(
              builder: (context, responsive) {
                return Scrollbar(
                  isAlwaysShown: true,
                  radius: const Radius.circular(5.0),
                  thickness: 10,
                  controller: vScrollController,
                  child: SingleChildScrollView(
                    controller: vScrollController,
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Column(
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
                                    "Cat??gories",
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
                                    "Veuillez s??l??ctionner une cat??gorie pour trouver des produits y aff??rent !",
                                    style: GoogleFonts.didactGothic(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              // ignore: deprecated_member_use
                              FlatButton.icon(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                onPressed: () {
                                  _customDrawer = const AddCategoryDrawer();
                                  setState(() {});
                                  Future.delayed(
                                      const Duration(milliseconds: 100));
                                  _scaffoldKey.currentState.openEndDrawer();
                                },
                                padding: const EdgeInsets.all(18.0),
                                icon: const Icon(
                                  CupertinoIcons.add,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Nouvelle cat??gorie",
                                  style: GoogleFonts.didactGothic(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
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
                            child: Row(
                              children: [
                                for (int i = 0; i < 20; i++) ...[
                                  CategoryCard(
                                    onPressed: () {
                                      _customDrawer = const ProductDrawer();
                                      setState(() {});
                                      Future.delayed(
                                          const Duration(milliseconds: 100));
                                      _scaffoldKey.currentState.openEndDrawer();
                                    },
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
                          child: Column(
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
                                "Les produits d??j?? enregistrer!",
                                style: GoogleFonts.didactGothic(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .8,
                            crossAxisCount: (responsive.deviceScreenType ==
                                    DeviceScreenType.Tablet)
                                ? 4
                                : (responsive.deviceScreenType ==
                                        DeviceScreenType.Mobile)
                                    ? 2
                                    : 7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10.0,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, i) {
                            var data = products[i];
                            return ProductCard(
                              data: data,
                              onAdded: () {
                                _customDrawer = UpdateProductDrawer(
                                  data: data,
                                );
                                setState(() {});
                                Future.delayed(
                                    const Duration(milliseconds: 100));
                                _scaffoldKey.currentState.openEndDrawer();
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
