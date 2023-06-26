import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'buttonfloatingdialog.dart';
import 'itemMessage.dart';

class ButtonChat extends StatefulWidget {
  @override
  _ButtonChatState createState() => _ButtonChatState();
}

class _ButtonChatState extends State<ButtonChat> {
  final List<ItemMessage> _messages = <ItemMessage>[];
  final TextEditingController _textController = TextEditingController();

  // void Response(query) async {
  //   _textController.clear();
  //   AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/jarvis.json").build();
  //   Dialogflow dialogflow =Dialogflow(authGoogle: authGoogle,language: Language.english);
  //   AIResponse response = await dialogflow.detectIntent(query);
  //   ItemMessage message = new ItemMessage(
  //     text: response.getMessage() ?? new TypeMessage(response.getListMessage()[0]).platform,
  //     name: "Bot",
  //     type: false,
  //   );
  //   setState(() {
  //     _messages.insert(0, message);
  //   });
  // }

  Widget _buildTextComposer() {
    return IconTheme(
      data: const IconThemeData(
          color: Colors.indigo),
      child: Container(
        margin: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                const InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 4.0),
              child: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _handleSubmitted(_textController.text);
                    _textController.text = "";
                  }),
            ),
          ],
        ),
      ),
    );
  }
  void _handleSubmitted(String text) {
    _textController.clear();
    ItemMessage message = ItemMessage(
      text: text,
      name: "Me",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    // Response(text);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return new ButtonFloatingDialog(
  //     heightCard: null,
  //     child: new Column(
  //       children: <Widget>[
  //         new Container(
  //           height: 30.0,
  //           child: Center(
  //             child: new Text(
  //               "Contact",
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
  //             ),
  //           ),
  //         ),
  //         new Flexible(
  //             child: new ListView.builder(
  //               padding: new EdgeInsets.all(8.0),
  //               reverse: true,
  //               itemBuilder: (_, int index) => _messages[index],
  //               itemCount: _messages.length,
  //             )),
  //         new Divider(height: 1.0),
  //         new Divider(height: 1.0),
  //         new Container(
  //           decoration: new BoxDecoration(color: Theme.of(context).cardColor),
  //            child: _buildTextComposer(),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
