import 'package:flutter/material.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';

class MenuChipWidget extends StatelessWidget {
  final List<String> menuItem;

  const MenuChipWidget({
    super.key,
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: menuItem.map((item) {
        return Chip(
          label: Text(
            item,
            style: StyleTypograph.body2.medium.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.white),
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 8),
        );
      }).toList(),
    );
  }
}
