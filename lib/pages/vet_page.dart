import 'package:furever/models/package_details.dart';
import 'package:furever/utils/styles.dart';
import 'package:furever/widgets/vet_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/base_appbar.dart';

class VetPage extends StatefulWidget {
  const VetPage({Key? key}) : super(key: key);

  @override
  State<VetPage> createState() => _VetPageState();
}

class _VetPageState extends State<VetPage> {
  late ScrollController _controller;
  double headerHeight = 140;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > 0) {
        setState(() {
          headerHeight = 0;
        });
      } else {
        setState(() {
          headerHeight = 140;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    //_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final veterinaryPackage = [
      {
        'title': 'Online Vet(Cat)',
        'sub': null,
        'pet': 'assets/svg/pet_circle.svg',
        'items': [
          'One time consultation',
          'Call & Video Consultancy',
          'Personalized Advice'
        ],
        'price': 149
      },
      {
        'title': 'Online Essential Care',
        'sub': '(220 minutes/month)',
        'pet': null,
        'items': [
          'Chat Consults',
          'Personalized Advice',
          '1 month follow ups',
          'Ticks & Fleas Preventive'
        ],
        'price': 499
      },
      {
        'title': 'Online Essential Care',
        'sub': '(220 minutes/month)',
        'pet': null,
        'items': [
          'Chat Consults',
          'Personalized Advice',
          '1 month follow ups',
          'Ticks & Fleas Preventive'
        ],
        'price': 499
      },
      {
        'title': 'Dog Consultation',
        'sub': null,
        'pet': 'assets/svg/pet_circle2.svg',
        'items': [
          'Nutrition Consultation',
          'Dog Parenting Management',
          'Behavioral Training Tips',
          '(Aggression, Biting, Jumping)'
        ],
        'price': 599
      },
      {
        'title': 'Online Essential Care',
        'sub': '(220 minutes/month)',
        'pet': null,
        'items': [
          'Chat Consults',
          'Personalized Advice',
          '1 month follow ups',
          'Ticks & Fleas Preventive'
        ],
        'price': 499
      },
    ];
    return Scaffold(
      appBar: const BaseAppBar(title: "Pet Veterinary"),
      backgroundColor: Styles.primaryBGColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Expanded(
          child: MediaQuery.removeViewPadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
                shrinkWrap: true,
                controller: _controller,
                itemBuilder: (c, i) {
                  final vp = VeterinaryDetails.fromJson(veterinaryPackage[i]);
                  return VetCard(vp);
                },
                separatorBuilder: (c, i) {
                  return const Gap(12);
                },
                itemCount: veterinaryPackage.length),
          ),
        ),
      ),
    );
  }
}
