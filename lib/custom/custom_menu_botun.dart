import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k/data/menu_items.dart';
import 'package:popover/popover.dart';

class customMenuBotun extends StatelessWidget {
  const customMenuBotun({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => showPopover(
        context: context,
        bodyBuilder: (context) => MenuItems(),
        width: 250,
        height: 250,
        backgroundColor: const Color(0x9AE91E62),
        direction: PopoverDirection.bottom,
      ),
      child: Icon(FontAwesomeIcons.filter),
    );
  }
}
