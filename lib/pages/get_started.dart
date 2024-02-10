import 'package:furever/pages/home.dart';
import 'package:furever/utils/layouts.dart';
import 'package:furever/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Styles.primaryBGColor,
      child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 700),
          builder: (context, value, _) {
            return Column(
              children: [
                Opacity(
                  opacity: value,
                  child: SizedBox(
                      width: double.infinity,
                      height: Layouts.getSize(context).height * 0.65,
                      child: SvgPicture.asset(
                        'assets/svg/starter_header.svg',
                        fit: BoxFit.cover,
                      )),
                ),
                const Gap(30),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  child: Text('Re-Home and\nPet Care',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Styles.highlightColor,
                        fontSize: value * 26,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ).apply(fontWeightDelta: 2)),
                ),
                const Gap(30),
                Text(
                  'Just Fur it...',
                  textScaleFactor: value,
                  style: TextStyle(color: Styles.bgWithOpacityColor),
                ),
                const Gap(30),
                Opacity(
                  opacity: value,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Home()));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                    ),
                    child: const Text('Get Furred',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                  ),
                )
              ],
            );
          }),
    );
  }
}
