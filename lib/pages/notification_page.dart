import 'package:chat_app/core/models/services/notification/chat_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);
    final items = service.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minhas Notificações',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: service.itemsCount,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(items[i].title),
          subtitle: Text(items[i].body),
          onTap: () => service.remove(i),
        ),
      ),
    );
  }
}
