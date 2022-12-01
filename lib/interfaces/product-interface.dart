import '../utils/api/api_exception.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';

class ReviewProductInterface {
  static Future<bool> addProductReview({
    double? rating,
    required int? productId,
    String? review,
  }) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          body: {
            "rating": rating,
            "review": review,
          },
          route: "product/$productId/review",
          queries: {});
      return response != null;
    } catch (err) {
      throw ApiException(err.toString());
    }
  }
}
