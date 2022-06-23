import 'package:dashui/screens/home_screen.dart';
import 'package:dashui/widgets/app_logo.dart';
import 'package:dashui/widgets/auth_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({Key key}) : super(key: key);

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img_4.jpg"),
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppLogo(),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.black26,
                      ),
                      height: 200.0,
                      width: 420.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Flexible(
                            child: AuthField(
                              hintText: "Entrez le nom d'utilisateur...",
                              icon: CupertinoIcons.person,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Flexible(
                            child: AuthField(
                              hintText: "Entrez le mot de passe...",
                              icon: CupertinoIcons.lock,
                              isPassWord: true,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Flexible(
                            child: Container(
                              height: 50.0,
                              width: double.infinity,
                              child: RaisedButton(
                                color: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                splashColor: Colors.pink[200],
                                elevation: 10.0,
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  "Connecter".toUpperCase(),
                                  style: GoogleFonts.didactGothic(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
