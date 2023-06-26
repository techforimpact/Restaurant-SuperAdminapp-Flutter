
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/controller.dart';
import '../constants/style.dart';
import 'custom_text.dart';

class VertticalMenuItem extends StatelessWidget {
  final String? itemName;
  final void Function()? onTap;
  const VertticalMenuItem({Key? key, this.itemName, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName!)
            : menuController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          color: menuController.isHovering(itemName!)
              ? active.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHovering(itemName!) ||
                    menuController.isActive(itemName!),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  width: 3,
                  height: 72,
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: menuController.returnIconFor(itemName!),
                      ),
                      if (!menuController.isActive(itemName!))
                        Flexible(
                            child: CustomText(
                          text: itemName,
                          color: menuController.isHovering(itemName!)
                              ? Colors.white
                              : active,
                        ))
                      else
                        Flexible(
                            child: CustomText(
                          text: itemName,
                          color: Colors.white,
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
