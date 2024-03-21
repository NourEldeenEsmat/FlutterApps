import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/pages/cubit/chat_cubit.dart';

import '../constants.dart';
import '../models/message.dart';
import '../widgets/chat_buble.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';

  final _controller = ScrollController();
  TextEditingController controller = TextEditingController();
  List<Message> messagesList = [];
  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    // return StreamBuilder<QuerySnapshot>(
    //   stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       List<Message> messagesList = [];
    //       for (int i = 0; i < snapshot.data!.docs.length; i++) {
    //         messagesList.add(Message.fromJson(snapshot.data!.docs[i].toString()));
    //       } --->>used in cubit  (:

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            const Text('chat'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSucsses) {
                  messagesList = state.messages;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email.toString()
                          ? ChatBuble(
                              message: messagesList[index],
                            )
                          : ChatBubleForFriend(message: messagesList[index]);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(data, email.toString());
                // messages.add(
                //   {
                //     kMessage: data,
                //     kCreatedAt: DateTime.now(),
                //     'id': email
                //   },
                // );
                controller.clear();
                _controller.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: const Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
