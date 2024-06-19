
import '../repository/home_model.dart';

  List<Model> SavedPosts = [];

  void SavePost({required Model curr}){
    SavedPosts.add(curr);
  }
  List<Model> WishListPosts = [];
  void WishListPost({required Model curr}){
    WishListPosts.add(curr);
  }

