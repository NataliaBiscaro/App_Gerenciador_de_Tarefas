import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TarefasRecord extends FirestoreRecord {
  TarefasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "prioridade" field.
  String? _prioridade;
  String get prioridade => _prioridade ?? '';
  bool hasPrioridade() => _prioridade != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "tarefaConcluida" field.
  bool? _tarefaConcluida;
  bool get tarefaConcluida => _tarefaConcluida ?? false;
  bool hasTarefaConcluida() => _tarefaConcluida != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _status = snapshotData['status'] as bool?;
    _descricao = snapshotData['descricao'] as String?;
    _imagem = snapshotData['imagem'] as String?;
    _prioridade = snapshotData['prioridade'] as String?;
    _userID = snapshotData['userID'] as String?;
    _email = snapshotData['email'] as String?;
    _tarefaConcluida = snapshotData['tarefaConcluida'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tarefas');

  static Stream<TarefasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TarefasRecord.fromSnapshot(s));

  static Future<TarefasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TarefasRecord.fromSnapshot(s));

  static TarefasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TarefasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TarefasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TarefasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TarefasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TarefasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTarefasRecordData({
  String? titulo,
  DateTime? data,
  bool? status,
  String? descricao,
  String? imagem,
  String? prioridade,
  String? userID,
  String? email,
  bool? tarefaConcluida,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'data': data,
      'status': status,
      'descricao': descricao,
      'imagem': imagem,
      'prioridade': prioridade,
      'userID': userID,
      'email': email,
      'tarefaConcluida': tarefaConcluida,
    }.withoutNulls,
  );

  return firestoreData;
}

class TarefasRecordDocumentEquality implements Equality<TarefasRecord> {
  const TarefasRecordDocumentEquality();

  @override
  bool equals(TarefasRecord? e1, TarefasRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.data == e2?.data &&
        e1?.status == e2?.status &&
        e1?.descricao == e2?.descricao &&
        e1?.imagem == e2?.imagem &&
        e1?.prioridade == e2?.prioridade &&
        e1?.userID == e2?.userID &&
        e1?.email == e2?.email &&
        e1?.tarefaConcluida == e2?.tarefaConcluida;
  }

  @override
  int hash(TarefasRecord? e) => const ListEquality().hash([
        e?.titulo,
        e?.data,
        e?.status,
        e?.descricao,
        e?.imagem,
        e?.prioridade,
        e?.userID,
        e?.email,
        e?.tarefaConcluida
      ]);

  @override
  bool isValidKey(Object? o) => o is TarefasRecord;
}
