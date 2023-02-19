import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/add_Post_screen.dart';
import 'package:instagram_clone/screen/feed_screen.dart';
const webScreenSize=600;
const homeScreenItem=[
  // Text('home'),
  feedScreen(),
  Text("search"),
  addPost(),
  Text("Like"),
  Text('profile'),

];