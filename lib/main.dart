import 'package:flutter/material.dart';
import 'package:workplace/widgets/root.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Root());
}
