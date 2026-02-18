import 'package:flutter/material.dart';
import 'package:rep_count/theme/themes.dart';

class ProfileListItemWidget extends StatelessWidget {
  const ProfileListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 8.0,
        top: 8.0,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        horizontalTitleGap: 18.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        leading: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: Theme.of(context).primaryColor
          ),
          child: Theme(
              data: lightIconTheme,
              child: Icon(Icons.directions_run)
          ),
        ),
        title: Text(
          "Title",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
        ),
        subtitle: Text(
          "3 Set 30 sec",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
        ),
        trailing: IconButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
          icon: Icon(Icons.share_rounded),
        ),
      ),
    );
  }
}
