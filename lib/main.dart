import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sample/screen/app_homepage.dart';

void main() async{
  await dotenv.load();
  runApp(HomePage());
}
