import 'response.dart';

class ReturnAPI<T> {
  final ResponseAPI response;
  final T? toReturn;

  ReturnAPI({
    required this.response,
    this.toReturn,
  });
}
