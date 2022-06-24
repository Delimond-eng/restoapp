import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSessionCard extends StatelessWidget {
  final Color color;
  const UserSessionCard({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 2,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: color ?? Colors.deepPurple,
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.person_solid,
                        color: color != null ? Colors.deepPurple : Colors.white,
                        size: 10.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "Gaston Delimond",
                      style: GoogleFonts.didactGothic(
                        color: color ?? Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 15.0,
              ),
              Icon(
                CupertinoIcons.chevron_down,
                color: color ?? Colors.black,
                size: 15.0,
              )
            ],
          ),
        ),
      ),
      onSelected: (value) {},
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                child: Icon(
                  Icons.logout_sharp,
                  size: 15,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                'Déconnexion',
                style: GoogleFonts.didactGothic(fontSize: 14.0),
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                child: Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.red,
                ),
              ),
              Text(
                "Fermer",
                style: GoogleFonts.didactGothic(fontSize: 14.0),
              )
            ],
          ),
        ),
      ],
    );
  }
}
