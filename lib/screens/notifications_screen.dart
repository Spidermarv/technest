import 'package:flutter/material.dart';
import 'package:technest/blocks/colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Order Shipped!',
      message: 'Your order #12345 has been shipped.',
      time: '10:30 AM',
      isRead: false,
    ),
    NotificationItem(
      title: 'Flash Sale Alert',
      message: 'Hurry up! 50% off on selected gadgets today.',
      time: '09:00 AM',
      isRead: false,
    ),
    NotificationItem(
      title: 'Order Delivered',
      message: 'Your order #12344 has been delivered successfully.',
      time: 'Yesterday',
      isRead: true,
    ),
    NotificationItem(
      title: 'Welcome to Technest!',
      message: 'Thank you for signing up. Start shopping now!',
      time: '2 days ago',
      isRead: true,
    ),
  ];

  // Function to mark all notifications as read
  void markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification.isRead = true;
      }
    });
  }

  // Function to clear all notifications
  void clearAllNotifications() {
    setState(() {
      notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bcolor,
      appBar: AppBar(
        backgroundColor: AppColors.pcolor,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all, color: Colors.white),
            onPressed: markAllAsRead,
            tooltip: 'Mark all as read',
          ),
          IconButton(
            icon: const Icon(Icons.clear_all, color: Colors.white),
            onPressed: clearAllNotifications,
            tooltip: 'Clear all notifications',
          ),
        ],
      ),
      body: notifications.isEmpty
          ? const Center(
        child: Text(
          'No notifications available.',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return _buildNotificationItem(notification);
        },
      ),
    );
  }

  Widget _buildNotificationItem(NotificationItem notification) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: notification.isRead ? Colors.white : Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundColor: AppColors.pcolor.withOpacity(0.8),
          child: Icon(
            notification.isRead ? Icons.notifications : Icons.notifications_active,
            color: Colors.white,
          ),
        ),
        title: Text(
          notification.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: notification.isRead ? Colors.black54 : Colors.black,
          ),
        ),
        subtitle: Text(
          '${notification.message}\n${notification.time}',
          style: const TextStyle(height: 1.4, color: Colors.black54),
        ),
        isThreeLine: true,
        trailing: notification.isRead
            ? const SizedBox.shrink()
            : IconButton(
          icon: const Icon(Icons.check_circle, color: Colors.green),
          onPressed: () {
            setState(() {
              notification.isRead = true;
            });
          },
          tooltip: 'Mark as read',
        ),
      ),
    );
  }
}

// Notification Item Model
class NotificationItem {
  final String title;
  final String message;
  final String time;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    this.isRead = false,
  });
}
