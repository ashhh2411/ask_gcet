import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import '../../model/user_model.dart';
import '../../shared/component/component.dart';
import 'chat_screen.dart';


class MessagesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskPunCubit, AskPnuStates>(
      listener: (context,state){},
      builder: (context,state){
        return  ConditionalBuilder(
          condition:true ,
          builder: (context) =>Scaffold(
            backgroundColor:Colors.white,
            appBar: AppBar(
              elevation:0,
              iconTheme:const IconThemeData(
                  color: Color(0xff004080)
              ),
            ),
            body: Container(
              color: Colors.white,
              child: ListView.separated(
                shrinkWrap: true,
                physics:const BouncingScrollPhysics(),
                itemBuilder:(context, index)=> buildCommentItem(context, AskPunCubit.get(context).users[index]),
                separatorBuilder: (context, index)=>myDivider(),
                itemCount:AskPunCubit.get(context).users.length,
              ),
            ),
          ),
          fallback:(context) =>const Center(child: CircularProgressIndicator()) ,
        );
      },
    );
  }
}
Widget buildCommentItem(context, UserModel model) =>InkWell(
  onTap: (){
    navigateTo(context, ChatScreen(model));
    AskPunCubit.get(context).getMessages(receiverId: model.uId);

  },
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding:const EdgeInsetsDirectional.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${model.name}',
                  style:const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);
