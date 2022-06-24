import 'package:dashui/responsive/base_widget.dart';
import 'package:dashui/responsive/enum_screens.dart';
import 'package:dashui/widgets/category_card.dart';
import 'package:dashui/widgets/custom_btn.dart';
import 'package:dashui/widgets/custom_image_picker.dart';
import 'package:dashui/widgets/custom_page.dart';
import 'package:dashui/widgets/filter_field.dart';
import 'package:dashui/widgets/product_card.dart';
import 'package:dashui/widgets/round_icon_btn.dart';
import 'package:dashui/widgets/simple_field_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
        headerChild: FilterField(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Responsive(
              builder: (context, responsive) {
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
                                "Veuillez séléctionner une catégorie pour trouver des produits y afférent !",
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
                            onPressed: () {},
                            padding: const EdgeInsets.all(18.0),
                            icon: const Icon(
                              CupertinoIcons.add,
                              size: 16.0,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Nouvelle catégorie",
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
                        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                        child: Row(
                          children: [
                            for (int i = 0; i < 20; i++) ...[
                              CategoryCard(
                                onPressed: () {
                                  setState(() {
                                    _customDrawer = const AddProductDrawer();
                                  });
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
                            "Les produits déjà enregistrer!",
                            style: GoogleFonts.didactGothic(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
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
                            vertical: 10.0,
                          ),
                          physics: const BouncingScrollPhysics(),
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
                          itemCount: 12,
                          itemBuilder: (context, i) {
                            return ProductCard(
                              onAdded: () {
                                setState(() {
                                  _customDrawer = const EditProductDrawer();
                                });
                                _scaffoldKey.currentState.openEndDrawer();
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class AddProductDrawer extends StatelessWidget {
  const AddProductDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 550.0,
        width: 500.0,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Création du produit",
                    style: GoogleFonts.didactGothic(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                    ),
                  ),
                  RoundedIconBtn(
                    size: 30.0,
                    color: Colors.red,
                    icon: CupertinoIcons.clear,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.deepPurple[200],
                        width: .8,
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svgs/food.svg",
                        height: 30.0,
                        width: 30.0,
                        color: Colors.deepPurple[900],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vous avez sélectionné la catégorie :",
                          style: GoogleFonts.didactGothic(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Hamburger",
                          style: GoogleFonts.didactGothic(
                            color: Colors.deepPurple,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomImagePicker(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SimpleField(
                      hintText: "Entrez la designation du produit...",
                      icon: Icons.restaurant_menu,
                      title: "Désignation(obligatoire)",
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SimpleField(
                      hintText: "Entrez la quantité, par défaut (1)...",
                      icon: Icons.countertops_rounded,
                      title: "Quantité",
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SimpleField(
                      hintText: "Entrez le prix unitaire en CDF...",
                      icon: CupertinoIcons.money_dollar,
                      title: "Prix(obligatoire)",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomBtn(
                      color: Colors.green,
                      label: "Enregistrer",
                      icon: CupertinoIcons.add,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditProductDrawer extends StatelessWidget {
  const EditProductDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(right: 15.0),
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topLeft,
            children: [
              Container(
                width: double.infinity,
                height: 112,
              ),
              Container(
                height: 112.0,
                width: 150.0,
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
                top: 5.0,
                right: -5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "CheeseBurger",
                        style: GoogleFonts.didactGothic(
                          fontSize: 25.0,
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
                          fontSize: 15.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Voulez-vous mettre à jour le stock de ce produit ?",
                        style: GoogleFonts.didactGothic(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SimpleField(
                    hintText: "Saisir la quantité... ex. 10",
                    icon: CupertinoIcons.collections_solid,
                    title: "Quantité(obligatoire)",
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const SimpleField(
                    hintText: "Entrez le prix...",
                    icon: CupertinoIcons.money_dollar,
                    title: "Prix unitaire(optionnel)",
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomBtn(
                    icon: CupertinoIcons.add,
                    color: Colors.green,
                    label: "Valider",
                    onPressed: () {},
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
