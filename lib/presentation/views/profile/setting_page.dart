import 'package:dentalities/core/util/appversion.dart';
import 'package:dentalities/presentation/blocs/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dentalities/generated/l10n.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map?;

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 0, vertical: 16),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       showModalBottomSheet(
                    //         context: context,
                    //         shape: const RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.vertical(
                    //               top: Radius.circular(20)),
                    //         ),
                    //         builder: (_) {
                    //           return StatefulBuilder(
                    //             builder: (context, setState) {
                    //               return Padding(
                    //                 padding: const EdgeInsets.all(16),
                    //                 child: Column(
                    //                   mainAxisSize: MainAxisSize.min,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     GestureDetector(
                    //                       onTap: () {
                    //                         Navigator.pop(context);
                    //                       },
                    //                       child: Icon(
                    //                         Icons.close,
                    //                         size: 32,
                    //                       ),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 10,
                    //                     ),
                    //                     const Text(
                    //                       "Log Out?",
                    //                       style: TextStyle(
                    //                           fontSize: 18,
                    //                           fontWeight: FontWeight.bold),
                    //                     ),
                    //                     const SizedBox(height: 12),
                    //                     Text(
                    //                         "You’ll be signed out and can log back in anytime."),
                    //                     const SizedBox(height: 12),
                    //                     SizedBox(
                    //                       width: double.infinity,
                    //                       child: ElevatedButton(
                    //                         onPressed: () {
                    //                           Navigator.pop(context);
                    //                         },
                    //                         style: ElevatedButton.styleFrom(
                    //                           backgroundColor: Colors.blue,
                    //                           padding:
                    //                               const EdgeInsets.symmetric(
                    //                                   vertical: 8),
                    //                           shape: RoundedRectangleBorder(
                    //                             borderRadius:
                    //                                 BorderRadius.circular(30),
                    //                           ),
                    //                         ),
                    //                         child: const Text(
                    //                           'Stay Sign In',
                    //                           style: TextStyle(
                    //                               fontSize: 16,
                    //                               color: Colors.white,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     const SizedBox(height: 12),
                    //                     SizedBox(
                    //                       width: double.infinity,
                    //                       child: ElevatedButton(
                    //                         onPressed: () {
                    //                           Navigator.pop(context);
                    //                           AuthCubit authCubit =
                    //                               context.read<AuthCubit>();
                    //                           authCubit.logout();
                    //                           Navigator.pop(context);
                    //                         },
                    //                         style: ElevatedButton.styleFrom(
                    //                           backgroundColor: Colors.white,
                    //                           padding:
                    //                               const EdgeInsets.symmetric(
                    //                                   vertical: 8),
                    //                           shape: RoundedRectangleBorder(
                    //                             borderRadius:
                    //                                 BorderRadius.circular(30),
                    //                           ),
                    //                         ),
                    //                         child: const Text(
                    //                           'Log Out',
                    //                           style: TextStyle(
                    //                               fontSize: 16,
                    //                               color: Colors.blue,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               );
                    //             },
                    //           );
                    //         },
                    //       );
                    //     },
                    //     child: Row(
                    //       children: [
                    //         const Icon(Icons.logout),
                    //         SizedBox(
                    //           width: 16,
                    //         ),
                    //         Text("Log out")
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 16),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            builder: (_) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          "Delete your account?",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                            "Deleting will deactivate your account and remove your data. You can still request restoration by contacting our customer service."),
                                        const SizedBox(height: 12),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            child: const Text(
                                              'Delete account',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
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
                            SvgPicture.asset(
                              "assets/icons/account-delete.svg",
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text("Delete account",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Text("Version ${AppVersion.version}+${AppVersion.buildNumber}"),
          ),
        ],
      ),
    );
  }
}
