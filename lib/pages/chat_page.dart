import 'package:chat_app/core/models/services/auth/chat/auth_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('data'),
          TextButton(
            onPressed: () {
              AuthService().logout();
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
