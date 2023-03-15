import 'dart:convert';

import 'package:http/http.dart' as http;

String apiKey = "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";

class ApiServices {
 static String baseUrl = "https://api.openai.com/v1/completions";

 static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

 static sendMessage(String? message) async {
    var res = await http.post(
      Uri.parse(baseUrl),
      headers: header,
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": '$message',
        "temperature": 0.3,
        "max_tokens": 100,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0,
        "stop": [" Human:", " AI:"]
      }),
    );

    print(message);
    if(res.statusCode == 200){

      var responseBody = utf8.decode(res.bodyBytes);
      var data = jsonDecode(responseBody);
      var msg = data['choices'][0]['text'];
      print('this is the response: $msg');
      return msg;

    }else{
      print("Failed to fetch data");
    }
  }
}
