import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realsocial/app_router.gr.dart';
import 'package:realsocial/constants.dart';

import '../controllers/auth_controller.dart';
import '../widgets/buttons.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Center(
          child: Button(
            width: 120,
            text: "Google Login",
            onTap: () async {
              Constants.loggerd("logging in....");
              // AutoRouter.of(context).push(AppRoute());

              await authController.signInWithGoogle().then((v) {
                if (v == true) {
                  // ignore: use_build_context_synchronously
                  AutoRouter.of(context).push(AppRoute());
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
