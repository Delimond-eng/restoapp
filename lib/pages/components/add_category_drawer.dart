import 'package:dashui/widgets/custom_btn.dart';
import 'package:dashui/widgets/custom_image_picker.dart';
import 'package:dashui/widgets/round_icon_btn.dart';
import 'package:dashui/widgets/simple_field_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCategoryDrawer extends StatelessWidget {
  const AddCategoryDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(right: 15.0),
      height: 300,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple[900],
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nouvelle catégorie",
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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const CustomImagePicker(
                    hintText: "Charger l'icon(.svg) de la catégorie !",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const SimpleField(
                    hintText: "Saisir la désignation... ",
                    icon: CupertinoIcons.collections_solid,
                    title: "Catégorie désignation",
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
