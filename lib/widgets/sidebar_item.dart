import 'dart:math';

import 'package:dashui/global/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SidebarMenuItem extends StatelessWidget {
  final String itemName;
  final String label;
  final Function onTap;
  final IconData icon;
  const SidebarMenuItem(
      {Key key, this.itemName, this.onTap, this.icon, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? navigatorController.onHover(itemName)
            : navigatorController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          color: navigatorController.isHovering(itemName)
              ? color.shade50
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: navigatorController.isHovering(itemName) ||
                    navigatorController.isActive(itemName),
                child: Container(
                  width: 3,
                  height: 50,
                  decoration: BoxDecoration(
                    color: color.shade700,
                  ),
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        icon ?? Icons.data_saver_off_rounded,
                        color: navigatorController.isHovering(itemName) ||
                                navigatorController.isActive(itemName)
                            ? color.shade800
                            : Colors.grey[900],
                        size: 18.0,
                      ),
                    ),
                    if (!navigatorController.isActive(itemName))
                      Flexible(
                        child: Text(
                          label,
                          style: GoogleFonts.didactGothic(
                            color: navigatorController.isHovering(itemName)
                                ? color.shade900
                                : Colors.grey[800],
                            fontSize: 14.0,
                          ),
                        ),
                      )
                    else
                      Flexible(
                        child: Text(
                          label,
                          style: GoogleFonts.didactGothic(
                            color: color.shade900,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
