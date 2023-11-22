// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginStruct extends FFFirebaseStruct {
  LoginStruct({
    String? email,
    String? senha,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _email = email,
        _senha = senha,
        super(firestoreUtilData);

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "senha" field.
  String? _senha;
  String get senha => _senha ?? '';
  set senha(String? val) => _senha = val;
  bool hasSenha() => _senha != null;

  static LoginStruct fromMap(Map<String, dynamic> data) => LoginStruct(
        email: data['email'] as String?,
        senha: data['senha'] as String?,
      );

  static LoginStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? LoginStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'senha': _senha,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'senha': serializeParam(
          _senha,
          ParamType.String,
        ),
      }.withoutNulls;

  static LoginStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoginStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        senha: deserializeParam(
          data['senha'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LoginStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LoginStruct && email == other.email && senha == other.senha;
  }

  @override
  int get hashCode => const ListEquality().hash([email, senha]);
}

LoginStruct createLoginStruct({
  String? email,
  String? senha,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LoginStruct(
      email: email,
      senha: senha,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LoginStruct? updateLoginStruct(
  LoginStruct? login, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    login
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLoginStructData(
  Map<String, dynamic> firestoreData,
  LoginStruct? login,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (login == null) {
    return;
  }
  if (login.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && login.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final loginData = getLoginFirestoreData(login, forFieldValue);
  final nestedData = loginData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = login.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLoginFirestoreData(
  LoginStruct? login, [
  bool forFieldValue = false,
]) {
  if (login == null) {
    return {};
  }
  final firestoreData = mapToFirestore(login.toMap());

  // Add any Firestore field values
  login.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLoginListFirestoreData(
  List<LoginStruct>? logins,
) =>
    logins?.map((e) => getLoginFirestoreData(e, true)).toList() ?? [];
