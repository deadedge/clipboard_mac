import 'package:clipboard_mac/app/utils/app_exceptions.dart';

class WriteClipBoardError extends AppException {
  WriteClipBoardError(super.error, [super.stackTrace]);
  @override
  String toString() {
    return super.error.toString();
  }
}
