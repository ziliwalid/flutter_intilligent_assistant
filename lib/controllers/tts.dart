import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech{
  static FlutterTts tts = FlutterTts();
//text to speach
  static initTTS(){
    tts.setLanguage("fr-FR");
    tts.setPitch(1.0);
    tts.setSpeechRate(0.7); // adjust speech rate
    tts.setVolume(1.0); // adjust volume
  }

  static speak(String text) async{
    tts.setStartHandler(() {
      print('TTS IS STARTED');
    });

    tts.setCompletionHandler(() {
      print('COMPLETED');
    });

    tts.setErrorHandler((message) {
      print(message);
    });

    await tts.awaitSpeakCompletion(true);
    tts.speak(text);
  }
}
