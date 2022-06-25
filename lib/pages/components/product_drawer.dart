import 'package:dashui/widgets/custom_btn.dart';
import 'package:dashui/widgets/custom_image_picker.dart';
import 'package:dashui/widgets/round_icon_btn.dart';
import 'package:dashui/widgets/simple_field_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDrawer extends StatelessWidget {
  const ProductDrawer({
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
                    "Nouveau produit",
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
                    const CustomImagePicker(
                      hintText: "Charger l'image du produit !",
                    ),
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
