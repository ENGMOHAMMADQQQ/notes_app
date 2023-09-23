import 'package:hive/hive.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  late final String title;
  @HiveField(1)
  late final String subtitle;
  @HiveField(2)
  late final String date;
  @HiveField(3)
  late final int color;
  NoteModel(
      {required this.title,
      required this.subtitle,
      required this.date,
      required this.color});
}
