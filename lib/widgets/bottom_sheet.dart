import 'package:flutter/material.dart';

import '../utils/styles.dart';

custBottomSheet(context, List<String> lst) async {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Styles.primaryBGColor,
      builder: (BuildContext context) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                dense: true,
                title: Text(
                  lst[index],
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
              );
            });
      });
}
