import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foriyana_app/presentation/blocs/cubit/profile_cubit.dart';

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
        body: ListView(children: []),
      ),
    );
  }
}
