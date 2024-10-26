import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildSectionTitle('PINNED'),
                _buildPinnedMessages(),
                SizedBox(height: 24),
                _buildSectionTitle('ALL MESSAGES'),
                _buildAllMessages(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.grid_view_rounded),
          Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: 16),
              Icon(Icons.settings),
              SizedBox(width: 16),
              Stack(
                children: [
                  Icon(Icons.notifications_outlined),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: BoxConstraints(
                        minWidth: 8,
                        minHeight: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.orange[100],
            child: Icon(Icons.person, color: Colors.orange),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.grey),
          hintText: 'Search...',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPinnedMessages() {
    return Column(
      children: [
        _buildMessageTile(
          avatar: 'A',
          name: 'Alphaboard',
          message: 'Hello, Mark! I am wr...',
          avatarColor: Colors.purple[200]!,
          unreadCount: 3,
        ),
        _buildMessageTile(
          avatar: 'DT',
          name: 'Design Team',
          message: 'Hello. Can you drop t...',
          avatarColor: Colors.orange[200]!,
        ),
        _buildMessageTile(
          avatar: '👤',
          name: 'Dustin Williamson',
          message: 'Dustin is typing...',
          isOnline: true,
          unreadCount: 5,
        ),
      ],
    );
  }

  Widget _buildAllMessages() {
    return Column(
      children: [
        _buildMessageTile(
          avatar: '👤',
          name: 'Jane Wilson',
          message: 'Hi! How are you, Steve? 😃',
          isOnline: true,
        ),
        _buildMessageTile(
          avatar: '👤',
          name: 'Brandon Pena',
          message: 'How about going somew...',
          isOnline: true,
        ),
        // Add more message tiles here...
      ],
    );
  }

  Widget _buildMessageTile({
    required String avatar,
    required String name,
    required String message,
    Color? avatarColor,
    bool isOnline = false,
    int? unreadCount,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: avatarColor ?? Colors.grey[200],
                child: Text(avatar),
                radius: 24,
              ),
              if (isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (unreadCount != null)
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}