import 'dart:async';
import 'dart:math';

import 'package:chat_app/core/models/chat_messages.dart';
import 'package:chat_app/core/models/chat_user.dart';
import 'package:chat_app/core/models/services/auth/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Bom dia!',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Juan',
      userImageURL: 'assests/images/avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Buenos Dias!',
      createdAt: DateTime.now(),
      userId: '222',
      userName: 'Pablo',
      userImageURL: 'assests/images/avatar.png',
    ),
    ChatMessage(
      id: '1',
      text: 'Até mais!',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Juan',
      userImageURL: 'assests/images/avatar.png',
    ),
  ];

  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    _controller?.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messagesStram() {
    return _msgsStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageURL,
    );
    _msgs.add(newMessage);
    _controller?.add(_msgs);
    return newMessage;
  }
}
