import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPage extends StatelessWidget {
  final Widget child;
  final String title;
  final bool withBtn;
  final Function onSyncCallback;
  const CustomPage({
    Key key,
    this.child,
    this.title,
    this.withBtn = false,
    this.onSyncCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.dashboard,
                    color: Colors.deepPurple,
                    size: 15.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.didactGothic(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              if (withBtn) ...[
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  color: Colors.deepPurple,
                  onPressed: () {},
                  padding: const EdgeInsets.all(18.0),
                  child: const Text(
                    "Synchroniser les données",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                )
              ]
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.deepPurple,
          height: 0.5,
          margin: const EdgeInsets.only(top: 10.0),
        ),
        Expanded(
          child: child,
        )
      ],
    );
  }
}
