import 'package:flutter/material.dart';
import 'package:furever/utils/styles.dart';
import 'package:gap/gap.dart';

class StoriesSection extends StatefulWidget {
  const StoriesSection({Key? key}) : super(key: key);

  @override
  State<StoriesSection> createState() => _StoriesSectionState();
}

class _StoriesSectionState extends State<StoriesSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    animation = ColorTween(
      begin: Colors.transparent,
      end: Styles.primaryColor,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List storiesList = ['Tuna', 'Jacob', 'Sophie', 'Hachiko', 'Jony'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: storiesList
            .map<Widget>((story) => TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(seconds: 1),
                builder: (context, value, _) {
                  _controller.forward();
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: value * 65,
                          width: value * 65,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: storiesList.indexOf(story) == 4
                                      ? Colors.grey.shade400
                                      : animation.value!,
                                  width: value * 3),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/stories/${(storiesList.indexOf(story) + 1)}.png'),
                                  fit: BoxFit.cover)),
                        ),
                        const Gap(5),
                        Text(
                          story,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Styles.primaryTextColor),
                        )
                      ],
                    ),
                  );
                }))
            .toList(),
      ),
    );
  }
}
