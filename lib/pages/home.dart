import 'package:furever/pages/grooming_page.dart';
import 'package:furever/pages/vet_page.dart';
import 'package:furever/utils/layouts.dart';
import 'package:furever/utils/styles.dart';
import 'package:furever/widgets/animated_title.dart';
import 'package:furever/widgets/pet_card.dart';
import 'package:furever/widgets/stories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Scaffold(
      backgroundColor: Styles.primaryBGColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        children: [
          TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 800),
              builder: (context, value, _) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  height: 50,
                  width: value * size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Styles.primaryColor),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/Search.svg',
                        height: value * 20,
                        color: Styles.primaryTextColor,
                        width: value * 20,
                      ),
                      const Gap(10),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: value,
                        child: Text(
                          value < 0.5 ? '' : 'Search',
                          style: TextStyle(color: Styles.primaryTextColor),
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/svg/scanner.svg',
                        height: 20,
                        color: Styles.primaryTextColor,
                        width: 20,
                      ),
                    ],
                  ),
                );
              }),
          const Gap(25),
          const AnimatedTitle(title: 'Stories'),
          const Gap(10),
          const StoriesSection(),
          const Gap(25),
          const AnimatedTitle(title: 'Who are you looking for?'),
          const Gap(10),
          Row(
            children: [
              PetCard(
                petPath: 'assets/nav_icons/cut_icon.svg',
                height: 68,
                petName: 'Grooming',
                onEnter: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const GroomingPage()));
                },
              ),
              const Gap(25),
              PetCard(
                petPath: 'assets/nav_icons/vet_icon.svg',
                petName: 'Health Care',
                height: 68,
                onEnter: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const VetPage()));
                },
              ),
            ],
          ),
          const Gap(25),
          const AnimatedTitle(title: 'Community'),
          const Gap(10),
          TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, _) {
                return Stack(
                  children: [
                    Container(
                      height: 150,
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          Container(
                            height: 135,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Styles.primaryColor,
                                borderRadius: BorderRadius.circular(27)),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(
                                right: 12,
                                left: Layouts.getSize(context).width * 0.37,
                                top: 15,
                                bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Join our\ncommunity',
                                  style: TextStyle(
                                      fontSize: value * 27,
                                      fontWeight: FontWeight.bold,
                                      color: Styles.primaryTextColor,
                                      height: 1),
                                ),
                                const Gap(12),
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 1500),
                                  opacity: value,
                                  child: Text(
                                    'Share your pet moments with other pet parents.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Styles.primaryTextColor,
                                        fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            right: value * 12,
                            top: value * 12,
                            child: CircleAvatar(
                                radius: 16,
                                backgroundColor: Styles.highlightColor,
                                child: SvgPicture.asset(
                                  'assets/svg/arrow_right.svg',
                                  color: Styles.primaryColor,
                                  height: value * 14,
                                  width: value * 14,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 12,
                      bottom: 0,
                      child: SvgPicture.asset(
                        'assets/svg/person.svg',
                        height: value * 150,
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
