import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import '../../model/chat_model.dart';
import '../../model/user_model.dart';

class ChatScreen extends StatelessWidget {
  UserModel model;

  ChatScreen(this.model);

  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        AskPunCubit.get(context).getMessages(receiverId: model.uId);
        return BlocConsumer<AskPunCubit, AskPnuStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor:Colors.white,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor:const Color(0xff004080),
                elevation: 0,
                title:const Text('Message'),
                actions:const [Image(image: AssetImage('assets/images/icon1.png'))],
              ),
              body: ConditionalBuilder(
                condition: AskPunCubit.get(context).messages.length != null,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            var message =
                                AskPunCubit.get(context).messages[index];
                            if (AskPunCubit.get(context).userModel?.uId ==
                                message.senderId) {
                              return buildMyMessageItem(message);
                            }
                            return buildMessageItem(message);
                          },
                          separatorBuilder: (context, index) =>const SizedBox(
                            height: 5,
                          ),
                          itemCount: AskPunCubit.get(context).messages.length,
                        ),
                      ),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  controller: messageController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Write your message here...',
                                  ),
                                ),
                              ),
                            ),
                            const  SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              color:const Color(0xff004080),
                              child: MaterialButton(
                                onPressed: () {
                                  AskPunCubit.get(context).sendMessage(
                                      receiverId: model.uId,
                                      dataTime: DateTime.now().toString(),
                                      text: messageController.text);
                                  // AskPunCubit.get(context).sendMessage(
                                  //   receiverId: model.uId,
                                  //   dataTime: DateTime.now().toString(),
                                  //   text: messageController.text,
                                  messageController.clear();
                                },
                                minWidth: 1,
                                child:const Icon(
                                  Icons.send,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) =>
                const  Center(child: CircularProgressIndicator()),
              ),
            );
          },
        );
      },
    );
  }
}

//ChatModel model
Widget buildMyMessageItem(ChatModel model) => Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration:const BoxDecoration(
          color: Color(0xff004080),
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(10),
            topStart: Radius.circular(10),
            bottomEnd: Radius.circular(10),
          ),
        ),
        padding:const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Column(
          children: [
            Text(
              model.text!,
              style:const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
//ChatModel model
Widget buildMessageItem(ChatModel model) => Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration:const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(10),
            topStart: Radius.circular(10),
            bottomStart: Radius.circular(10),
          ),
        ),
        padding:const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Text(
          model.text!,
          style:const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
