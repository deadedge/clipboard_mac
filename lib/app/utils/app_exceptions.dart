class AppException implements Exception {
  String error;
  StackTrace? stackTrace;

  AppException(this.error, [this.stackTrace]);

  @override
  String toString() {
    if(stackTrace != null) {
      return '$runtimeType{error: $error, stackTrace: $stackTrace}';
    }
    return '$runtimeType{error: $error}';
  }
}
