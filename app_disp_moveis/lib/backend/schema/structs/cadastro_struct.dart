// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CadastroStruct extends FFFirebaseStruct {
  CadastroStruct({
    String? nome,
    String? email,
    String? senha,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _email = email,
        _senha = senha,
        super(firestoreUtilData);

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;
  bool hasNome() => _nome != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "Senha" field.
  String? _senha;
  String get senha => _senha ?? '';
  set senha(String? val) => _senha = val;
  bool hasSenha() => _senha != null;

  static CadastroStruct fromMap(Map<String, dynamic> data) => CadastroStruct(
        nome: data['Nome'] as String?,
        email: data['Email'] as String?,
        senha: data['Senha'] as String?,
      );

  static CadastroStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CadastroStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Nome': _nome,
        'Email': _email,
        'Senha': _senha,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'Email': serializeParam(
          _email,
          ParamType.String,
        ),
        'Senha': serializeParam(
          _senha,
          ParamType.String,
        ),
      }.withoutNulls;

  static CadastroStruct fromSerializableMap(Map<String, dynamic> data) =>
      CadastroStruct(
        nome: deserializeParam(
          data['Nome'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['Email'],
          ParamType.String,
          false,
        ),
        senha: deserializeParam(
          data['Senha'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CadastroStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CadastroStruct &&
        nome == other.nome &&
        email == other.email &&
        senha == other.senha;
  }

  @override
  int get hashCode => const ListEquality().hash([nome, email, senha]);
}

CadastroStruct createCadastroStruct({
  String? nome,
  String? email,
  String? senha,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CadastroStruct(
      nome: nome,
      email: email,
      senha: senha,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CadastroStruct? updateCadastroStruct(
  CadastroStruct? cadastro, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cadastro
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCadastroStructData(
  Map<String, dynamic> firestoreData,
  CadastroStruct? cadastro,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cadastro == null) {
    return;
  }
  if (cadastro.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cadastro.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cadastroData = getCadastroFirestoreData(cadastro, forFieldValue);
  final nestedData = cadastroData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cadastro.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCadastroFirestoreData(
  CadastroStruct? cadastro, [
  bool forFieldValue = false,
]) {
  if (cadastro == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cadastro.toMap());

  // Add any Firestore field values
  cadastro.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCadastroListFirestoreData(
  List<CadastroStruct>? cadastros,
) =>
    cadastros?.map((e) => getCadastroFirestoreData(e, true)).toList() ?? [];
