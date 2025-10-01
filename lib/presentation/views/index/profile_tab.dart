import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/appversion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentalities/presentation/blocs/cubit/auth_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/profile_cubit.dart';
import 'package:dentalities/presentation/widgets/home/feature_product.dart';
import 'package:dentalities/presentation/widgets/recommended_product.dart';
import 'package:dentalities/presentation/widgets/home/top_collection.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
      FocusScope.of(context).unfocus();
    });
  }

  ProfileCubit profileCubit = ProfileCubit();
  void getData() async {
    try {
      profileCubit.fetchProfileData();
    } catch (ex) {}
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => profileCubit),
        ],
        child: Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, AppRouter.userProfile,
                    //     arguments: {"profileCubit": profileCubit});
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        // const CircleAvatar(
                        //   radius: 28,
                        //   backgroundImage:
                        //       AssetImage('assets/images/banner.png'),
                        // ),
                        // const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Constant.userLocalDataSource.userData
                                        ?.fullName ??
                                    "",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Orthodontics',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                Divider(),
                const SizedBox(height: 12),

                // Account Section
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRouter.userProfileNewPassword,
                        arguments: {"profileCubit": profileCubit});
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Account',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Constant.userLocalDataSource.userData?.email ??
                                ""),
                            Text(Constant.userLocalDataSource.userData?.phone ??
                                ""),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Text(
                              'Password:',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 6),
                            Text(
                              '••••••••',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Divider(),
                const SizedBox(height: 12),

                // Address Section
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.deliveryAddress);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                        SizedBox(height: 12),
                        (Constant.userLocalDataSource.userData?.userAddresses ??
                                    [])
                                .isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Constant.userLocalDataSource.userData
                                            ?.userAddresses!.first.cityName ??
                                        "",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    Constant.userLocalDataSource.userData
                                            ?.userAddresses!.first
                                            .getShippingAddress() ??
                                        "",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ],
                              )
                            : Text("")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (_) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: 32,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Log Out?",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                        "You’ll be signed out and can log back in anytime."),
                                    const SizedBox(height: 12),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        child: const Text(
                                          'Stay Sign In',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          AuthCubit authCubit =
                                              context.read<AuthCubit>();
                                          authCubit.logout();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        child: const Text(
                                          'Log Out',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.logout),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Log out",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.settings);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Settings',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildMenuItem(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 0.5,
      indent: 16,
      endIndent: 16,
      color: Color(0xFFE0E0E0),
    );
  }
}
