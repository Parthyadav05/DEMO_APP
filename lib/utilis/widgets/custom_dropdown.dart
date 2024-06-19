import 'package:flutter/material.dart';

enum SampleItem { Save, Like }

class CustomPopupMenu extends StatefulWidget {

  CustomPopupMenu({super.key});

  @override
  State<CustomPopupMenu> createState() => _CustomPopupMenuState();
}

class _CustomPopupMenuState extends State<CustomPopupMenu> {
  SampleItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_horiz),
      initialValue: selectedMenu,
      onSelected: (SampleItem item) {
        setState(() {
          selectedMenu = item;

        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.Like,
          child: Text('Like Posts'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.Save,
          child: Text('Save Posts'),
        ),

      ],
    );
  }
}