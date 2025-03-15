import 'package:clipboard_mac/app/domain/models/clipboard_item_model.dart';
import 'package:result_dart/result_dart.dart';

abstract class ClipboardRepository {
  Future<List<ClipboardItemModel>> getClipBoardItens();
  AsyncResult<Unit> setClipBoard(ClipboardItemModel content);
  void removeFromClipBoard(ClipboardItemModel content);
  void clearClipBoard();

  Stream<ClipboardItemModel> get clipBoardHistoryChanges;
  List<ClipboardItemModel> get clipBoardHistory;
  void dispose();
}
