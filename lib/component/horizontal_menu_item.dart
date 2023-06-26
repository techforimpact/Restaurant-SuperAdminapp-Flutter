
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../constants/controller.dart';
import '../constants/style.dart';
import 'custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String? itemName;
  final void Function()? onTap;
  HorizontalMenuItem({
    Key? key,
    this.itemName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName!)
            : menuController.onHover('not hovering');
      },
      child: Obx(() => Container(
            color: menuController.isHovering(itemName!)
                ? active.withOpacity(.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                  visible: menuController.isHovering(itemName!) ||
                      menuController.isActive(itemName!),
                  child: Container(
                    width: 6,
                    height: 40,
                    color: active,
                  ),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                ),
                SizedBox(width: _width / 88),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: menuController.returnIconFor(itemName!),
                ),
                if (!menuController.isActive(itemName!))
                  Flexible(
                      child: CustomText(
                    text: itemName,
                    color:
                        menuController.isHovering(itemName!) ? active : lightGrey,
                  ))
                else
                  Flexible(
                      child: CustomText(
                    text: itemName,
                    color: active,
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ))
              ],
            ),
          )),
    );
  }
}
