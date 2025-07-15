// import 'dart:convert';
// import 'dart:developer';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter_app_badger/flutter_app_badger.dart';
// import 'package:get/get.dart';
// import 'package:rtrw/app/data/memories/user_memory.dart';
// import 'package:rtrw/app/data/models/author.dart';
// import 'package:rtrw/app/data/models/login_data.dart';
// import 'package:rtrw/app/data/models/sport_activity.dart';
// import 'package:rtrw/app/data/repositories/feed_repository.dart';
// import 'package:rtrw/app/data/repositories/sport_repository.dart';
// import 'package:rtrw/app/data/utils/constants.dart';
// import 'package:rtrw/app/data/utils/get_memory.dart';
// import 'package:rtrw/app/data/utils/push_notification_service.dart';
// import 'package:rtrw/app/data/utils/string_util.dart';
// import 'package:rtrw/app/module/index/controller.dart';

// import '../../../routes/named_routes.dart';
// import '../../data/models/user_notification.dart';
// import '../../module/home/controller.dart';
// // import '../../module/maps/controller.dart';
// import '../../module/maps/controller_map.dart';
// // import '../../module/profile/controller.dart';
// import '../models/feed.dart';

// class NotifEventConst {
//   static const String mentionComment = "MentionComment";
//   static const String receiveComment = "ReceiveComment";
//   static const String receiveCommentReply = "ReceiveCommentReply";
//   static const String mentionCommentReply = "MentionCommentReply";
//   static const String favoriteComment = "FavoriteComment";
//   static const String favoriteCommentReply = "FavoriteCommentReply";
//   static const String receiveReaction = "ReceiveReaction";
//   static const String receiveStoryComment = "ReceiveStoryComment";
//   static const String receiveStoryCommentReply = "ReceiveStoryCommentReply";
//   static const String favoriteStoryComment = "FavoriteStoryComment";
//   static const String favoriteStoryCommentReply = "FavoriteStoryCommentReply";
//   static const String receiveReactionStory = "ReceiveReactionStory";
//   static const String wargaFollow = "WargaFollow";
//   static const String testing = "Testing";

//   static const String sportMentionComment = "SportMentionComment";
//   static const String sportReceiveComment = "SportReceiveComment";
//   static const String sportReceiveCommentReply = "SportReceiveCommentReply";
//   static const String sportMentionCommentReply = "SportMentionCommentReply";
//   static const String sportInvite = "SportInvite";
//   static const String sportShare = "SportShare";
// }

// class CFirebaseMessaging {
//   static FirebaseMessaging? _messaging;

//   static Future<void> reqPermission() async {
//     await _messaging!.requestPermission();
//   }

//   static Future<void> init() async {
//     _messaging ??= FirebaseMessaging.instance;
//     try {
//       // await _messaging!.requestPermission();

//       /// Update the iOS foreground notification presentation options to allow
//       /// heads up notifications.
//       await _messaging!.setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );

//       // use the returned token to send messages to users from your custom server
//       String? token = await _messaging!.getToken(
//         vapidKey: Constant.fcmVapidKey,
//       );
//       if (token != null) {
//         UserMemory.instance.fcmToken = token;
//         GetMemory.instance.putValue(null, "fcm_token", token);
//         log("@MAP FCMToken: $token");
//       }
//       //background handler
//       FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

//       //foreground handler
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//         log('@MAP NOTIF MASUK');
//         if (message.notification != null) {
//           RemoteNotification notification = message.notification!;
//           log('@MAP foregroundMessage: ${message.toString()}');

//           PushNotificationService.showNotification(
//               id: message.hashCode,
//               title: notification.title ?? '#RTRW',
//               body: notification.body ?? message.data["message"],
//               payload: jsonEncode(message.data));
//           setNotif(message);
//         }
//       });
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   static Future<void> firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     log('backgroundMessage: ${message.toString()}');

//     setNotif(message);
//   }

//   static void setNotif(RemoteMessage message) async {
//     RemoteNotification notification = message.notification!;
//     Author? author;
//     int? postId;
//     int? storyId;
//     int? commentId;
//     String? type;
//     String? module;
//     try {
//       type = message.data["type"];
//       module = message.data["module"];
//       if (module == "post") {
//         postId = message.data["id"] != null
//             ? StringUtil.toInt(message.data["id"])
//             : null;
//       } else if (module == "story") {
//         storyId = message.data["id"] != null
//             ? StringUtil.toInt(message.data["id"])
//             : null;
//       } else if (module == "sport") {
//         postId = message.data["id"] != null
//             ? StringUtil.toInt(message.data["id"])
//             : null;
//       }
//       author = message.data["author"] != null
//           ? Author.fromJson(message.data["author"])
//           : null;
//       commentId = message.data["comment_id"] != null
//           ? StringUtil.toInt(message.data["comment_id"])
//           : null;
//     } catch (e) {
//       log("@MAP Convert Error: $e");
//     }
//     UserNotification item = UserNotification(
//         author: author,
//         isRead: false,
//         createdOn: DateTime.now(),
//         title: notification.title,
//         message: notification.body,
//         postId: postId,
//         storyId: storyId,
//         commentId: commentId,
//         eventName: type);
//     UserMemory.instance.selfNotification.insert(0, item);
//     UserMemory.instance.unreadCount += 1;
//     UserMemory.instance.unseenCount += 1;
//     // FlutterAppBadger.updateBadgeCount(UserMemory.instance.unseenCount);
//     try {
//       MapsController mc = Get.find<MapsController>();
//       mc.update();
//       HomeController hc = Get.find<HomeController>();
//       hc.update();
//       IndexController ic = Get.find<IndexController>();
//       await ic.getProfileNotification();
//       // ProfileController pc = Get.find<ProfileController>();
//       // pc.update();
//     } catch (e) {}

//     LoginData? d = await UserMemory.instance.getLoginData();
//     if (d != null) {
//       //check session
//       String eventName = item.eventName ?? "";
//       if (eventName == NotifEventConst.wargaFollow) {
//         Get.toNamed(
//           NamedRoutes.profileFollowWargaPage,
//         );
//       } else if (eventName == NotifEventConst.receiveComment ||
//           eventName == NotifEventConst.mentionComment ||
//           eventName == NotifEventConst.receiveCommentReply ||
//           eventName == NotifEventConst.mentionCommentReply ||
//           eventName == NotifEventConst.favoriteComment ||
//           eventName == NotifEventConst.favoriteCommentReply ||
//           eventName == NotifEventConst.favoriteStoryComment ||
//           eventName == NotifEventConst.favoriteStoryCommentReply) {
//         goToPostDetail(postId ?? 0);
//       }

//       //   Get.toNamed(NamedRoutes.postDetailPage,
//       //       arguments: {"post": Feed(id: postId)});
//       // } else if (eventName == NotifEventConst.mentionComment) {
//       //   Get.toNamed(NamedRoutes.postDetailPage,
//       //       arguments: {"post": Feed(id: postId)});
//       // } else if (eventName == NotifEventConst.receiveCommentReply) {
//       //   Get.toNamed(NamedRoutes.postDetailPage,
//       //       arguments: {"post": Feed(id: postId)});
//       // } else if (eventName == NotifEventConst.mentionCommentReply) {
//       //   Get.toNamed(NamedRoutes.postDetailPage,
//       //       arguments: {"post": Feed(id: postId)});
//       // }
//       // else if (eventName == NotifEventConst.favoriteComment) {
//       // } else if (eventName == NotifEventConst.favoriteCommentReply) {
//       // } else if (eventName == NotifEventConst.favoriteStoryComment) {
//       // } else if (eventName == NotifEventConst.favoriteStoryCommentReply) {
//       // }

//       //sport
//       else if (eventName == NotifEventConst.sportReceiveComment ||
//           eventName == NotifEventConst.sportReceiveCommentReply ||
//           eventName == NotifEventConst.sportMentionComment ||
//           eventName == NotifEventConst.sportMentionCommentReply) {
//         goToSportActivityDetail(postId ?? 0);
//       }
//     }
//   }

//   static Future<void> goToPostDetail(int postingId) async {
//     if (postingId == 0) return;

//     log("@MAP getPostDetail");
//     try {
//       var res = await FeedRepository.getFeedsById(
//         id: postingId,
//       );
//       if (res.data["status"] == 1) {
//         Feed item = Feed.fromMap(res.data["data"]);
//         Get.toNamed(NamedRoutes.postDetailPage, arguments: {"post": item});
//       }
//     } catch (e) {
//       log("@MAP Error getPostDetail $e");
//     }
//   }

//   static Future<void> goToSportActivityDetail(int postingId) async {
//     if (postingId == 0) return;

//     log("@MAP goToSportActivityDetail");
//     try {
//       var res = await SportRepository.getSportActivityById(
//         postingId,
//       );
//       if (res.data["status"] == 1) {
//         SportActivity item = SportActivity.fromMap(res.data["data"]);
//         Get.toNamed(NamedRoutes.sportDetailPage, arguments: {"item": item});
//       }
//     } catch (e) {
//       log("@MAP Error goToSportActivityDetail $e");
//     }
//   }
// }
