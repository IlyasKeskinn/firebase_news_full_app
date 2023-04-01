import 'package:firebase_news_full_app/enums/image_constants.dart';
import 'package:firebase_news_full_app/feature/home/home_provider.dart';
import 'package:firebase_news_full_app/product/constants/string_constants.dart';
import 'package:firebase_news_full_app/product/widget/news_widget/news_tile/news_tile.dart';
import 'package:firebase_news_full_app/product/widget/text/heading_text.dart';
import 'package:firebase_news_full_app/product/widget/text/sub_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

final _homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider();
});

class Profile_View extends ConsumerStatefulWidget {
  const Profile_View({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Profile_ViewState();
}

class _Profile_ViewState extends ConsumerState<Profile_View> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(_homeProvider.notifier).fetchingLoad(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText(value: StringConstants.profile),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: context.paddingNormal,
            child: Column(
              children: [
                const ProfileImage_FollowsInfo(),
                const Biography(),
                const Buttons(),
                Padding(
                  padding: context.onlyTopPaddingMedium,
                  child: Column(
                    children: [
                      const HeadingText(value: StringConstants.profileNews),
                      _emptyLowSizedBox(context),
                      const _NewsView(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(StringConstants.profileEdit),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(StringConstants.profileWebsite),
            ),
          )
        ],
      ),
    );
  }
}

class Biography extends StatelessWidget {
  const Biography({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingText(value: 'İlyas Keskin'),
          _emptyLowSizedBox(context),
          const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          ),
        ],
      ),
    );
  }
}

class ProfileImage_FollowsInfo extends StatelessWidget {
  const ProfileImage_FollowsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              ImageConstants.avatarPhoto.toJpg,
              height: 90,
              width: 90,
            ),
          ),
        ),
        const _FollowsWidget(
          number: 2156,
          name: StringConstants.profileFollowers,
        ),
        const _FollowsWidget(
          number: 567,
          name: StringConstants.profileFollowing,
        ),
        const _FollowsWidget(
          number: 23,
          name: StringConstants.profileTotalNews,
        ),
      ],
    );
  }
}

class _FollowsWidget extends StatelessWidget {
  const _FollowsWidget({
    required this.number,
    required this.name,
  });
  final int number;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [HeadingText(value: '$number'), SubTitleText(value: name)],
    );
  }
}

SizedBox _emptyLowSizedBox(BuildContext context) {
  return SizedBox(
    child: context.emptySizedHeightBoxLow,
  );
}

class _NewsView extends ConsumerWidget {
  const _NewsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final latestNewsItem = ref.watch(_homeProvider).news;
    return SizedBox(
      height: context.dynamicHeight(0.6),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: latestNewsItem?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.onlyTopPaddingNormal,
            child: NewsTile(newsItem: latestNewsItem?[index]),
          );
        },
      ),
    );
  }
}
