import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furever/models/package.dart';
import 'package:furever/utils/layouts.dart';
import 'package:furever/utils/styles.dart';
import 'package:furever/widgets/back_button.dart';
import 'package:furever/widgets/package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class GroomingPage extends StatefulWidget {
  const GroomingPage({Key? key}) : super(key: key);

  @override
  State<GroomingPage> createState() => _GroomingPageState();
}

class _GroomingPageState extends State<GroomingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryBGColor,
      appBar: AppBar(
        title: Text(
          'Dog Grooming Packages',
          style: TextStyle(
              color: Styles.primaryTextColor,
              fontSize: 25,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: SingleChildScrollView(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collectionGroup('groom').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              return ListView(
                shrinkWrap: true,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  var data = document.data() as Map<String, dynamic>;
                  GroomModel dataModel = GroomModel.fromJson(data);
                  return MediaQuery.removeViewPadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: dataModel.data!.length,
                        itemBuilder: (context, index) =>
                            PackageCard(dataModel.data![index]),
                      ));
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
