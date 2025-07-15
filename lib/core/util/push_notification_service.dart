// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:foriyana_app/core/util/string_util.dart'; 
// import 'package:rxdart/rxdart.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // title
//   description:
//       'This channel is used for important notifications.', // description
//   importance: Importance.max,
// );

// class PushNotificationService {
//   //Singleton pattern
//   static final PushNotificationService _notificationService =
//       PushNotificationService._internal();
//   factory PushNotificationService() {
//     return _notificationService;
//   }
//   PushNotificationService._internal();
//   static StreamController<ReceivedNotification>
//       didReceiveLocalNotificationStream =
//       StreamController<ReceivedNotification>.broadcast();

//   static final onNotifications = BehaviorSubject<String?>();

//   @pragma('vm:entry-point')
//   static void notificationTapBackground(NotificationResponse details) {
//     log('@MAP notificationTapBackground');
//     if (details.payload != null) {
//       try {
//         Map payload = jsonDecode(details.payload!);
//         String? module = payload["module"];
//         String? type = payload["type"];
//         int? id = StringUtil.toInt(payload["id"]);
//         if (module == "post") {
//           if (type == "ReceiveComment") { 
//           }
//         } else if (module == "story") {
//           if (type == "ReceiveStoryComment") {
//             // Author? author = Author.fromJson(payload["author"]);
//             // Get.toNamed(NamedRoutes.postDetailPage,
//             //     arguments: {"post": Feed(id: id, author: author)});
//           }
//         } else if (module == "warga") {
//           if (type == "WargaFollow") {
//             if (Get.currentRoute == NamedRoutes.profilePage) {
//               // ProfileController pc = Get.find<ProfileController>();
//               // pc.update();
//             } else {
//               Get.toNamed(NamedRoutes.profilePage, arguments: {});
//             }
//           }
//         }
//       } catch (e) {
//         log('@MAP errorNotificationTapBackground: ' + e.toString());
//       }
//     }
//   }

//   @pragma('vm:entry-point')
//   static void notificationTapForeground(NotificationResponse details) {
//     log('@MAP notificationTapForeground');
//     if (details.payload != null) {
//       try {
//         Map payload = jsonDecode(details.payload!);
//         String? module = payload["module"];
//         String? type = payload["type"];
//         int? id = StringUtil.toInt(payload["id"]);
//         if (module == "post") {
//           if (type == "ReceiveComment") {
//             Author? author = Author.fromJson(payload["author"]);
//             Get.toNamed(NamedRoutes.postDetailPage,
//                 arguments: {"post": Feed(id: id, author: author)});
//           }
//         } else if (module == "story") {
//           if (type == "ReceiveStoryComment") {
//             // Author? author = Author.fromJson(payload["author"]);
//             // Get.toNamed(NamedRoutes.postDetailPage,
//             //     arguments: {"post": Feed(id: id, author: author)});
//           }
//         } else if (module == "warga") {
//           if (type == "WargaFollow") {
//             if (Get.currentRoute == NamedRoutes.profilePage) {
//               // ProfileController pc = Get.find<ProfileController>();
//               // pc.update();
//             } else {
//               Get.toNamed(NamedRoutes.profilePage, arguments: {});
//             }
//           }
//         }
//       } catch (e) {
//         log('@MAP errorNotificationTapBackground: ' + e.toString());
//       }
//     }
//   }

//   static Future<void> initialize() async {
//     const android = AndroidInitializationSettings('@mipmap/launcher_icon');

//     /// A notification action which triggers a url launch event
//     const String urlLaunchActionId = 'id_1';

//     /// A notification action which triggers a App navigation event
//     const String navigationActionId = 'id_3';

//     /// Defines a iOS/MacOS notification category for text input actions.
//     const String darwinNotificationCategoryText = 'textCategory';

//     /// Defines a iOS/MacOS notification category for plain actions.
//     const String darwinNotificationCategoryPlain = 'plainCategory';

//     final List<DarwinNotificationCategory> darwinNotificationCategories =
//         <DarwinNotificationCategory>[
//       DarwinNotificationCategory(
//         darwinNotificationCategoryText,
//         actions: <DarwinNotificationAction>[
//           DarwinNotificationAction.text(
//             'text_1',
//             'Action 1',
//             buttonTitle: 'Send',
//             placeholder: 'Placeholder',
//           ),
//         ],
//       ),
//       DarwinNotificationCategory(
//         darwinNotificationCategoryPlain,
//         actions: <DarwinNotificationAction>[
//           DarwinNotificationAction.plain('id_1', 'Action 1'),
//           DarwinNotificationAction.plain(
//             'id_2',
//             'Action 2 (destructive)',
//             options: <DarwinNotificationActionOption>{
//               DarwinNotificationActionOption.destructive,
//             },
//           ),
//           DarwinNotificationAction.plain(
//             navigationActionId,
//             'Action 3 (foreground)',
//             options: <DarwinNotificationActionOption>{
//               DarwinNotificationActionOption.foreground,
//             },
//           ),
//           DarwinNotificationAction.plain(
//             'id_4',
//             'Action 4 (auth required)',
//             options: <DarwinNotificationActionOption>{
//               DarwinNotificationActionOption.authenticationRequired,
//             },
//           ),
//         ],
//         options: <DarwinNotificationCategoryOption>{
//           DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
//         },
//       )
//     ];
//     DarwinInitializationSettings iOS = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       // onDidReceiveLocalNotification:
//       //     (int id, String? title, String? body, String? payload) async {
//       //   didReceiveLocalNotificationStream.add(
//       //     ReceivedNotification(
//       //       id: id,
//       //       title: title,
//       //       body: body,
//       //       payload: payload,
//       //     ),
//       //   );
//       // },
//       notificationCategories: darwinNotificationCategories,
//     );

//     // await flutterLocalNotificationsPlugin
//     //     .resolvePlatformSpecificImplementation<
//     //         IOSFlutterLocalNotificationsPlugin>()
//     //     ?.requestPermissions(
//     //       alert: true,
//     //       badge: true,
//     //       sound: true,
//     //     );

//     // await flutterLocalNotificationsPlugin
//     //     .resolvePlatformSpecificImplementation<
//     //         AndroidFlutterLocalNotificationsPlugin>()
//     //     ?.createNotificationChannel(channel);

//     var settings = InitializationSettings(android: android, iOS: iOS);

//     await flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: notificationTapForeground,
//       onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//     );
//   }

//   static Future showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//   }) async =>
//       flutterLocalNotificationsPlugin.show(
//           id, title, body, await _notificationDetails(),
//           payload: payload);

//   static Future _notificationDetails() async {
//     return NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           channelDescription: channel.description,
//           importance: Importance.max,
//           priority: Priority.high,
//           icon: "@mipmap/launcher_icon",
//           largeIcon:
//               const DrawableResourceAndroidBitmap('@mipmap/launcher_icon'),

//           // color: AppColors.orangeBase,
//         ),
//         iOS: const DarwinNotificationDetails());
//   }
// }

// class ReceivedNotification {
//   ReceivedNotification({
//     required this.id,
//     required this.title,
//     required this.body,
//     required this.payload,
//   });

//   final int id;
//   final String? title;
//   final String? body;
//   final String? payload;
// }
