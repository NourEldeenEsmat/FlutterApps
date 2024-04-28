import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/customer/chat/providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Chats',
          isBack: false,
          isHome: false,
        ),
      ),
      body: Consumer<ChatProvider>(
        builder: (context, chatProvider, child) {
          return ListView.separated(
            separatorBuilder: (context, index) {
              final currentChat = chatProvider.chatList[index];
              final nextChat = index < chatProvider.chatList.length - 1
                  ? chatProvider.chatList[index + 1]
                  : null;

              // Check if the next chat has the same chatId as the current one
              final shouldShowDivider = nextChat == null ||
                  nextChat['chatId'] != currentChat['chatId'];

              // If the next chat has different chatId, show the divider
              return shouldShowDivider
                  ? const Divider(
                      height: 1,
                      color: Colors.grey,
                      indent: 20,
                      endIndent: 20,
                    )
                  : const SizedBox.shrink(); // Otherwise, hide the divider
            },
            itemCount: chatProvider.chatList.length,
            itemBuilder: (context, index) {
              final chatItem = chatProvider.chatList[index];
              final lastMessage = chatItem['messages'].last;
              return Dismissible(
                key: UniqueKey(),
                secondaryBackground: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 360),
                    child: Icon(Icons.delete),
                  ),
                ),
                background: Container(
                  color: Colors.grey,
                  alignment: Alignment.centerRight,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 360),
                    child: Icon(Icons.volume_mute),
                  ),
                ),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    // Mute chat
                    chatProvider.muteChat(index);
                  } else if (direction == DismissDirection.startToEnd) {
                    // Delete chat
                    chatProvider.removeChat(index);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(chatItem['tableName']),
                        Text(
                          " (${chatItem['clubName']})",
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                      ],
                    ),
                    subtitle: Text(lastMessage['message']),
                    trailing: Text(chatItem['time']),
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            chatProvider.chatList[index]['chatImage'],
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        if (chatItem['muted'] ?? false)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
                                Icons.volume_off,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
