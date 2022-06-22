import 'package:dashui/global/controllers.dart';
import 'package:dashui/helpers/navigator.dart';
import 'package:dashui/responsive/base_widget.dart';
import 'package:dashui/responsive/enum_screens.dart';
import 'package:dashui/responsive/sizing_info.dart';
import 'package:dashui/widgets/sidebar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Responsive(
      builder: (context, responsiveInfo) {
        return Scaffold(
          drawer: responsiveInfo.deviceScreenType == DeviceScreenType.Desktop
              ? null
              : const Sidebar(),
          key: _globalKey,
          appBar: _customAppBar(responsiveInfo),
          body: LayoutBuilder(
            builder: (context, boxConstraint) {
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img_4.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                child: Row(
                  children: [
                    if (responsiveInfo.deviceScreenType ==
                        DeviceScreenType.Desktop) ...[
                      _customSidebar(),
                    ],
                    _customBody(boxConstraint)
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Expanded _customBody(BoxConstraints boxConstraint) {
    return Expanded(
      flex: 9,
      child: Container(
        width: boxConstraint.maxWidth,
        height: boxConstraint.maxHeight,
        color: Colors.grey[200].withOpacity(.5),
        padding: const EdgeInsets.all(10.0),
        child: localNavigator(),
      ),
    );
  }

  Expanded _customSidebar() {
    return const Expanded(
      flex: 2,
      child: Sidebar(),
    );
  }

  Widget _customAppBar(SizingInfo responsiveInfo) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black54, size: 18.0),
      elevation: 0,
      title: Row(
        children: [
          if (responsiveInfo.deviceScreenType == DeviceScreenType.Desktop) ...[
            const Icon(
              Icons.data_saver_off_rounded,
              color: Colors.pink,
              size: 20.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
          ],
          Text(
            'Resto',
            style: GoogleFonts.staatliches(
              color: Colors.deepPurple,
              fontWeight: FontWeight.w900,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.search, color: Colors.black),
          onPressed: () {},
        ),
        const SizedBox(
          width: 5.0,
        ),
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                blurRadius: 10.0,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Center(
            child: Icon(Icons.more_vert_outlined, color: Colors.black),
          ),
          margin: const EdgeInsets.only(right: 15.0),
        )
      ],
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Responsive(
      builder: (context, responsiveInfo) {
        return Container(
          width: responsiveInfo.deviceScreenType == DeviceScreenType.Desktop
              ? screenSize.width
              : 250,
          height: screenSize.height,
          decoration: BoxDecoration(
            color: Colors.grey[100].withOpacity(.9),
          ),
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SidebarMenuItem(
                      icon: Icons.dashboard_sharp,
                      itemName: "/",
                      label: "Tableau de bord",
                      onTap: () {
                        navigatorController.navigateTo("/");
                      },
                    ),
                    SidebarMenuItem(
                      icon: Icons.shopping_basket_sharp,
                      itemName: "/vente",
                      label: "Ventes",
                      onTap: () {
                        navigatorController.navigateTo("/vente");
                      },
                    ),
                    SidebarMenuItem(
                      icon: Icons.bathroom_rounded,
                      itemName: "/produit",
                      label: "Produits",
                      onTap: () {
                        navigatorController.navigateTo("/produit");
                      },
                    ),
                  ],
                ),
              ),
              SidebarMenuItem(
                icon: Icons.logout,
                itemName: "/loggedout",
                label: "Déconnecter",
                onTap: () {
                  navigatorController.navigateTo("/loggedout");
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
