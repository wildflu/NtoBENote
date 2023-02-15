

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:yfalse/pdf_content/pdf_create.dart';

import 'db/db_sqflite.dart';

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  Litedb litedb = Litedb();

  List<Map>? x;

  Future<void> getData() async {
    x = await litedb.read("audio");
    print(x);
    setState(() {});
  } 

  @override
  void initState() {
    super.initState();
    getData();
  }

  deletefromDb(int x)async {
    int res = await litedb.delete("audio", "id = $x");
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            PDfGenerater.createPdf();
          }, icon: const Icon(Icons.picture_as_pdf)),
          IconButton(onPressed: (){
            PDfGenerater.OpenPdf();
          }, icon: const Icon(Icons.read_more)),

          IconButton(onPressed: (){
            PDfGenerater.OpenImg();
          }, icon: const Icon(Icons.image)),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: x==null ? 0 : x!.length,
          itemBuilder: (context, index) {
            return x == null
            ? const CircleAvatar()
            : Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              color: Colors.grey[200],
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(x![index]['text']),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(onPressed: ()async{
                      await deletefromDb(x![index]['id']);
                    }, icon: const Icon(Icons.delete_outline_outlined))
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}