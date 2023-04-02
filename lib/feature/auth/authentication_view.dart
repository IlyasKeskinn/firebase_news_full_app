import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_news_full_app/auth/keys.dart';
import 'package:firebase_news_full_app/feature/auth/authentication_provider.dart';
import 'package:firebase_news_full_app/feature/home/home_view.dart';
import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:firebase_news_full_app/product/constants/string_constants.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
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
    final user = FirebaseAuth.instance.currentUser;
    checkUser(user);
  }

  late final User? kullanici;
  void checkUser(User? user) {
    ref.read(authenticationProvider.notifier).fetchUserDetail(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeView();
          } else {}
          return FirebaseUIActions(
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                checkUser(state.user);
                if (ref.watch(authenticationProvider).isRedirect ?? false) {}
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
                    LoginView(
                      action: AuthAction.signIn,
                      providers: FirebaseUIAuth.providersFor(
                        FirebaseAuth.instance.app,
                      ),
                    ),
                    or_divider(context),
                    OAuthProviderButton(
                      action: AuthAction.signIn,
                      provider: GoogleProvider(
                        clientId: Keys.client_id,
                        redirectUri: Keys.redirecet_uri,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Padding or_divider(BuildContext context) {
  return Padding(
    padding: context.verticalPaddingLow,
    child: Row(
      children: const [
        Expanded(
          child: Divider(
            thickness: 2,
          ),
        ),
        Text('or'),
        Expanded(
          child: Divider(
            thickness: 2,
          ),
        ),
      ],
    ),
  );
}
