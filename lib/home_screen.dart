
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:yfalse/read_data_sqflite.dart';

import 'db/db_sqflite.dart';
import 'speech_to_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(onPressed:(){
            Get.to(()=> const SpeechtoText());
          }, icon: const Icon(Icons.abc)),
          IconButton(onPressed: (){
            Get.to(()=>ReadData());
          }, icon: const Icon(Icons.data_object))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: const Center(child: Text("Home Screen"),),
      ),
    );
  }
}