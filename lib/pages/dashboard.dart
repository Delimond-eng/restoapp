import 'package:dashui/responsive/base_widget.dart';
import 'package:dashui/responsive/enum_screens.dart';
import 'package:dashui/widgets/custom_page.dart';
import 'package:dashui/widgets/dash_card.dart';
import 'package:dashui/widgets/order_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      title: "Tableau de bord",
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Responsive(
            builder: (context, responsiveInfo) {
              return Scrollbar(
                isAlwaysShown: true,
                radius: const Radius.circular(10.0),
                thickness: 5,
                controller: scrollController,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 3.00,
                          crossAxisCount: (responsiveInfo.deviceScreenType ==
                                  DeviceScreenType.Tablet)
                              ? 2
                              : (responsiveInfo.deviceScreenType ==
                                      DeviceScreenType.Mobile)
                                  ? 1
                                  : 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10.0,
                        ),
                        children: const [
                          DashCard(
                            icon: CupertinoIcons.check_mark_circled_solid,
                            title: "Produits vendus",
                            value: "13",
                          ),
                          DashCard(
                            icon: CupertinoIcons.money_dollar,
                            title: "Montant",
                            value: "45",
                            currency: "USD",
                          ),
                          DashCard(
                            icon: CupertinoIcons.home,
                            title: "Commandes sur place",
                            value: "12",
                          ),
                          DashCard(
                            icon: Icons.wb_cloudy_sharp,
                            title: "Commandes en ligne",
                            value: "0",
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        height: 50.0,
                        width: constraint.maxWidth,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.deepPurple, width: .1),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Les commandes (Reserves)",
                                style: GoogleFonts.didactGothic(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                children: [
                                  StatusBtn(
                                    color: Colors.orange,
                                    icon: Icons.restore_sharp,
                                    isActive: true,
                                    label: "En cours",
                                    onPressed: () {},
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  StatusBtn(
                                    color: Colors.green,
                                    icon: Icons.restaurant_menu_rounded,
                                    label: "Servies",
                                    onPressed: () {},
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  StatusBtn(
                                    color: Colors.red,
                                    icon: Icons.clear_rounded,
                                    label: "Annul??es",
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      GridView.builder(
                        padding: const EdgeInsets.only(top: 20.0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.0,
                          crossAxisCount: (responsiveInfo.deviceScreenType ==
                                  DeviceScreenType.Tablet)
                              ? 3
                              : (responsiveInfo.deviceScreenType ==
                                      DeviceScreenType.Mobile)
                                  ? 1
                                  : 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return OrderCard(
                            statusColor:
                                index.isEven ? Colors.orange : Colors.green,
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
    );
  }
}

class StatusBtn extends StatelessWidget {
  const StatusBtn(
      {Key key,
      this.color,
      this.onPressed,
      this.icon,
      this.label,
      this.isActive = false})
      : super(key: key);
  final MaterialColor color;
  final Function onPressed;
  final IconData icon;
  final bool isActive;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? color.shade400 : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 10.0,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 6, 10, 6),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isActive ? Colors.white : color.shade900,
                  size: 15.0,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  label,
                  style: GoogleFonts.didactGothic(
                    color: isActive ? Colors.white : color.shade900,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
