import 'package:flutter/material.dart';
import 'package:rep_count/components/widget/text_form_field_widget.dart';

class CounterProfileScreen extends StatelessWidget {
  const CounterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text("Counter Profile")),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name"),
              TextFormFieldWidget(
                controller: TextEditingController(),
                hintText: "Enter name",
                keyboardType: TextInputType.text,
                focusNode: FocusNode(),
                maxLength: 20,
                onChanged: (value) {},
                onEditingComplete: () {},
                textInputAction: TextInputAction.next,
                autoValidateMode: AutovalidateMode.onUserInteraction,
              ),

              SizedBox(height: 12.0),

              Text("Set Count"),
              TextFormFieldWidget(
                controller: TextEditingController(),
                hintText: "No Of Set",
                keyboardType: TextInputType.number,
                focusNode: FocusNode(),
                maxLength: 20,
                onChanged: (value) {},
                onEditingComplete: () {},
                textInputAction: TextInputAction.next,
                autoValidateMode: AutovalidateMode.onUserInteraction,
              ),

              SizedBox(height: 12.0),

              Text("Reps Count"),
              TextFormFieldWidget(
                controller: TextEditingController(),
                hintText: "No Of Reps",
                keyboardType: TextInputType.number,
                focusNode: FocusNode(),
                maxLength: 20,
                onChanged: (value) {},
                onEditingComplete: () {},
                textInputAction: TextInputAction.next,
                autoValidateMode: AutovalidateMode.onUserInteraction,
              ),

              SizedBox(height: 12.0),

              Text("Count Duration"),
              TextFormFieldWidget(
                controller: TextEditingController(),
                hintText: "Counting Duration",
                keyboardType: TextInputType.number,
                focusNode: FocusNode(),
                maxLength: 20,
                onChanged: (value) {},
                onEditingComplete: () {},
                textInputAction: TextInputAction.next,
                autoValidateMode: AutovalidateMode.onUserInteraction,
              ),

              SizedBox(height: 12.0),

              Text("Break Duration For Each Set"),
              TextFormFieldWidget(
                controller: TextEditingController(),
                hintText: "Break Duration",
                keyboardType: TextInputType.number,
                focusNode: FocusNode(),
                maxLength: 20,
                onChanged: (value) {},
                onEditingComplete: () {},
                textInputAction: TextInputAction.done,
                autoValidateMode: AutovalidateMode.onUserInteraction,
              ),

              SizedBox(height: 12.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 0.5)
                  ),
                ),
              ),
              SizedBox(height: 12.0),

              ElevatedButton(
                onPressed: () {},
                child: SizedBox(
                  width: double.maxFinite,
                  child: Text("SAVE", textAlign: TextAlign.center),
                ),
              ),
              SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
    );
  }
}
