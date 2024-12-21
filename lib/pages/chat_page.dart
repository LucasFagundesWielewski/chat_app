import 'package:chat_app/core/models/services/auth/chat/auth_mock_service.dart';
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
              AuthMockService().logout();
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
