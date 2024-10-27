import 'package:flutter/material.dart';
import '../../../../../utils/utils.dart';
import '../../../chat/chat_view.dart';
import 'chat_tile.dart';

class MessagesList extends StatelessWidget {
  final bool isPinned;
  final ValueNotifier<int?> selectedIndexNotifier = ValueNotifier<int?>(null);

  MessagesList({super.key, required this.isPinned});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: selectedIndexNotifier,
      builder: (context, selectedIndex, child) {
        return Column(
          children: Utils.chatList
              .where((message) => message['isPinned'] == isPinned)
              .toList()
              .asMap()
              .entries
              .map((entry) {
            final index = entry.key;
            final message = entry.value;
            return GestureDetector(
              onTap: () {
                selectedIndexNotifier.value = selectedIndex == index ? null : index;
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen(),));
              },
              child: ChatTile(
                name: message['name'],
                message: message['message'],
                isOnline: message['isOnline'],
                unreadCount: message['unreadCount'],
                useTextAvatar: message['useTextAvatar'],
                avatarText: message['avatarText'],
                avatar: message['avatar'],
                isSelected: selectedIndex == index,
              ),
            );
          })
              .toList(),
        );
      },
    );
  }
}
