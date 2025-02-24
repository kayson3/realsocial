import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realsocial/extensions.dart';
import 'package:realsocial/screens/login_screen.dart';
import 'package:realsocial/widgets/inputfield.dart';

import '../controllers/auth_controller.dart';
import '../providers/auth_provider.dart';
import '../providers/wordlist_provider.dart';
import '../widgets/buttons.dart';

@RoutePage()
class AppScreen extends ConsumerWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final words = ref.watch(wordListProvider);

    final textController = TextEditingController();

    return authState.when(
      data: (session) {
        if (session.session == null) {
          return LoginScreen();
        }
        return Scaffold(
          backgroundColor: Colors.deepPurpleAccent,
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    25.verticalGap,
                    Container(
                      height: MediaQuery.sizeOf(context).height / 3,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: words.isNotEmpty
                          ? ListView.builder(
                              itemCount: words.length,
                              itemBuilder: (context, index) =>
                                  ListTile(title: Text(words[index])),
                            )
                          : Center(child: Text("List of words")),
                    ),
                    25.verticalGap,
                    Row(
                      children: [
                        Expanded(
                            child: TextInputField(
                          isdense: true,
                          showhintInlabel: false,
                          controller: textController,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 13),
                          hintText: "Type new words...",
                        )),
                        15.horizontalGap,
                        Button(
                          width: 50,
                          text: "+",
                          onTap: () {
                            if (textController.text.isNotEmpty) {
                              ref
                                  .read(wordListProvider.notifier)
                                  .addWord(textController.text);
                            }
                          },
                        ),
                      ],
                    ),
                    Spacer(),
                    Center(
                      child: Button(
                        width: 150,
                        text: "Logout",
                        color: Colors.red,
                        textColor: Colors.white,
                        onTap: () {
                          ref.read(authControllerProvider).signOut();
                          AutoRouter.of(context).popUntilRoot();
                        },
                      ),
                    ),
                    25.verticalGap,
                  ],
                ),
              ),
            ),
          ),
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text("Error: $e")),
    );
  }
}
