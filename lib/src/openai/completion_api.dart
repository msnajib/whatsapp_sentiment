import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_key.dart';
import 'completion_req.dart';
import 'completion_res.dart';

class CompletionsApi {
  // The completions endpoint

  final Uri completionsEndpoint =
      Uri.parse('https://api.openai.com/v1/completions');

// The headers for the completions endpoint, which are the same for all requests
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $openAIApiKey',
  };

  /// Gets a "weather forecast" from the OpenAI completions endpoint
  Future<CompletionsResponse> getNewForecast(String message) async {
    debugPrint('_xxx Getting a new weather forecast');

    CompletionsRequest request = CompletionsRequest(
        model: "text-davinci-003",
        prompt: "${message}\nSentiment:",
        temperature: 0,
        maxTokens: 60,
        topP: 1,
        frequencyPenalty: 0.5,
        presencePenalty: 0);
    // debugPrint('_xxx Sending OpenAI API request with prompt, "${completionsPrompts[promptIndex]}", and temperature, $temp.');
    http.Response response = await http.post(
      completionsEndpoint,
      headers: headers,
      body: jsonEncode(request),
    );
    debugPrint('_xxx Received OpenAI API response: ${response.body}');
    // Check to see if there was an error
    if (response.statusCode != 200) {
      // TODO handle errors
      debugPrint(
          '_xxx Failed to get a forecast with status code, ${response.statusCode}');
    }
    CompletionsResponse completionsResponse =
        CompletionsResponse.fromJson(jsonDecode(response.body));
    return completionsResponse;
  }
}
