import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_news_full_app/feature/auth/authentication_provider.dart';
import 'package:firebase_news_full_app/feature/home/home_view.dart';
import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:firebase_news_full_app/product/constants/string_constants.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {
  final authenticationProvider =
      StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });

  @override
  void initState() {
    super.initState();
    checkUser(FirebaseAuth.instance.currentUser);
  }

  void checkUser(User? user) {
    ref.read(authenticationProvider.notifier).fetchUserDetail(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FirebaseUIActions(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            checkUser(state.user);
            if (ref.watch(authenticationProvider).isRedirect ?? false) {
              context.navigateToPage(HomeView());
            }
          }),
        ],
        child: Center(
          child: Padding(
            padding: context.paddingMedium,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstants.loginHello,
                  style: context.textTheme.headline2?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorConst.titleActive,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  StringConstants.loginAgain,
                  style: context.textTheme.headline2?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorConst.primary,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  StringConstants.loginMsg,
                ),
                LoginView(
                  showTitle: false,
                  action: AuthAction.signIn,
                  providers: FirebaseUIAuth.providersFor(
                    FirebaseAuth.instance.app,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
