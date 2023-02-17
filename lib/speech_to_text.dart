import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'db/db_sqflite.dart';

class SpeechtoText extends StatefulWidget {
  const SpeechtoText({super.key});

  @override
  State<SpeechtoText> createState() => _SpeechtoTextState();
}

class _SpeechtoTextState extends State<SpeechtoText> {

  Litedb litedb = Litedb();

  stt.SpeechToText? speech;
  bool isListening = false;

  String textSpeech = "click the button to start speaking";

  void onLisenspeech() async {
    if (!isListening) {
      bool available = await speech!.initialize(
          onStatus: (val) => print("onStatus: $val "),
          onError: (val) => print("oneroer: $val "));
      if (available) {
        setState(() {
          isListening = true;
        });
        speech!.listen(
          onResult: (result) => setState(() {
            textSpeech = result.recognizedWords;
          }),
        );
      }
    } else {
      isListening = false;
      speech!.stop();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }

  


  Future<void> insert(String q, String a)async {
    int res = await litedb.insert("audio", {"question": q, "text": a});
    print(res);
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text("Speech to Text"),
      ),
      body: Container(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(30),
              color: Colors.grey[500],
              child: Text(textSpeech),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: IconButton(
                      onPressed: () => onLisenspeech(),
                      icon: Icon(isListening ? Icons.mic : Icons.mic_off),
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: IconButton(
                      onPressed: ()async{
                        await insert("1", textSpeech);
                      },
                      icon: const Icon(Icons.save_alt),
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: IconButton(
                      onPressed: (){
                        textSpeech = "";
                      },
                      icon: const Icon(Icons.delete_outline_rounded),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
