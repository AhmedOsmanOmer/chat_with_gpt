class ResponseModel {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<CompletionChoice> choices;
  final Usage usage;

  ResponseModel({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      id: json['id'],
      object: json['object'],
      created: json['created'],
      model: json['model'],
      choices: (json['choices'] as List<dynamic>)
          .map((choiceJson) => CompletionChoice.fromJson(choiceJson))
          .toList(),
      usage: Usage.fromJson(json['usage']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'created': created,
      'model': model,
      'choices': choices.map((choice) => choice.toJson()).toList(),
      'usage': usage.toJson(),
    };
  }
}

class CompletionChoice {
  final String text;
  final int index;
  final dynamic logprobs;
  final String finishReason;

  CompletionChoice({
    required this.text,
    required this.index,
    required this.logprobs,
    required this.finishReason,
  });

  factory CompletionChoice.fromJson(Map<String, dynamic> json) {
    return CompletionChoice(
      text: json['text'],
      index: json['index'],
      logprobs: json['logprobs'],
      finishReason: json['finish_reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'index': index,
      'logprobs': logprobs,
      'finish_reason': finishReason,
    };
  }
}

class Usage {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      promptTokens: json['prompt_tokens'],
      completionTokens: json['completion_tokens'],
      totalTokens: json['total_tokens'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prompt_tokens': promptTokens,
      'completion_tokens': completionTokens,
      'total_tokens': totalTokens,
    };
  }
}
