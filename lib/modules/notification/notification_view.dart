// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/notification/components/empty_notification.dart';
import 'package:wayii/modules/notification/components/notification_card.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notifications = [
      {
        'id': 'notifications',
        'date': '10-01-2024',
        'message':
            'Tortor feugiat morbi amet pellentesque dolor pretium et pulvinar. Viverra egestas interdum urna luctus diam amet',
        'isView': "true",
      },
      {
        'id': 'notifications',
        'date': '10-01-2024',
        'message':
            'Tortor feugiat morbi amet pellentesque dolor pretium et pulvinar. Viverra egestas interdum urna luctus diam amet',
        'isView': "true",
      },
      {
        'id': 'notifications',
        'date': '10-01-2024',
        'message':
            'Tortor feugiat morbi amet pellentesque dolor pretium et pulvinar. Viverra egestas interdum urna luctus diam amet',
        'isView': "true",
      },
      {
        'id': 'notifications',
        'date': '10-01-2015',
        'message':
            'Tortor feugiat morbi amet pellentesque dolor pretium et pulvinar. Viverra egestas interdum urna luctus diam amet',
        'isView': "false",
      },
      {
        'id': 'notifications',
        'date': '10-01-2015',
        'message':
            'Tortor feugiat morbi amet pellentesque dolor pretium et pulvinar. Viverra egestas interdum urna luctus diam amet',
        'isView': "false",
      }
    ];
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Notifications',
          style:
              AppTypography.kFuturaMedium24.copyWith(color: AppColors.kWhite),
        ),
      ),
      body: notifications.isEmpty
          ? const EmptyNotification()
          : NotificationListView(notificationsList: notifications),
    );
  }
}

class NotificationListView extends StatefulWidget {
  List<Map<String, dynamic>> notificationsList;
  NotificationListView({required this.notificationsList, super.key});

  @override
  State<NotificationListView> createState() => _NotificationListViewState();
}

class _NotificationListViewState extends State<NotificationListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      children: [
        SizedBox(
          height: 10.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...widget.notificationsList.map((notification) {
              return NotificationCard(notifications: notification);
            }).toList(),
          ],
        )
      ],
    );
  }
}
