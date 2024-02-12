import 'package:either_dart/either.dart';
import 'package:restaurant_app/core/utils/typedef_util.dart';
import 'package:restaurant_app/src/restaurant/data/remote/requests/add_review_request.dart';
import 'package:restaurant_app/src/restaurant/data/repository/restaurant_repository.dart';

class AddReviewUsecase {
  final RestaurantRepository _repository;

  AddReviewUsecase(this._repository);

  FutureOrError execute(AddReviewRequest addReviewRequest) {
    return _repository.addReview(addReviewRequest).mapRight(
          (response) => response.customerReviews,
        );
  }
}
