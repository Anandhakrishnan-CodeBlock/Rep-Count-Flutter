import 'package:flutter/material.dart';
import 'package:rep_count/components/widget/profile_list_item_widget.dart';
import 'package:rep_count/route/app_route_path_constants.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: 15,
        itemBuilder: (context, index) {
          return ProfileListItemWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RoutePaths.counterProfileRoute);
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}