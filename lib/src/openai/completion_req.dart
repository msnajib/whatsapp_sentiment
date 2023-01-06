// To parse this JSON data, do
//
//     final completionsRequest = completionsRequestFromJson(jsonString);

import 'dart:convert';

CompletionsRequest completionsRequestFromJson(String str) =>
    CompletionsRequest.fromJson(json.decode(str));

String completionsRequestToJson(CompletionsRequest data) =>
    json.encode(data.toJson());

class CompletionsRequest {
  CompletionsRequest({
    required this.model,
    required this.prompt,
    required this.temperature,
    required this.maxTokens,
    this.topP,
    this.frequencyPenalty,
    this.presencePenalty,
  });

  String model;
  String prompt;
  int temperature;
  int maxTokens;
  int? topP;
  double? frequencyPenalty;
  int? presencePenalty;

  factory CompletionsRequest.fromJson(Map<String, dynamic> json) =>
      CompletionsRequest(
        model: json["model"],
        prompt: json["prompt"],
        temperature: json["temperature"],
        maxTokens: json["max_tokens"],
        topP: json["top_p"],
        frequencyPenalty: json["frequency_penalty"].toDouble(),
        presencePenalty: json["presence_penalty"],
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "prompt": prompt,
        "temperature": temperature,
        "max_tokens": maxTokens,
        "top_p": topP,
        "frequency_penalty": frequencyPenalty,
        "presence_penalty": presencePenalty,
      };
}
