import 'package:flutter/material.dart';
import 'package:sample/data/features/features.dart';

import '../data/repository/home_model.dart';
import '../utilis/widgets/custom_widget.dart';
class SavedPostPage extends StatefulWidget {
  const SavedPostPage({Key? key}) : super(key: key);

  @override
  State<SavedPostPage> createState() => _SavedPostPageState();
}

class _SavedPostPageState extends State<SavedPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Saved Post"),
          centerTitle: true,
        ),
      body: ListView.builder(
          itemCount: SavedPosts.length,
          itemBuilder: (context ,index){
            Model event = SavedPosts[index];
            return CustomContainer(model: event,title: "${event.title}", imageurl: "${event.image![0].toString()}", likes:  event.likes ?? 0, description: "${event.description}", comments: event.comments?.length ?? 0 );
          }),
    );
  }
}
