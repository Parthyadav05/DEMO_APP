import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:sample/screen/app_homepage.dart';

import '../../screen/community_page.dart';
import '../../screen/saved_post.dart';
import '../../screen/wishlist_post.dart';
const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
    // title: 'Home',
  ),
  TabItem(
    icon: Icons.favorite_border,
    title: 'Wishlist',
  ),
  TabItem(
    icon: Icons.save_alt,
    title: 'Saved',
  ),
  TabItem(
    icon: Icons.people_alt,
    title: 'Community',
  ),
];
List<Widget> navigate = [ HomePage(),WishListPage(),SavedPostPage(),CommunityPage()];
class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int visit = 0;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:const EdgeInsets.all(8),
    child: BottomBarFloating(
    items: items,
    borderRadius: BorderRadius.circular(8),
    backgroundColor: Colors.black,
    color: Colors.white,
    colorSelected: Colors.orange,
    paddingVertical: 10,
      indexSelected: visit,
    onTap: (int index) => setState(() {
        visit = index;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>navigate[visit]));
    }),
    ),);
  }
}
