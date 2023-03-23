import 'package:firebase_news_full_app/enums/image_constants.dart';
import 'package:firebase_news_full_app/feature/home/home_view.dart';
import 'package:firebase_news_full_app/feature/splash/splash_provider.dart';
import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:firebase_news_full_app/product/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  final splashProvider =
      StateNotifierProvider<SplashNotifier, SplashState>((ref) {
    return SplashNotifier();
  });

  @override
  void initState() {
    super.initState();
    ref.read(splashProvider.notifier).checkApplicationVersion(''.version);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashProvider, (previous, next) {
      if (next.isRequiredForcuUpdate ?? false) {
        showAboutDialog(context: context);
        return;
      }
      if (next.isRedirectHome != null) {
        if (next.isRedirectHome!) {
          context.navigateToPage(const HomeView());
        } else {
          //false
        }
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconConstants.app_icon.toImage,
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                StringConstants.appName,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: ColorConst.titleActive,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
