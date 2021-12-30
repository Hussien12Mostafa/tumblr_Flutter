
import 'package:flutter/material.dart';
import 'package:tumbler/presentation/screens/chatScreens/ChatMessage.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({Key? key}) : super(key: key);

  @override
  _SendMessageState createState() => _SendMessageState();
}

TextEditingController _message = TextEditingController();
class _SendMessageState extends State<SendMessage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          children : [
            CircleAvatar(backgroundImage: NetworkImage("https://wallpaperaccess.com/full/2213426.jpg"),),
            SizedBox(width: 10,),
            Text("Who Am I talking to?",), //Get friend's name?
            SizedBox(width: 50),

        ],
      ),
        actions: [
          IconButton(onPressed: (){}, icon:  Icon(Icons.more_vert),),
        ],
      ),

      body: SafeArea(child: Column(
        children: [

          Expanded(

            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder:  (context,index) => Message(message: demeChatMessages[index]),),
          ),

          Container(

            decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(color: Colors.grey),
            ),
            height:50,
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.gif),),
                IconButton(onPressed: (){
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CameraPage()));*/
                }, icon: Icon(Icons.camera),),
              ],
            ),

          ),
          Container(
            color: Colors.white70,
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _message,
            decoration: InputDecoration(
              hintText: "Say your thing",
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: (
                    ){
                  setState(() {
                    if(_message.toString().isNotEmpty){
                      print("We're inside?");
                    ChatMessage x=  ChatMessage(
                      text: "Kaaaaaaaaaaaaaak",
                      messageType: ChatMessageType.text,
                      messageStatus: MessageStatus.viewed,
                      isSender: true,
                    );
                    Message(message: x,);
                    }
                  });

                },
              ),
            ),


            ),
          )
        ],
      )),
    );
  }
}

class Message extends StatelessWidget {
  const Message({Key? key, required this.message}) : super(key: key);
final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
         padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: message.isSender ? Colors.white : Colors.grey,
          ),
          child: message.text.isNotEmpty ? Text(
            message.text,
           style: TextStyle(color: Colors.black,),
          ) : null,
    ),

      ],
    );
  }
}

