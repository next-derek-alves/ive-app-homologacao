abstract class Usecase<Output, Input> {
  Future<Output> call(Input params);
}
