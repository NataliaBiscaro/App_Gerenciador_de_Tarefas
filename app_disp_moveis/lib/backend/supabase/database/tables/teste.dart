import '../database.dart';

class TesteTable extends SupabaseTable<TesteRow> {
  @override
  String get tableName => 'Teste';

  @override
  TesteRow createRow(Map<String, dynamic> data) => TesteRow(data);
}

class TesteRow extends SupabaseDataRow {
  TesteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TesteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
