import 'package:flutter/material.dart';
import 'package:sample/data/features/features.dart';

import '../data/repository/home_model.dart';
import '../utilis/widgets/custom_widget.dart';
class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(title: Text("Saved Post"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: WishListPosts.length,
            itemBuilder: (context ,index){
              Model event = WishListPosts[index];
              return CustomContainer(model: event,title: "${event.title}", imageurl: "${event.image![0].toString()}", likes:  event.likes ?? 0, description: "${event.description}", comments: event.comments?.length ?? 0 );
            }),
      );
  }
}
