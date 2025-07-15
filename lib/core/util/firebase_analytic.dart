// import 'dart:developer';

// import 'package:firebase_analytics/firebase_analytics.dart';
// // import 'package:sentry_flutter/sentry_flutter.dart';

// // import 'package:logging/logging.dart';

// import '../memories/user_memory.dart';
// import 'date_util.dart';
// // import 'package:sentry_flutter/sentry_flutter.dart';

// class CFirebaseAnalytic {
//   static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

//   static FirebaseAnalyticsObserver observer =
//       FirebaseAnalyticsObserver(analytics: analytics);

//   static Future logging(String event, Map<String, Object> parameters) async {
//     // Sentry.configureScope(
//     //   (scope) => scope.setUser(SentryUser(
//     //       id: UserMemory.instance.loginData != null
//     //           ? UserMemory.instance.loginData!.id!.toString()
//     //           : null,
//     //       email: UserMemory.instance.loginData?.email)),
//     // );
//     // Sentry.captureEvent(SentryEvent(
//     //     eventId: SentryId.newId(), type: event, transaction: event));

//     // final logs = Logger('logger_1');
//     // logs.log(Level.INFO, {
//     //   "event": event,
//     //   "parameters": parameters,
//     // });
//     Map<String, Object> globalParameters = {
//       "date": DateUtil.formatDate(DateTime.now(), "yyyy-MM-dd HH:mm:ss"),
//     };
//     parameters.addAll(globalParameters);
//     analytics.setUserId(
//         id: UserMemory.instance.loginData != null
//             ? UserMemory.instance.loginData!.id!.toString()
//             : null);
//     analytics.setUserProperty(
//         name: "email", value: UserMemory.instance.loginData?.email);
//     try {
//       log("@MAP CFirebaseAnalytic log: $event: $parameters");
//       await analytics.logEvent(
//         name: event,
//         parameters: parameters,
//       );
//     } catch (e) {
//       log("@MAP CFirebaseAnalytic Error log: $event: $e");
//     }
//   }
// }

// class CFirebaseAnalyticEvent {
//   static String click = 'click';
//   static String navigate = 'navigate';
// }
