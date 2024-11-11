import '../error_handler/failures.dart';

String mapFailureToMessage(Failures failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return "Server Failure";
    case EmptyCacheFailure:
      return "Cache Failure";
    case OfflineFailure:
      return "offline Failure";
    default:
      return failure.toString();
  }
}
bool isDark = false;
