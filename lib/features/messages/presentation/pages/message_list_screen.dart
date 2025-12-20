// lib/features/messages/presentation/pages/message_list_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MessageListScreen extends StatelessWidget {
  const MessageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                "Doctor's Messages",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildMessageTile(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTile(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/messages/chat'),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('assets/message/joynal.png', height: 45, width: 45, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dr. Joynal Abedin", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Hi, how can i help you", style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            const Text("10:30am", style: TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}