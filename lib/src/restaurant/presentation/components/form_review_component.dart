import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:restaurant_app/resources/widgets/common_button.dart';
import 'package:restaurant_app/resources/widgets/common_textformfield.dart';

class FormReviewComponent extends StatelessWidget {
  const FormReviewComponent({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.45,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Your Review',
            style: StyleTypograph.heading3.bold,
          ),
          Gap(20),
          CommonTextForm(
            controller: controller,
            obscured: false,
            hint: 'Your name',
          ),
          Gap(12),
          CommonTextForm(
            controller: controller,
            obscured: false,
            hint: 'Message review',
          ),
          Spacer(),
          Container(
            child: CommonButton.normalButton(
              onPressed: () {},
              text: 'Submit',
            ),
          )
        ],
      ),
    );
  }
}
