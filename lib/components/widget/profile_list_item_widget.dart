import 'package:flutter/material.dart';

class ProfileListItemWidget extends StatelessWidget{
  const ProfileListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.directions_run, size: 32.0),
      title: Text("Title"),
      subtitle: Text("Set: 3  Duration: 30 sec"),
    );
  }
}