import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentalities/presentation/blocs/cubit/profile_cubit.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  ProfileCubit profileCubit = ProfileCubit();
  void getData() async {
    try {} catch (ex) {}
  }

  final List<Map<String, dynamic>> notificationItem = [
    {
      "title": "Product is ready stock!",
      "subtitle":
          "DentoCrown HD Self-Curing Resin Automix Cartridge are available. Check out before it's sold out again.",
      "date": "25 July 2025, 14:37",
      "isNew": true,
    },
    {
      "title": "Orders are on shipment",
      "subtitle": "2 items are on the way to Klinik John!",
      "date": "25 July 2025, 14:37",
      "isNew": true,
    },
    {
      "title": "Orders are on shipment",
      "subtitle": "2 items are on the way to Klinik John!",
      "date": "25 July 2025, 14:37",
      "isNew": false,
    },
    {
      "title": "Orders are on shipment",
      "subtitle": "2 items are on the way to Klinik John!",
      "date": "25 July 2025, 14:37",
      "isNew": false,
    },
    {
      "title": "Orders are on shipment",
      "subtitle": "2 items are on the way to Klinik John!",
      "date": "25 July 2025, 14:37",
      "isNew": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map?;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => profileCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notification"),
          leading: IconButton(
            icon: Icon(CupertinoIcons.chevron_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: ListView.separated(
            itemCount: notificationItem.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final notif = notificationItem[index];
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  notif["title"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              if (notif["isNew"])
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Text(
                                    'New',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            notif["subtitle"],
                            style: const TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            notif["date"],
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
