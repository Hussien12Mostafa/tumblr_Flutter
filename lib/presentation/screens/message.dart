import 'package:flutter/material.dart';
import 'package:tumbler/presentation/screens/chatScreens/Chat.dart';
import 'package:tumbler/presentation/screens/chatScreens/sendMessage.dart';

class Message extends StatefulWidget {
  const Message({ Key? key }) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title:  Text("Goddemunchies"),
        actions: [
          //IconButton(onPressed: (){}, icon:  Icon(Icons.more_vert),),
       PopupMenuButton<String>(onSelected:(value){
         print(value);
       }
           ,itemBuilder: (BuildContext contesxt){
         return [
           PopupMenuItem(child: Text("Settings"), value: "Settings",),
           PopupMenuItem(child: Text("D7k"),value: "D7k"),
         ];
       })
        ],
        
      ),
      body: SafeArea(child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Expanded(
                  flex: 2,child: Container(height: 50,color: Colors.lightBlue,child: RaisedButton(color: Colors.lightBlue,onPressed: (){},textColor: Colors.white ,child: Text("Activity",)))),
             Expanded(flex: 2,child: Container(height: 50,color: Colors.lightBlue,child: RaisedButton( color: Colors.lightBlue,onPressed: (){}, child: Text("Messages"), textColor: Colors.white,))),
            ],
          ),

         Expanded(child: ListView.builder(
           itemCount: chatsData.length,
           itemBuilder: (context,index) => ChatCard(saying: chatsData[index],press: (){
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => SendMessage()));
           },),
         ),
         ),
         ],
      ),),
    );
  }
}






class ChatCard extends StatelessWidget {
 const ChatCard({Key? key,
   required this.saying,
   required this.press,
 }
  ) : super(key: key);

final Chatt saying;
final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: press,

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Row(
            children: [
              Stack(
                children: [ const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage("https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                //Get each user's actual avatar!

          ),
                  //Check if the person is online?
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 3,
                        ),
                      ),
                    ),
                  ),

              ]
        ),

              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Get user's name & last message from the backend?

                    Text(saying.name, style: const TextStyle(
                      fontSize: 15,

                      fontWeight: FontWeight.w500,
                    ),),
                     const SizedBox(height: 5),
                     Opacity(
                      opacity: 0.64,
                      child: Text(saying.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,),
                    ),
                    const SizedBox(height: 15,),
                  ],

                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

