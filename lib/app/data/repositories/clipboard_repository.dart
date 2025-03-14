import 'package:clipboard_mac/app/domain/models/clipboard_item_model.dart';
import 'package:result_dart/result_dart.dart';

abstract class ClipboardRepository {
  AsyncResult<List<ClipboardItemModel>> getClipBoardItens();
  AsyncResult<Unit> removeFromClipBoard(ClipboardItemModel content);
  AsyncResult<Unit> setClipBoard(ClipboardItemModel content);

  Stream<ClipboardItemModel> get clipBoardHistoryChanges;
  List<ClipboardItemModel> get clipBoardHistory;
  void dispose();
}
