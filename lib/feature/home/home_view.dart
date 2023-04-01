import 'package:firebase_news_full_app/enums/image_constants.dart';
import 'package:firebase_news_full_app/feature/add_news/add_news_view.dart';
import 'package:firebase_news_full_app/feature/home/home_provider.dart';
import 'package:firebase_news_full_app/feature/home/sub_view.dart/home_search_delegate.dart';
import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:firebase_news_full_app/product/constants/string_constants.dart';
import 'package:firebase_news_full_app/product/widget/chip/custom_chip.dart';
import 'package:firebase_news_full_app/product/widget/news_widget/news_card/news_card.dart';
import 'package:firebase_news_full_app/product/widget/news_widget/news_tile/news_tile.dart';
import 'package:firebase_news_full_app/product/widget/text/sub_title_text.dart';
import 'package:firebase_news_full_app/product/widget/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

final _homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider();
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
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
      body: Padding(
        padding: context.horizontalPaddingNormal,
        child: Stack(
          children: [
            ListView(
              children: const [
                _LogoArea(),
                _SearchTextField(),
                _TrendHeader(),
                _TrendNews(),
                _LatestHeader(),
                _TagListView(),
                _LatestListView()
              ],
            ),
            if (ref.watch(_homeProvider).isLoading ?? false)
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await context
              .navigateToPage<bool>(const AddNewsView(), type: SlideType.LEFT);
          if (response ?? false) {
            await ref.read(_homeProvider.notifier).fetchingLoad();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _SearchTextField extends ConsumerWidget {
  const _SearchTextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: context.onlyTopPaddingLow,
      child: TextField(
        onTap: () {
          showSearch(
            context: context,
            delegate: HomeSearchDelegate(
              ref.watch(_homeProvider.notifier).newsList,
            ),
          );
        },
        maxLength: 50,
        decoration: const InputDecoration(
          counterText: '',
          prefixIcon: Icon(
            Icons.search_outlined,
            color: ColorConst.titleActive,
          ),
          suffixIcon: Icon(
            Icons.filter_list_outlined,
            color: ColorConst.titleActive,
          ),
          hintText: StringConstants.homeSearch,
        ),
      ),
    );
  }
}

class _LogoArea extends StatelessWidget {
  const _LogoArea();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            IconConstants.app_icon.toPng,
            fit: BoxFit.contain,
            height: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
    );
  }
}

class _TrendHeader extends StatelessWidget {
  const _TrendHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          TitleText(value: StringConstants.homeTrend),
          SubTitleText(value: StringConstants.homeSeeAll)
        ],
      ),
    );
  }
}

class _TrendNews extends ConsumerWidget {
  const _TrendNews();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsItem = ref.watch(_homeProvider).news;
    return Padding(
      padding: context.onlyTopPaddingNormal,
      child: SizedBox(
        height: context.dynamicHeight(0.4),
        width: 400,
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: newsItem?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.onlyRightPaddingNormal,
              child: NewsCard(
                news: newsItem?[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _LatestHeader extends StatelessWidget {
  const _LatestHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          TitleText(value: StringConstants.homeLatest),
          SubTitleText(value: StringConstants.homeSeeAll)
        ],
      ),
    );
  }
}

class _TagListView extends ConsumerWidget {
  const _TagListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryItems = ref.watch(_homeProvider).category;
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryItems?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: context.onlyRightPaddingLow,
            child: CustomChip(
              categoryItems: categoryItems?[index],
            ),
          );
        },
      ),
    );
  }
}

class _LatestListView extends ConsumerWidget {
  const _LatestListView();

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
