import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/presentation/blocs/cubit/auth_cubit.dart';

import 'package:dentalities/presentation/blocs/cubit/profile_cubit.dart';

import 'package:dentalities/presentation/widgets/app_drawer.dart';
import 'package:dentalities/presentation/widgets/home/feature_product.dart';
import 'package:dentalities/presentation/widgets/recommended_product.dart';
import 'package:dentalities/presentation/widgets/home/top_collection.dart';

class CSTab extends StatefulWidget {
  const CSTab({super.key});

  @override
  State<CSTab> createState() => _CSTabState();
}

class _CSTabState extends State<CSTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  ProfileCubit profileCubit = ProfileCubit();
  void getData() async {
    try {} catch (ex) {}
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.watch<AuthCubit>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => profileCubit),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
