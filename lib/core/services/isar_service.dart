import 'package:isar/isar.dart';
import 'package:my_classes/features/groups/data/models/group_isar_model.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late final Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([
      GroupIsarModelSchema,
      // StudentIsarModelSchema,
      // SessionIsarModelSchema,
      // AttendanceIsarModelSchema,
      // PaymentIsarModelSchema,
    ], directory: dir.path);
  }
}
