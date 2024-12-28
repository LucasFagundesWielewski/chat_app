import 'package:chat_app/core/models/chat_messages.dart';
import 'package:chat_app/core/models/chat_user.dart';
import 'package:chat_app/core/models/services/chat/chat_mock_service.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStram();
  Future<ChatMessage> save(String text, ChatUser user);

  factory ChatService() {
    return ChatMockService();
  }
}
