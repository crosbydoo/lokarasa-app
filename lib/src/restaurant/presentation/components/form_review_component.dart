import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:restaurant_app/resources/widgets/common_button.dart';
import 'package:restaurant_app/resources/widgets/common_snackbar.dart';
import 'package:restaurant_app/resources/widgets/common_textformfield.dart';
import 'package:restaurant_app/src/restaurant/presentation/bloc/restaurant/restaurant_bloc.dart';

class FormReviewComponent extends StatefulWidget {
  const FormReviewComponent({super.key, required this.id});

  final String id;

  @override
  State<FormReviewComponent> createState() => _FormReviewComponentState();
}

class _FormReviewComponentState extends State<FormReviewComponent> {
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController reviewInput = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late RestaurantBloc bloc;

  @override
  void initState() {
    bloc = RestaurantBloc(
      detailUsecase: GetIt.instance(),
      usecase: GetIt.instance(),
      reviewUsecase: GetIt.instance(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.45,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Your Review',
              style: StyleTypograph.heading3.bold,
            ),
            Gap(20),
            CommonTextForm(
              controller: nameInput,
              obscured: false,
              hint: 'Your name',
            ),
            Gap(12),
            CommonTextForm(
              controller: reviewInput,
              obscured: false,
              hint: 'Add Review',
            ),
            Spacer(),
            Container(
              child: CommonButton.normalButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() == true) {
                    bloc.add(
                      AddReviewEvent(
                        id: widget.id,
                        name: nameInput.text,
                        review: reviewInput.text,
                      ),
                    );
                    CommonSnackbar.showSuccessSnackbar(
                      context: context,
                      title: 'Success',
                      message: 'Successfully adding review',
                    );

                    context.pop(true);
                  }
                },
                text: 'Submit',
              ),
            )
          ],
        ),
      ),
    );
  }
}
