import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sample/data/features/features.dart';
import 'package:sample/data/repository/home_model.dart';
import 'package:sample/utilis/widgets/custom_dropdown.dart';



class CustomContainer extends StatefulWidget {
  final String title;
  final String imageurl;
  final int likes;
  final String description;
  final int comments;
  final Model model;
  CustomContainer({required this.title , required this.model , required this.imageurl , required this.likes ,required this.description,required this.comments});
  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(4),
        ),
        child:  Column(
          children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
               CustomPopupMenu(),
             ],),
              Container(
              child: Image.network(widget.imageurl),
              ),
            const SizedBox(height: 5,),
            Text(widget.title),
            const SizedBox(height: 2,),
            Row(
              children: [
                SizedBox(width: 5,),
                GestureDetector(
                    onTap: (){
                       SavePost(curr: widget.model);
                      },
                    child: Icon(Icons.thumb_up_alt_outlined ,size: 16.0)),
                SizedBox(width: 2,),
                Text("${widget.likes}" ,style: TextStyle(fontSize: 16),),
                SizedBox(width: 2,),
                Text("Likes",style: TextStyle(fontSize: 16)),
                SizedBox(width: MediaQuery.of(context).size.width/6.5,),
                Icon(Icons.insert_comment_outlined ,size: 16,),
                SizedBox(width: 2,),
                Text("${widget.comments}",style: TextStyle(fontSize: 16)),
                SizedBox(width: 2,),
                Text("Comments",style: TextStyle(fontSize: 16)),
                SizedBox(width: MediaQuery.of(context).size.width/7,),
                GestureDetector(
                    onTap: (){
                      WishListPost(curr: widget.model);
                    },
                    child: Icon(Icons.add_box_rounded,size: 16,)),
                Text("Save",style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}
