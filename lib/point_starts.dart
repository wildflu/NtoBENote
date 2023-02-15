

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yfalse/home_screen.dart';

class PageStart extends StatefulWidget {
  const PageStart({super.key});

  @override
  State<PageStart> createState() => _PageStartState();
}

class _PageStartState extends State<PageStart> {

  PageController controllerpage = PageController();

  List<Widget> containers = [
    Container(
      // color: Colors.red,
      child: const Center(
        child: Text("Page 1"),
      ),
    ),
    Container(
      // color: Colors.blue,
      child: const Center(
        child: Text("Page 2"),
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
            SizedBox(height: 50,),
            Container(
              alignment: Alignment(0.75, 1),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                ),
                onPressed: (){
                  Get.off(()=>const HomeScreen());
                }, 
                icon: const Icon(Icons.grass_outlined), 
                label: const Text("Get Started")),
            ),
          ],
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: 
        [Container(
          child: PageView.builder(
            controller: controllerpage,
            itemCount: containers.length,
            itemBuilder: (context, index) {
              return containers[index];
            },
          ),
        ),
        Container(
          alignment: const Alignment(0 , 0.85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmoothPageIndicator(
                  controller: controllerpage,
                  count: 3,
                  effect: CustomizableEffect(
                    activeDotDecoration: DotDecoration(
                      width: 32,
                      height: 12,
                      color: Colors.indigo,
                      rotationAngle: 180,
                      verticalOffset: -10,
                      borderRadius: BorderRadius.circular(24),
                      
                    ),
                    dotDecoration: DotDecoration(
                      width: 24,
                      height: 12,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                      verticalOffset: 0,
                    ),
                    spacing: 6.0,
                  ),
              ),
              
            ],
          ),
        )
      ],
    ),);
  }
}