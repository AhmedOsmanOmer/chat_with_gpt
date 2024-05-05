import 'package:chat_gpt_app/core/colors.dart';
import 'package:chat_gpt_app/response_model.dart';
import 'package:chat_gpt_app/ui/home/constant.dart';
import 'package:chat_gpt_app/ui/home/widget/app_bar.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final openAi = OpenAI.instance.build(
      token: MY_GPT_KEY,
      baseOption: HttpSetup(connectTimeout: const Duration(seconds: 5)),
      enableLog: true);
  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: 'ahmed', lastName: 'osman');
  final ChatUser _chatGptUser =
      ChatUser(id: '2', firstName: 'chat', lastName: 'gpt');
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: 'who founded apple',
      user: ChatUser(id: '1', firstName: 'ahmed', lastName: 'osman'),
      createdAt: DateTime.now(),
    ),
    ChatMessage(
        text:
            'Apple was founded by Steve Jobs, Steve Wozniak, and Ronald Wayne on April 1, 1976. They started the company to develop and sell personal computers.',
        user: ChatUser(id: '2', firstName: 'chat', lastName: 'gpt'),
        createdAt: DateTime.now()),
    ChatMessage(
        text: 'who is the president of USA',
        user: ChatUser(id: '1', firstName: 'ahmed', lastName: 'osman'),
        createdAt: DateTime.now()),
    ChatMessage(
        text:
            'As of my last update in January 2022, the President of the United States was Joe Biden. However, to provide you with the most accurate and up-to-date information, I recommend checking a reliable news source for the current President.',
        user: ChatUser(id: '2', firstName: 'chat', lastName: 'gpt'),
        createdAt: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: const MyAppBar(),
        body: DashChat(
          
          currentUser: _currentUser,
          messages: _messages.reversed.toList(),
          onSend: (ChatMessage message) {
            getChatResponse(message);
          },
        )); /*Column(
        children: [
          Expanded(
              child: DashChat(
            currentUser: _currentUser,
            messages: _messages,
            onSend: (ChatMessage message) {
              getChatResponse(message);
            },
          )),
          const SearchTextFormField()
        ],
      ),*/
  }

  Future<void> getChatResponse(ChatMessage message) async {
    setState(() {
      _messages.insert(0, message);
    });
    List<Messages> messageHistory = _messages.map((m) {
      if (m.user == _currentUser) {
        return Messages(role: Role.user, content: m.text);
      } else {
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();
    final request = ChatCompleteText(
        model: GptTurbo16k0631Model(), messages: messageHistory, maxToken: 500);
    final response = await openAi.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
              0,
              ChatMessage(
                  text: element.message!.content,
                  user: _chatGptUser,
                  createdAt: DateTime.now()));
        });
      }
    }
  }

  /* comp() async {
    setState(() {
      //text='loading....'
    });
    final response = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Autorization': 'Bearer $MY_GPT_KEY'
        },
        body: jsonEncode({
          "model": "text_davinci-003",
          "prompt":
              "Write a short note about the following:\n\n${_messages.last.text}",
          "temperature": 0,
          "max_tokens": 100,
          "top_p": 1
        }));

        setState(() {
          responseModel=ResponseModel.fromJson(response.body) 
        });
  } */
}
