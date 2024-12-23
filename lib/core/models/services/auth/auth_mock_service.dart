// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:chat_app/core/models/chat_user.dart';
import 'package:chat_app/core/models/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static final _defaultUser = ChatUser(
    id: '1',
    name: 'Teste',
    email: 'email@gmail.com',
    imageURL: '/assests/images/avatar.png',
  );

  static final Map<String, ChatUser> _users = {
    _defaultUser.email: _defaultUser,
  };
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final newUser = ChatUser(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageURL: image?.path ?? 'assets/images/avatar.png',
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(ChatUser? user) {
    _currentUser = null;
    _controller?.add(_currentUser);
  }
}
