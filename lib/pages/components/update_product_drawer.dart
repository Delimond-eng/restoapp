import 'package:dashui/models/produit.dart';
import 'package:dashui/widgets/custom_btn.dart';
import 'package:dashui/widgets/simple_field_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateProductDrawer extends StatelessWidget {
  final Produit data;
  const UpdateProductDrawer({
    Key key,
    this.data,
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
                top: 5.0,
                right: -5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        data.productTitle,
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
                        data.productCategory,
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
