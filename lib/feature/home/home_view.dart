import 'package:firebase_news_full_app/enums/image_constants.dart';
import 'package:firebase_news_full_app/product/constants/color_constants.dart';
import 'package:firebase_news_full_app/product/constants/string_constants.dart';
import 'package:firebase_news_full_app/product/widget/chip/active_chip.dart';
import 'package:firebase_news_full_app/product/widget/chip/passive_chip.dart';
import 'package:firebase_news_full_app/product/widget/news_widget/news_card/news_card.dart';
import 'package:firebase_news_full_app/product/widget/news_widget/news_tile/news_tile.dart';
import 'package:firebase_news_full_app/product/widget/text/sub_title_text.dart';
import 'package:firebase_news_full_app/product/widget/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.horizontalPaddingNormal,
        child: ListView(
          children: [
            const _LogoArea(),
            Padding(
              padding: context.onlyTopPaddingLow,
              child: const TextField(
                maxLength: 50,
                decoration: InputDecoration(
                  counterText: '',
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: ColorConst.titleActive,
                  ),
                  suffixIcon: Icon(
                    Icons.filter_list_outlined,
                    color: ColorConst.titleActive,
                  ),
                  border: OutlineInputBorder(),
                  hintText: StringConstants.homeSearch,
                ),
              ),
            ),
            const _TrendHeader(),
            const _TrendNews(),
            const _LatestHeader(),
            const _TagListView(),
            const _LatestListView()
          ],
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

class _TrendNews extends StatelessWidget {
  const _TrendNews();
  final String dummyShipImage =
      'https://firebasestorage.googleapis.com/v0/b/news-app-e4ef6.appspot.com/o/news_ship.png?alt=media&token=c1d44a9c-cc84-407d-884c-39ad197670a5';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingNormal,
      child: NewsCard(image: dummyShipImage),
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

class _TagListView extends StatelessWidget {
  const _TagListView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: context.onlyRightPaddingLow,
              child: const ActiveChip(text: 'All'),
            );
          } else {
            return Padding(
              padding: context.onlyRightPaddingLow,
              child: const PassiveChip(text: 'Sports'),
            );
          }
        },
      ),
    );
  }
}

class _LatestListView extends StatelessWidget {
  const _LatestListView();
  final String dummyImage =
      'https://firebasestorage.googleapis.com/v0/b/news-app-e4ef6.appspot.com/o/news_wed.png?alt=media&token=9fea0584-9488-4eeb-a1c7-256645ed8840';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.4),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.onlyTopPaddingNormal,
            child: NewsTile(image: dummyImage),
          );
        },
      ),
    );
  }
}
