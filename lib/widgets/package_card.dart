import 'package:furever/models/package.dart';
import 'package:furever/pages/vet_page.dart';
import 'package:furever/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furever/widgets/bottom_sheet.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class PackageCard extends StatelessWidget {
  final Data package;
  const PackageCard(this.package, {Key? key}) : super(key: key);

  String getOpeningDate(String curDate, OpeningHours hrs) {
    switch (curDate) {
      case "monday":
        return hrs.monday!;
      case "tuesday":
        return hrs.tuesday!;
      case "wednesday":
        return hrs.wednesday!;
      case "thursday":
        return hrs.thursday!;
      case "friday":
        return hrs.friday!;
      default:
        return "Closed";
    }
  }

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('EEEE').format(DateTime.now()).toLowerCase();

    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const VetPage())),
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
              color: Styles.bgColor, borderRadius: BorderRadius.circular(15)),
          padding:
              const EdgeInsets.only(left: 22, right: 12, top: 14, bottom: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    package.salonName!,
                    style: TextStyle(
                        color: Styles.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Text(
                    'Total ${package.services!.length} Services',
                    style: TextStyle(
                        color: Styles.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        height: 1.5),
                  ),
                  const Gap(20),
                  Text(
                    getOpeningDate(day, package.openingHours!),
                    style: TextStyle(
                        color: Styles.teritaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const Gap(20),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(10),
                  ElevatedButton(
                    onPressed: () =>
                        custBottomSheet(context, package.services!),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Styles.primaryBGColor,
                      fixedSize: const Size(90, 0),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Services',
                            style: TextStyle(
                                color: Styles.bgColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                        const Gap(5),
                        SvgPicture.asset(
                          'assets/svg/arrow_down2.svg',
                          color: Styles.bgColor,
                          height: 7,
                          width: 7,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
