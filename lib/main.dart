import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/screens/speech_screen.dart';

import 'controllers/tts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  TextToSpeech.initTTS();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT VOice Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SpeechScreen(),
    );
  }
}
