// lib/features/messages/presentation/pages/chat_screen.dart
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text("Messages", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text("09:41 AM", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildMessageBubble("Hi, Mandy", isMe: true),
                _buildMessageBubble("I've tried the app", isMe: true),
                _buildMessageBubble("Really?", isMe: false),
                _buildMessageBubble("Yeah, It's really good!", isMe: true),
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text("Typing...", style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, {required bool isMe}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) const CircleAvatar(radius: 14, backgroundImage: AssetImage('assets/message/joynal.png')),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isMe ? const Color(0xFF6C63FF) : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                text,
                style: TextStyle(color: isMe ? Colors.white : Colors.black, fontSize: 14),
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (isMe) const CircleAvatar(radius: 14, backgroundImage: AssetImage('assets/home/user_large.png'),),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFF),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Type your message........",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
            ),
            IconButton(icon: const Icon(Icons.link, color: Colors.grey), onPressed: () {}),
            IconButton(icon: const Icon(Icons.image_outlined, color: Colors.grey), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}