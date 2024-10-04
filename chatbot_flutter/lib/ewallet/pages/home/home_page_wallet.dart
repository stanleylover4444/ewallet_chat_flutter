import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:chatbot_flutter/ewallet/widgets/home/action_and_balance_card.dart';
import 'package:chatbot_flutter/ewallet/widgets/home/balance_bar.dart';
import 'package:chatbot_flutter/ewallet/widgets/home/icon_img_button.dart';
import 'package:chatbot_flutter/ewallet/widgets/home/notification_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';





class HomePageWallet extends StatefulWidget {
  const HomePageWallet({super.key});

  @override
  State<HomePageWallet> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePageWallet> {
  late double minExtent;
  late double maxExtent;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    minExtent = kToolbarHeight + MediaQuery.paddingOf(context).top;

    // Use kIsWeb for web support
    if (kIsWeb) {
      maxExtent = 256; // Default value for web
    } else if (Platform.isAndroid) {
      maxExtent = 216;
    } else {
      maxExtent = 256;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: AppBarScrollHandler(
        minExtent: minExtent,
        maxExtent: maxExtent,
        controller: scrollController,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                minExtent: minExtent,
                maxExtent: maxExtent,
              ),
            ),
            SliverList.list(
              children: List<Widget>.generate(
                20,
                (int index) => Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 16),
                    child: Text(index.toString()),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const SliverAppBarDelegate({
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  final double minExtent;

  @override
  final double maxExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return minExtent != oldDelegate.minExtent ||
        maxExtent != oldDelegate.maxExtent;
  }

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  double get deltaExtent => maxExtent - minExtent;

  static const imgBgr = Image(
      image: AssetImage('assets/images/header_bgr.webp'), fit: BoxFit.cover);

  double transform(double begin, double end, double t, [double x = 1]) {
    return Tween<double>(begin: begin, end: end)
        .transform(x == 1 ? t : min(1.0, t * x));
  }

  Color transformColor(Color? begin, Color? end, double t, [double x = 1]) {
    return ColorTween(begin: begin, end: end)
            .transform(x == 1 ? t : min(1.0, t * x)) ??
        Colors.transparent;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final currentExtent = max(minExtent, maxExtent - shrinkOffset);
    // 0.0 -> Expanded
    // 1.0 -> Collapsed
    double t =
        clampDouble(1.0 - (currentExtent - minExtent) / deltaExtent, 0, 1);
    // CollapsingNotification(t).dispatch(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final List<Widget> children = <Widget>[];
            final splashColoredBox =
                ColoredBox(color: transformColor(null, Colors.white, t, 3));

            double imgBgrHeight = maxExtent;

            // Background image
            if (constraints.maxHeight > imgBgrHeight)
              imgBgrHeight = constraints.maxHeight;
            children
              ..add(Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: imgBgrHeight - deltaExtent / 2,
                child: imgBgr,
              ))

              // Splash transform color bottom
              ..add(Positioned(
                bottom: 0,
                width: constraints.maxWidth,
                height: deltaExtent,
                child: splashColoredBox,
              ));

            // Card
            const double cardPadding = 8;
            const double cardMarginHorizontal = 16;
            children
              ..add(
                Positioned(
                  left: cardMarginHorizontal,
                  right: cardMarginHorizontal,
                  bottom: 0,
                  height: deltaExtent,
                  child: ActionAndOverviewInfoCard(
                    contentPadding: const EdgeInsets.all(cardPadding),
                    borderRadius: BorderRadius.circular(transform(12, 0, t, 2)),
                  ),
                ),
              )

              // Background image Clipped
              ..add(Positioned(
                top: 0,
                height: imgBgrHeight - deltaExtent / 2,
                width: constraints.maxWidth,
                child: ClipRect(
                  clipper: RectClipper(minExtent),
                  child: imgBgr,
                ),
              ))

              // Splash transform color top
              ..add(Positioned(
                top: 0,
                height: minExtent,
                width: constraints.maxWidth,
                child: splashColoredBox,
              ));

            // App bar
            const appBarPadding = SizedBox(width: 8);
            final appBarContentWidth =
                constraints.maxWidth - (appBarPadding.width! * 2);
            const totalIconImgButtonSize = IconImgButton.tapTargetSize * 7;
            final appBarSpace = SizedBox(
                width: (appBarContentWidth - totalIconImgButtonSize) / 6);

            //App bar fixed position
            Color iconBgrColor = transformColor(Colors.black54, null, t, 4);
            children.add(Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Container(
                height: minExtent,
                color: transformColor(null,  Colors.black, t, 2),
                child: SafeArea(
                  bottom: false,
                  child: Row(
                    children: [
                      appBarPadding,
                      SearchArea(
                        appBarContentWidth: appBarContentWidth,
                        appBarSpace: appBarSpace,
                        iconBgrColor: iconBgrColor,
                      ),
                      appBarSpace,
                      const Spacer(),
                      appBarSpace,
                      IconImgButton(
                        'notifications_bell.webp',
                        backgroundColor: iconBgrColor,
                      ),
                      appBarSpace,
                      IconImgButton(
                        'chat_comment.webp',
                        backgroundColor: iconBgrColor,
                      ),
                      appBarPadding,
                    ],
                  ),
                ),
              ),
            ));

            // App bar transform position
            iconBgrColor = transformColor( Colors.black, null, t, 2);
            final iconSize = transform(44, 32, t, 2);
            final iconPadding = transform(8, 4, t, 2);
            final double cardWidth =
                constraints.maxWidth - (cardMarginHorizontal * 2);
            final cardSpace =
                (cardWidth - (IconImgButton.tapTargetSize * 4)) / 5;

            children.add(Positioned(
              left: transform(
                cardSpace + cardPadding,
                appBarPadding.width! +
                    IconImgButton.tapTargetSize +
                    appBarSpace.width!,
                t,
                2,
              ),
              right: transform(
                cardSpace + cardPadding,
                appBarPadding.width! +
                    IconImgButton.tapTargetSize * 2 +
                    appBarSpace.width! * 2,
                t,
                2,
              ),
              top: constraints.maxHeight > maxExtent
                  ? null
                  : transform(minExtent + cardPadding,
                      minExtent - IconImgButton.tapTargetSize - 4, t, 2),
              bottom: constraints.maxHeight < maxExtent
                  ? null
                  : deltaExtent - IconImgButton.tapTargetSize - cardPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconImgButton(
                    'momomain_money_in.webp',
                    size: iconSize,
                    padding: iconPadding,
                    backgroundRadius: 16,
                    backgroundColor: iconBgrColor,
                  ),
                  IconImgButton(
                    'momomain_withdraw.webp',
                    size: iconSize,
                    padding: iconPadding,
                    backgroundRadius: 16,
                    backgroundColor: iconBgrColor,
                  ),
                  IconImgButton(
                    'navigation_qrcode.webp',
                    size: iconSize,
                    padding: iconPadding,
                    backgroundRadius: 16,
                    backgroundColor: iconBgrColor,
                  ),
                  IconImgButton(
                    'home_wallet_inactive.webp',
                    size: iconSize,
                    padding: iconPadding,
                    backgroundRadius: 16,
                    backgroundColor: iconBgrColor,
                  ),
                ],
              ),
            ));

            return Stack(children: children);
          },
        ),
        Positioned(
          top: minExtent,
          left: 0,
          right: 0,
          child: FloatingBalanceBar(isShowWhen: t == 1),
        ),
      ],
    );
  }
}

class SearchArea extends StatelessWidget {
  const SearchArea({
    super.key,
    required this.appBarContentWidth,
    required this.appBarSpace,
    required this.iconBgrColor,
  });

  final double appBarContentWidth;
  final SizedBox appBarSpace;
  final Color iconBgrColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: appBarContentWidth -
              IconImgButton.tapTargetSize * 2 -
              appBarSpace.width! * 3 -
              4,
          height: 32,
          margin: const EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            color: iconBgrColor,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const IconImgButton(
          'search.webp',
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}

class FloatingBalanceBar extends StatelessWidget {
  const FloatingBalanceBar({
    super.key,
    required this.isShowWhen,
  });

  final bool isShowWhen;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isShowWhen
          ? BalanceBar(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 8),
                    blurRadius: 20,
                    spreadRadius: -2,
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

class RectClipper extends CustomClipper<Rect> {
  final double maxHeight;

  RectClipper(this.maxHeight);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width, maxHeight);
  }

  @override
  bool shouldReclip(RectClipper oldClipper) =>
      oldClipper.maxHeight != maxHeight;
}
