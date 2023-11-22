// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TarefasStruct extends FFFirebaseStruct {
  TarefasStruct({
    String? titulo,
    DateTime? data,
    bool? status,
    Color? dificuldade,
    double? prioridade,
    String? descricao,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titulo = titulo,
        _data = data,
        _status = status,
        _dificuldade = dificuldade,
        _prioridade = prioridade,
        _descricao = descricao,
        super(firestoreUtilData);

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  set titulo(String? val) => _titulo = val;
  bool hasTitulo() => _titulo != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;
  bool hasData() => _data != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  set status(bool? val) => _status = val;
  bool hasStatus() => _status != null;

  // "dificuldade" field.
  Color? _dificuldade;
  Color? get dificuldade => _dificuldade;
  set dificuldade(Color? val) => _dificuldade = val;
  bool hasDificuldade() => _dificuldade != null;

  // "prioridade" field.
  double? _prioridade;
  double get prioridade => _prioridade ?? 0.0;
  set prioridade(double? val) => _prioridade = val;
  void incrementPrioridade(double amount) => _prioridade = prioridade + amount;
  bool hasPrioridade() => _prioridade != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;
  bool hasDescricao() => _descricao != null;

  static TarefasStruct fromMap(Map<String, dynamic> data) => TarefasStruct(
        titulo: data['titulo'] as String?,
        data: data['data'] as DateTime?,
        status: data['status'] as bool?,
        dificuldade: getSchemaColor(data['dificuldade']),
        prioridade: castToType<double>(data['prioridade']),
        descricao: data['descricao'] as String?,
      );

  static TarefasStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TarefasStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'titulo': _titulo,
        'data': _data,
        'status': _status,
        'dificuldade': _dificuldade,
        'prioridade': _prioridade,
        'descricao': _descricao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'titulo': serializeParam(
          _titulo,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.bool,
        ),
        'dificuldade': serializeParam(
          _dificuldade,
          ParamType.Color,
        ),
        'prioridade': serializeParam(
          _prioridade,
          ParamType.double,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
      }.withoutNulls;

  static TarefasStruct fromSerializableMap(Map<String, dynamic> data) =>
      TarefasStruct(
        titulo: deserializeParam(
          data['titulo'],
          ParamType.String,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.bool,
          false,
        ),
        dificuldade: deserializeParam(
          data['dificuldade'],
          ParamType.Color,
          false,
        ),
        prioridade: deserializeParam(
          data['prioridade'],
          ParamType.double,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TarefasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TarefasStruct &&
        titulo == other.titulo &&
        data == other.data &&
        status == other.status &&
        dificuldade == other.dificuldade &&
        prioridade == other.prioridade &&
        descricao == other.descricao;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([titulo, data, status, dificuldade, prioridade, descricao]);
}

TarefasStruct createTarefasStruct({
  String? titulo,
  DateTime? data,
  bool? status,
  Color? dificuldade,
  double? prioridade,
  String? descricao,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TarefasStruct(
      titulo: titulo,
      data: data,
      status: status,
      dificuldade: dificuldade,
      prioridade: prioridade,
      descricao: descricao,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TarefasStruct? updateTarefasStruct(
  TarefasStruct? tarefas, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tarefas
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTarefasStructData(
  Map<String, dynamic> firestoreData,
  TarefasStruct? tarefas,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tarefas == null) {
    return;
  }
  if (tarefas.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tarefas.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tarefasData = getTarefasFirestoreData(tarefas, forFieldValue);
  final nestedData = tarefasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tarefas.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTarefasFirestoreData(
  TarefasStruct? tarefas, [
  bool forFieldValue = false,
]) {
  if (tarefas == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tarefas.toMap());

  // Add any Firestore field values
  tarefas.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTarefasListFirestoreData(
  List<TarefasStruct>? tarefass,
) =>
    tarefass?.map((e) => getTarefasFirestoreData(e, true)).toList() ?? [];
