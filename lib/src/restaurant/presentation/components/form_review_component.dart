import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/src/restaurant/presentation/bloc/restaurant/restaurant_bloc.dart';
import 'package:restaurant_app/resources/widgets/common_snackbar.dart';
import 'package:restaurant_app/resources/widgets/common_textformfield.dart';
import 'package:restaurant_app/resources/widgets/common_button.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:gap/gap.dart';

class FormReviewComponent extends HookWidget {
  const FormReviewComponent({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final nameInput = useTextEditingController();
    final reviewInput = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    bool isSubmitDisabled = nameInput.text.isEmpty || reviewInput.text.isEmpty;

    useEffect(() {
      final subscription =
          context.read<RestaurantBloc>().stream.listen((state) {
        if (state is ReviewSuccessState) {
          CommonSnackbar.showSuccessSnackbar(
            context: context,
            title: 'Success',
            message: 'Successfully adding review',
          );
          context.pop(); // Kembali ke halaman sebelumnya
        }
      });
      // Membersihkan langganan saat komponen di-unmount
      return subscription.cancel;
    }, []);

    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Your Review',
              style: StyleTypograph.heading3.bold,
            ),
            const Gap(20),
            CommonTextForm(
              controller: nameInput,
              obscured: false,
              hint: 'Your name',
            ),
            const Gap(12),
            CommonTextForm(
              controller: reviewInput,
              obscured: false,
              hint: 'Message review',
            ),
            Spacer(),
            Container(
              child: CommonButton.normalButton(
                disabled: isSubmitDisabled,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<RestaurantBloc>().add(
                          AddReviewEvent(
                            id: id,
                            name: nameInput.text,
                            review: reviewInput.text,
                          ),
                        );
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
