import 'dart:async';
import 'package:chat_app/core/models/chat_messages.dart';
import 'package:chat_app/core/models/chat_user.dart';
import 'package:chat_app/core/models/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMockService implements ChatService {
  @override
  Stream<List<ChatMessage>> messagesStram() {
    return const Stream<List<ChatMessage>>.empty();
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final store = FirebaseFirestore.instance;
    store.collection('chat').add({
      'text': text,
      'createdAt': DateTime.now()..toIso8601String(),
      'userId': user.id,
      'userName': user.name,
      'userImageURL': user.imageURL,
    });

    return newMessage;
  }
}
