// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_internal_member

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class UserCollectionReference
    implements
        UserQuery,
        FirestoreCollectionReference<User, UserQuerySnapshot> {
  factory UserCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserCollectionReference;

  static User fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    User value,
    SetOptions? options,
  ) {
    return {..._$UserToJson(value)}..remove('id');
  }

  @override
  CollectionReference<User> get reference;

  @override
  UserDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserDocumentReference> add(User value);
}

class _$UserCollectionReference extends _$UserQuery
    implements UserCollectionReference {
  factory _$UserCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserCollectionReference.fromFirestore,
            toFirestore: UserCollectionReference.toFirestore,
          ),
    );
  }

  _$UserCollectionReference._(
    CollectionReference<User> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<User> get reference =>
      super.reference as CollectionReference<User>;

  @override
  UserDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserDocumentReference> add(User value) {
    return reference.add(value).then((ref) => UserDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserDocumentReference
    extends FirestoreDocumentReference<User, UserDocumentSnapshot> {
  factory UserDocumentReference(DocumentReference<User> reference) =
      _$UserDocumentReference;

  DocumentReference<User> get reference;

  /// A reference to the [UserCollectionReference] containing this document.
  UserCollectionReference get parent {
    return _$UserCollectionReference(reference.firestore);
  }

  late final IngredientCollectionReference ingredients =
      _$IngredientCollectionReference(
    reference,
  );

  late final RecipeCollectionReference recipes = _$RecipeCollectionReference(
    reference,
  );

  late final WeekCollectionReference weeks = _$WeekCollectionReference(
    reference,
  );

  late final ShoppingListCollectionReference shoppinglists =
      _$ShoppingListCollectionReference(
    reference,
  );

  @override
  Stream<UserDocumentSnapshot> snapshots();

  @override
  Future<UserDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();
}

class _$UserDocumentReference
    extends FirestoreDocumentReference<User, UserDocumentSnapshot>
    implements UserDocumentReference {
  _$UserDocumentReference(this.reference);

  @override
  final DocumentReference<User> reference;

  /// A reference to the [UserCollectionReference] containing this document.
  UserCollectionReference get parent {
    return _$UserCollectionReference(reference.firestore);
  }

  late final IngredientCollectionReference ingredients =
      _$IngredientCollectionReference(
    reference,
  );

  late final RecipeCollectionReference recipes = _$RecipeCollectionReference(
    reference,
  );

  late final WeekCollectionReference weeks = _$WeekCollectionReference(
    reference,
  );

  late final ShoppingListCollectionReference shoppinglists =
      _$ShoppingListCollectionReference(
    reference,
  );

  @override
  Stream<UserDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserDocumentSnapshot._);
  }

  @override
  Future<UserDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserDocumentSnapshot._);
  }

  @override
  Future<UserDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserDocumentSnapshot._);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserQuery implements QueryReference<User, UserQuerySnapshot> {
  @override
  UserQuery limit(int limit);

  @override
  UserQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  UserQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  UserQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });
}

class _$UserQuery extends QueryReference<User, UserQuerySnapshot>
    implements UserQuery {
  _$UserQuery(
    this._collection, {
    required Query<User> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(UserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserQuery limit(int limit) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery limitToLast(int limit) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserDocumentSnapshot extends FirestoreDocumentSnapshot<User> {
  UserDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<User> snapshot;

  @override
  UserDocumentReference get reference {
    return UserDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final User? data;
}

class UserQuerySnapshot
    extends FirestoreQuerySnapshot<User, UserQueryDocumentSnapshot> {
  UserQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<User> snapshot,
  ) {
    final docs = snapshot.docs.map(UserQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserDocumentSnapshot._,
      );
    }).toList();

    return UserQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<User> snapshot;

  @override
  final List<UserQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserDocumentSnapshot>> docChanges;
}

class UserQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<User>
    implements UserDocumentSnapshot {
  UserQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<User> snapshot;

  @override
  final User data;

  @override
  UserDocumentReference get reference {
    return UserDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class IngredientCollectionReference
    implements
        IngredientQuery,
        FirestoreCollectionReference<Ingredient, IngredientQuerySnapshot> {
  factory IngredientCollectionReference(
    DocumentReference<User> parent,
  ) = _$IngredientCollectionReference;

  static Ingredient fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$IngredientFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Ingredient value,
    SetOptions? options,
  ) {
    return {..._$IngredientToJson(value)}..remove('id');
  }

  @override
  CollectionReference<Ingredient> get reference;

  /// A reference to the containing [UserDocumentReference] if this is a subcollection.
  UserDocumentReference get parent;

  @override
  IngredientDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<IngredientDocumentReference> add(Ingredient value);
}

class _$IngredientCollectionReference extends _$IngredientQuery
    implements IngredientCollectionReference {
  factory _$IngredientCollectionReference(
    DocumentReference<User> parent,
  ) {
    return _$IngredientCollectionReference._(
      UserDocumentReference(parent),
      parent.collection('ingredients').withConverter(
            fromFirestore: IngredientCollectionReference.fromFirestore,
            toFirestore: IngredientCollectionReference.toFirestore,
          ),
    );
  }

  _$IngredientCollectionReference._(
    this.parent,
    CollectionReference<Ingredient> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UserDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Ingredient> get reference =>
      super.reference as CollectionReference<Ingredient>;

  @override
  IngredientDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return IngredientDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<IngredientDocumentReference> add(Ingredient value) {
    return reference.add(value).then((ref) => IngredientDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$IngredientCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class IngredientDocumentReference
    extends FirestoreDocumentReference<Ingredient, IngredientDocumentSnapshot> {
  factory IngredientDocumentReference(DocumentReference<Ingredient> reference) =
      _$IngredientDocumentReference;

  DocumentReference<Ingredient> get reference;

  /// A reference to the [IngredientCollectionReference] containing this document.
  IngredientCollectionReference get parent {
    return _$IngredientCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<IngredientDocumentSnapshot> snapshots();

  @override
  Future<IngredientDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
  });
}

class _$IngredientDocumentReference
    extends FirestoreDocumentReference<Ingredient, IngredientDocumentSnapshot>
    implements IngredientDocumentReference {
  _$IngredientDocumentReference(this.reference);

  @override
  final DocumentReference<Ingredient> reference;

  /// A reference to the [IngredientCollectionReference] containing this document.
  IngredientCollectionReference get parent {
    return _$IngredientCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<IngredientDocumentSnapshot> snapshots() {
    return reference.snapshots().map(IngredientDocumentSnapshot._);
  }

  @override
  Future<IngredientDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(IngredientDocumentSnapshot._);
  }

  @override
  Future<IngredientDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(IngredientDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$IngredientFieldMap['name']!:
            _$IngredientPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$IngredientFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$IngredientFieldMap['type']!:
            _$IngredientPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$IngredientFieldMap['type']!: typeFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$IngredientFieldMap['name']!:
            _$IngredientPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$IngredientFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$IngredientFieldMap['type']!:
            _$IngredientPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$IngredientFieldMap['type']!: typeFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is IngredientDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class IngredientQuery
    implements QueryReference<Ingredient, IngredientQuerySnapshot> {
  @override
  IngredientQuery limit(int limit);

  @override
  IngredientQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  IngredientQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  IngredientQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  IngredientQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  IngredientQuery whereType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  IngredientQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  });

  IngredientQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  });

  IngredientQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  });

  IngredientQuery orderByType({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  });
}

class _$IngredientQuery
    extends QueryReference<Ingredient, IngredientQuerySnapshot>
    implements IngredientQuery {
  _$IngredientQuery(
    this._collection, {
    required Query<Ingredient> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<IngredientQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(IngredientQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<IngredientQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(IngredientQuerySnapshot._fromQuerySnapshot);
  }

  @override
  IngredientQuery limit(int limit) {
    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  IngredientQuery limitToLast(int limit) {
    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  IngredientQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  IngredientQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  IngredientQuery whereName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$IngredientFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$IngredientPerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$IngredientPerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$IngredientPerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$IngredientPerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$IngredientPerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$IngredientPerFieldToJson.name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$IngredientPerFieldToJson.name(e)),
        whereNotIn: whereNotIn?.map((e) => _$IngredientPerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  IngredientQuery whereType({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$IngredientFieldMap['type']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$IngredientPerFieldToJson.type(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$IngredientPerFieldToJson.type(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$IngredientPerFieldToJson.type(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$IngredientPerFieldToJson.type(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$IngredientPerFieldToJson.type(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$IngredientPerFieldToJson.type(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$IngredientPerFieldToJson.type(e)),
        whereNotIn: whereNotIn?.map((e) => _$IngredientPerFieldToJson.type(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  IngredientQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  IngredientQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  IngredientQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$IngredientFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  IngredientQuery orderByType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$IngredientFieldMap['type']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$IngredientQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class IngredientDocumentSnapshot extends FirestoreDocumentSnapshot<Ingredient> {
  IngredientDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Ingredient> snapshot;

  @override
  IngredientDocumentReference get reference {
    return IngredientDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Ingredient? data;
}

class IngredientQuerySnapshot extends FirestoreQuerySnapshot<Ingredient,
    IngredientQueryDocumentSnapshot> {
  IngredientQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory IngredientQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Ingredient> snapshot,
  ) {
    final docs = snapshot.docs.map(IngredientQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        IngredientDocumentSnapshot._,
      );
    }).toList();

    return IngredientQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<IngredientDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    IngredientDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<IngredientDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Ingredient> snapshot;

  @override
  final List<IngredientQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<IngredientDocumentSnapshot>> docChanges;
}

class IngredientQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Ingredient>
    implements IngredientDocumentSnapshot {
  IngredientQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Ingredient> snapshot;

  @override
  final Ingredient data;

  @override
  IngredientDocumentReference get reference {
    return IngredientDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class RecipeCollectionReference
    implements
        RecipeQuery,
        FirestoreCollectionReference<Recipe, RecipeQuerySnapshot> {
  factory RecipeCollectionReference(
    DocumentReference<User> parent,
  ) = _$RecipeCollectionReference;

  static Recipe fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$RecipeFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Recipe value,
    SetOptions? options,
  ) {
    return {..._$RecipeToJson(value)}..remove('id');
  }

  @override
  CollectionReference<Recipe> get reference;

  /// A reference to the containing [UserDocumentReference] if this is a subcollection.
  UserDocumentReference get parent;

  @override
  RecipeDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RecipeDocumentReference> add(Recipe value);
}

class _$RecipeCollectionReference extends _$RecipeQuery
    implements RecipeCollectionReference {
  factory _$RecipeCollectionReference(
    DocumentReference<User> parent,
  ) {
    return _$RecipeCollectionReference._(
      UserDocumentReference(parent),
      parent.collection('recipes').withConverter(
            fromFirestore: RecipeCollectionReference.fromFirestore,
            toFirestore: RecipeCollectionReference.toFirestore,
          ),
    );
  }

  _$RecipeCollectionReference._(
    this.parent,
    CollectionReference<Recipe> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UserDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Recipe> get reference =>
      super.reference as CollectionReference<Recipe>;

  @override
  RecipeDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return RecipeDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RecipeDocumentReference> add(Recipe value) {
    return reference.add(value).then((ref) => RecipeDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RecipeCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RecipeDocumentReference
    extends FirestoreDocumentReference<Recipe, RecipeDocumentSnapshot> {
  factory RecipeDocumentReference(DocumentReference<Recipe> reference) =
      _$RecipeDocumentReference;

  DocumentReference<Recipe> get reference;

  /// A reference to the [RecipeCollectionReference] containing this document.
  RecipeCollectionReference get parent {
    return _$RecipeCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<RecipeDocumentSnapshot> snapshots();

  @override
  Future<RecipeDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    List<Map<String, String>> ingredients,
    FieldValue ingredientsFieldValue,
    List<Map<String, String>> recipes,
    FieldValue recipesFieldValue,
    String prepTime,
    FieldValue prepTimeFieldValue,
    String cookTime,
    FieldValue cookTimeFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    String instructions,
    FieldValue instructionsFieldValue,
    String name,
    FieldValue nameFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    List<Map<String, String>> ingredients,
    FieldValue ingredientsFieldValue,
    List<Map<String, String>> recipes,
    FieldValue recipesFieldValue,
    String prepTime,
    FieldValue prepTimeFieldValue,
    String cookTime,
    FieldValue cookTimeFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    String instructions,
    FieldValue instructionsFieldValue,
    String name,
    FieldValue nameFieldValue,
  });
}

class _$RecipeDocumentReference
    extends FirestoreDocumentReference<Recipe, RecipeDocumentSnapshot>
    implements RecipeDocumentReference {
  _$RecipeDocumentReference(this.reference);

  @override
  final DocumentReference<Recipe> reference;

  /// A reference to the [RecipeCollectionReference] containing this document.
  RecipeCollectionReference get parent {
    return _$RecipeCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<RecipeDocumentSnapshot> snapshots() {
    return reference.snapshots().map(RecipeDocumentSnapshot._);
  }

  @override
  Future<RecipeDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RecipeDocumentSnapshot._);
  }

  @override
  Future<RecipeDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(RecipeDocumentSnapshot._);
  }

  Future<void> update({
    Object? ingredients = _sentinel,
    FieldValue? ingredientsFieldValue,
    Object? recipes = _sentinel,
    FieldValue? recipesFieldValue,
    Object? prepTime = _sentinel,
    FieldValue? prepTimeFieldValue,
    Object? cookTime = _sentinel,
    FieldValue? cookTimeFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? instructions = _sentinel,
    FieldValue? instructionsFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
  }) async {
    assert(
      ingredients == _sentinel || ingredientsFieldValue == null,
      "Cannot specify both ingredients and ingredientsFieldValue",
    );
    assert(
      recipes == _sentinel || recipesFieldValue == null,
      "Cannot specify both recipes and recipesFieldValue",
    );
    assert(
      prepTime == _sentinel || prepTimeFieldValue == null,
      "Cannot specify both prepTime and prepTimeFieldValue",
    );
    assert(
      cookTime == _sentinel || cookTimeFieldValue == null,
      "Cannot specify both cookTime and cookTimeFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      instructions == _sentinel || instructionsFieldValue == null,
      "Cannot specify both instructions and instructionsFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    final json = {
      if (ingredients != _sentinel)
        _$RecipeFieldMap['ingredients']!: _$RecipePerFieldToJson
            .ingredients(ingredients as List<Map<String, String>>),
      if (ingredientsFieldValue != null)
        _$RecipeFieldMap['ingredients']!: ingredientsFieldValue,
      if (recipes != _sentinel)
        _$RecipeFieldMap['recipes']!: _$RecipePerFieldToJson
            .recipes(recipes as List<Map<String, String>>),
      if (recipesFieldValue != null)
        _$RecipeFieldMap['recipes']!: recipesFieldValue,
      if (prepTime != _sentinel)
        _$RecipeFieldMap['prepTime']!:
            _$RecipePerFieldToJson.prepTime(prepTime as String),
      if (prepTimeFieldValue != null)
        _$RecipeFieldMap['prepTime']!: prepTimeFieldValue,
      if (cookTime != _sentinel)
        _$RecipeFieldMap['cookTime']!:
            _$RecipePerFieldToJson.cookTime(cookTime as String),
      if (cookTimeFieldValue != null)
        _$RecipeFieldMap['cookTime']!: cookTimeFieldValue,
      if (description != _sentinel)
        _$RecipeFieldMap['description']!:
            _$RecipePerFieldToJson.description(description as String),
      if (descriptionFieldValue != null)
        _$RecipeFieldMap['description']!: descriptionFieldValue,
      if (instructions != _sentinel)
        _$RecipeFieldMap['instructions']!:
            _$RecipePerFieldToJson.instructions(instructions as String),
      if (instructionsFieldValue != null)
        _$RecipeFieldMap['instructions']!: instructionsFieldValue,
      if (name != _sentinel)
        _$RecipeFieldMap['name']!: _$RecipePerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$RecipeFieldMap['name']!: nameFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? ingredients = _sentinel,
    FieldValue? ingredientsFieldValue,
    Object? recipes = _sentinel,
    FieldValue? recipesFieldValue,
    Object? prepTime = _sentinel,
    FieldValue? prepTimeFieldValue,
    Object? cookTime = _sentinel,
    FieldValue? cookTimeFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? instructions = _sentinel,
    FieldValue? instructionsFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
  }) {
    assert(
      ingredients == _sentinel || ingredientsFieldValue == null,
      "Cannot specify both ingredients and ingredientsFieldValue",
    );
    assert(
      recipes == _sentinel || recipesFieldValue == null,
      "Cannot specify both recipes and recipesFieldValue",
    );
    assert(
      prepTime == _sentinel || prepTimeFieldValue == null,
      "Cannot specify both prepTime and prepTimeFieldValue",
    );
    assert(
      cookTime == _sentinel || cookTimeFieldValue == null,
      "Cannot specify both cookTime and cookTimeFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      instructions == _sentinel || instructionsFieldValue == null,
      "Cannot specify both instructions and instructionsFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    final json = {
      if (ingredients != _sentinel)
        _$RecipeFieldMap['ingredients']!: _$RecipePerFieldToJson
            .ingredients(ingredients as List<Map<String, String>>),
      if (ingredientsFieldValue != null)
        _$RecipeFieldMap['ingredients']!: ingredientsFieldValue,
      if (recipes != _sentinel)
        _$RecipeFieldMap['recipes']!: _$RecipePerFieldToJson
            .recipes(recipes as List<Map<String, String>>),
      if (recipesFieldValue != null)
        _$RecipeFieldMap['recipes']!: recipesFieldValue,
      if (prepTime != _sentinel)
        _$RecipeFieldMap['prepTime']!:
            _$RecipePerFieldToJson.prepTime(prepTime as String),
      if (prepTimeFieldValue != null)
        _$RecipeFieldMap['prepTime']!: prepTimeFieldValue,
      if (cookTime != _sentinel)
        _$RecipeFieldMap['cookTime']!:
            _$RecipePerFieldToJson.cookTime(cookTime as String),
      if (cookTimeFieldValue != null)
        _$RecipeFieldMap['cookTime']!: cookTimeFieldValue,
      if (description != _sentinel)
        _$RecipeFieldMap['description']!:
            _$RecipePerFieldToJson.description(description as String),
      if (descriptionFieldValue != null)
        _$RecipeFieldMap['description']!: descriptionFieldValue,
      if (instructions != _sentinel)
        _$RecipeFieldMap['instructions']!:
            _$RecipePerFieldToJson.instructions(instructions as String),
      if (instructionsFieldValue != null)
        _$RecipeFieldMap['instructions']!: instructionsFieldValue,
      if (name != _sentinel)
        _$RecipeFieldMap['name']!: _$RecipePerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$RecipeFieldMap['name']!: nameFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class RecipeQuery
    implements QueryReference<Recipe, RecipeQuerySnapshot> {
  @override
  RecipeQuery limit(int limit);

  @override
  RecipeQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  RecipeQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  RecipeQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  RecipeQuery whereIngredients({
    List<Map<String, String>>? isEqualTo,
    List<Map<String, String>>? isNotEqualTo,
    List<Map<String, String>>? isLessThan,
    List<Map<String, String>>? isLessThanOrEqualTo,
    List<Map<String, String>>? isGreaterThan,
    List<Map<String, String>>? isGreaterThanOrEqualTo,
    Map<String, String>? arrayContains,
    List<Map<String, String>>? arrayContainsAny,
    bool? isNull,
  });

  RecipeQuery whereRecipes({
    List<Map<String, String>>? isEqualTo,
    List<Map<String, String>>? isNotEqualTo,
    List<Map<String, String>>? isLessThan,
    List<Map<String, String>>? isLessThanOrEqualTo,
    List<Map<String, String>>? isGreaterThan,
    List<Map<String, String>>? isGreaterThanOrEqualTo,
    Map<String, String>? arrayContains,
    List<Map<String, String>>? arrayContainsAny,
    bool? isNull,
  });

  RecipeQuery wherePrepTime({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  RecipeQuery whereCookTime({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  RecipeQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  RecipeQuery whereInstructions({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  RecipeQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  RecipeQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  });

  RecipeQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  });

  RecipeQuery orderByIngredients({
    bool descending = false,
    List<Map<String, String>> startAt,
    List<Map<String, String>> startAfter,
    List<Map<String, String>> endAt,
    List<Map<String, String>> endBefore,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  });

  RecipeQuery orderByRecipes({
    bool descending = false,
    List<Map<String, String>> startAt,
    List<Map<String, String>> startAfter,
    List<Map<String, String>> endAt,
    List<Map<String, String>> endBefore,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  });

  RecipeQuery orderByPrepTime({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  });

  RecipeQuery orderByCookTime({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  });

  RecipeQuery orderByDescription({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  });

  RecipeQuery orderByInstructions({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  });

  RecipeQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  });
}

class _$RecipeQuery extends QueryReference<Recipe, RecipeQuerySnapshot>
    implements RecipeQuery {
  _$RecipeQuery(
    this._collection, {
    required Query<Recipe> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<RecipeQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(RecipeQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<RecipeQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RecipeQuerySnapshot._fromQuerySnapshot);
  }

  @override
  RecipeQuery limit(int limit) {
    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RecipeQuery limitToLast(int limit) {
    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RecipeQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RecipeQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RecipeQuery whereIngredients({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Map<String, String>>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RecipeFieldMap['ingredients']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$RecipePerFieldToJson
                .ingredients(isEqualTo as List<Map<String, String>>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$RecipePerFieldToJson
                .ingredients(isNotEqualTo as List<Map<String, String>>)
            : null,
        isLessThan: isLessThan != null
            ? _$RecipePerFieldToJson
                .ingredients(isLessThan as List<Map<String, String>>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$RecipePerFieldToJson
                .ingredients(isLessThanOrEqualTo as List<Map<String, String>>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$RecipePerFieldToJson
                .ingredients(isGreaterThan as List<Map<String, String>>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$RecipePerFieldToJson.ingredients(
                isGreaterThanOrEqualTo as List<Map<String, String>>)
            : null,
        arrayContains: arrayContains != null
            ? (_$RecipePerFieldToJson
                        .ingredients([arrayContains as Map<String, String>])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$RecipePerFieldToJson.ingredients(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RecipeQuery whereRecipes({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Map<String, String>>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RecipeFieldMap['recipes']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$RecipePerFieldToJson
                .recipes(isEqualTo as List<Map<String, String>>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$RecipePerFieldToJson
                .recipes(isNotEqualTo as List<Map<String, String>>)
            : null,
        isLessThan: isLessThan != null
            ? _$RecipePerFieldToJson
                .recipes(isLessThan as List<Map<String, String>>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$RecipePerFieldToJson
                .recipes(isLessThanOrEqualTo as List<Map<String, String>>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$RecipePerFieldToJson
                .recipes(isGreaterThan as List<Map<String, String>>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$RecipePerFieldToJson
                .recipes(isGreaterThanOrEqualTo as List<Map<String, String>>)
            : null,
        arrayContains: arrayContains != null
            ? (_$RecipePerFieldToJson
                    .recipes([arrayContains as Map<String, String>]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$RecipePerFieldToJson.recipes(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RecipeQuery wherePrepTime({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RecipeFieldMap['prepTime']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$RecipePerFieldToJson.prepTime(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$RecipePerFieldToJson.prepTime(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$RecipePerFieldToJson.prepTime(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$RecipePerFieldToJson.prepTime(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$RecipePerFieldToJson.prepTime(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$RecipePerFieldToJson.prepTime(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$RecipePerFieldToJson.prepTime(e)),
        whereNotIn: whereNotIn?.map((e) => _$RecipePerFieldToJson.prepTime(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RecipeQuery whereCookTime({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RecipeFieldMap['cookTime']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$RecipePerFieldToJson.cookTime(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$RecipePerFieldToJson.cookTime(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$RecipePerFieldToJson.cookTime(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$RecipePerFieldToJson.cookTime(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$RecipePerFieldToJson.cookTime(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$RecipePerFieldToJson.cookTime(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$RecipePerFieldToJson.cookTime(e)),
        whereNotIn: whereNotIn?.map((e) => _$RecipePerFieldToJson.cookTime(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RecipeQuery whereDescription({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RecipeFieldMap['description']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$RecipePerFieldToJson.description(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$RecipePerFieldToJson.description(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$RecipePerFieldToJson.description(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$RecipePerFieldToJson.description(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$RecipePerFieldToJson.description(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$RecipePerFieldToJson
                .description(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$RecipePerFieldToJson.description(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$RecipePerFieldToJson.description(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RecipeQuery whereInstructions({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RecipeFieldMap['instructions']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$RecipePerFieldToJson.instructions(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$RecipePerFieldToJson.instructions(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$RecipePerFieldToJson.instructions(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$RecipePerFieldToJson.instructions(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$RecipePerFieldToJson.instructions(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$RecipePerFieldToJson
                .instructions(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$RecipePerFieldToJson.instructions(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$RecipePerFieldToJson.instructions(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RecipeQuery whereName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RecipeFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$RecipePerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$RecipePerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$RecipePerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$RecipePerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$RecipePerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$RecipePerFieldToJson.name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$RecipePerFieldToJson.name(e)),
        whereNotIn: whereNotIn?.map((e) => _$RecipePerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RecipeQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RecipeQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RecipeQuery orderByIngredients({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RecipeFieldMap['ingredients']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RecipeQuery orderByRecipes({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RecipeFieldMap['recipes']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RecipeQuery orderByPrepTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RecipeFieldMap['prepTime']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RecipeQuery orderByCookTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RecipeFieldMap['cookTime']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RecipeQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RecipeFieldMap['description']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RecipeQuery orderByInstructions({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RecipeFieldMap['instructions']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RecipeQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RecipeDocumentSnapshot? startAtDocument,
    RecipeDocumentSnapshot? endAtDocument,
    RecipeDocumentSnapshot? endBeforeDocument,
    RecipeDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RecipeFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RecipeQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$RecipeQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RecipeDocumentSnapshot extends FirestoreDocumentSnapshot<Recipe> {
  RecipeDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Recipe> snapshot;

  @override
  RecipeDocumentReference get reference {
    return RecipeDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Recipe? data;
}

class RecipeQuerySnapshot
    extends FirestoreQuerySnapshot<Recipe, RecipeQueryDocumentSnapshot> {
  RecipeQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory RecipeQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Recipe> snapshot,
  ) {
    final docs = snapshot.docs.map(RecipeQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        RecipeDocumentSnapshot._,
      );
    }).toList();

    return RecipeQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<RecipeDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    RecipeDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<RecipeDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Recipe> snapshot;

  @override
  final List<RecipeQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RecipeDocumentSnapshot>> docChanges;
}

class RecipeQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Recipe>
    implements RecipeDocumentSnapshot {
  RecipeQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Recipe> snapshot;

  @override
  final Recipe data;

  @override
  RecipeDocumentReference get reference {
    return RecipeDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class WeekCollectionReference
    implements
        WeekQuery,
        FirestoreCollectionReference<Week, WeekQuerySnapshot> {
  factory WeekCollectionReference(
    DocumentReference<User> parent,
  ) = _$WeekCollectionReference;

  static Week fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$WeekFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Week value,
    SetOptions? options,
  ) {
    return {..._$WeekToJson(value)}..remove('id');
  }

  @override
  CollectionReference<Week> get reference;

  /// A reference to the containing [UserDocumentReference] if this is a subcollection.
  UserDocumentReference get parent;

  @override
  WeekDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<WeekDocumentReference> add(Week value);
}

class _$WeekCollectionReference extends _$WeekQuery
    implements WeekCollectionReference {
  factory _$WeekCollectionReference(
    DocumentReference<User> parent,
  ) {
    return _$WeekCollectionReference._(
      UserDocumentReference(parent),
      parent.collection('weeks').withConverter(
            fromFirestore: WeekCollectionReference.fromFirestore,
            toFirestore: WeekCollectionReference.toFirestore,
          ),
    );
  }

  _$WeekCollectionReference._(
    this.parent,
    CollectionReference<Week> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UserDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Week> get reference =>
      super.reference as CollectionReference<Week>;

  @override
  WeekDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return WeekDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<WeekDocumentReference> add(Week value) {
    return reference.add(value).then((ref) => WeekDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$WeekCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class WeekDocumentReference
    extends FirestoreDocumentReference<Week, WeekDocumentSnapshot> {
  factory WeekDocumentReference(DocumentReference<Week> reference) =
      _$WeekDocumentReference;

  DocumentReference<Week> get reference;

  /// A reference to the [WeekCollectionReference] containing this document.
  WeekCollectionReference get parent {
    return _$WeekCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<WeekDocumentSnapshot> snapshots();

  @override
  Future<WeekDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    DateTime beginDate,
    FieldValue beginDateFieldValue,
    DateTime endDate,
    FieldValue endDateFieldValue,
    Map<DateTime, List<Map<String, String>>> days,
    FieldValue daysFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    DateTime beginDate,
    FieldValue beginDateFieldValue,
    DateTime endDate,
    FieldValue endDateFieldValue,
    Map<DateTime, List<Map<String, String>>> days,
    FieldValue daysFieldValue,
  });
}

class _$WeekDocumentReference
    extends FirestoreDocumentReference<Week, WeekDocumentSnapshot>
    implements WeekDocumentReference {
  _$WeekDocumentReference(this.reference);

  @override
  final DocumentReference<Week> reference;

  /// A reference to the [WeekCollectionReference] containing this document.
  WeekCollectionReference get parent {
    return _$WeekCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<WeekDocumentSnapshot> snapshots() {
    return reference.snapshots().map(WeekDocumentSnapshot._);
  }

  @override
  Future<WeekDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(WeekDocumentSnapshot._);
  }

  @override
  Future<WeekDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(WeekDocumentSnapshot._);
  }

  Future<void> update({
    Object? beginDate = _sentinel,
    FieldValue? beginDateFieldValue,
    Object? endDate = _sentinel,
    FieldValue? endDateFieldValue,
    Object? days = _sentinel,
    FieldValue? daysFieldValue,
  }) async {
    assert(
      beginDate == _sentinel || beginDateFieldValue == null,
      "Cannot specify both beginDate and beginDateFieldValue",
    );
    assert(
      endDate == _sentinel || endDateFieldValue == null,
      "Cannot specify both endDate and endDateFieldValue",
    );
    assert(
      days == _sentinel || daysFieldValue == null,
      "Cannot specify both days and daysFieldValue",
    );
    final json = {
      if (beginDate != _sentinel)
        _$WeekFieldMap['beginDate']!:
            _$WeekPerFieldToJson.beginDate(beginDate as DateTime),
      if (beginDateFieldValue != null)
        _$WeekFieldMap['beginDate']!: beginDateFieldValue,
      if (endDate != _sentinel)
        _$WeekFieldMap['endDate']!:
            _$WeekPerFieldToJson.endDate(endDate as DateTime),
      if (endDateFieldValue != null)
        _$WeekFieldMap['endDate']!: endDateFieldValue,
      if (days != _sentinel)
        _$WeekFieldMap['days']!: _$WeekPerFieldToJson
            .days(days as Map<DateTime, List<Map<String, String>>>),
      if (daysFieldValue != null) _$WeekFieldMap['days']!: daysFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? beginDate = _sentinel,
    FieldValue? beginDateFieldValue,
    Object? endDate = _sentinel,
    FieldValue? endDateFieldValue,
    Object? days = _sentinel,
    FieldValue? daysFieldValue,
  }) {
    assert(
      beginDate == _sentinel || beginDateFieldValue == null,
      "Cannot specify both beginDate and beginDateFieldValue",
    );
    assert(
      endDate == _sentinel || endDateFieldValue == null,
      "Cannot specify both endDate and endDateFieldValue",
    );
    assert(
      days == _sentinel || daysFieldValue == null,
      "Cannot specify both days and daysFieldValue",
    );
    final json = {
      if (beginDate != _sentinel)
        _$WeekFieldMap['beginDate']!:
            _$WeekPerFieldToJson.beginDate(beginDate as DateTime),
      if (beginDateFieldValue != null)
        _$WeekFieldMap['beginDate']!: beginDateFieldValue,
      if (endDate != _sentinel)
        _$WeekFieldMap['endDate']!:
            _$WeekPerFieldToJson.endDate(endDate as DateTime),
      if (endDateFieldValue != null)
        _$WeekFieldMap['endDate']!: endDateFieldValue,
      if (days != _sentinel)
        _$WeekFieldMap['days']!: _$WeekPerFieldToJson
            .days(days as Map<DateTime, List<Map<String, String>>>),
      if (daysFieldValue != null) _$WeekFieldMap['days']!: daysFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is WeekDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class WeekQuery implements QueryReference<Week, WeekQuerySnapshot> {
  @override
  WeekQuery limit(int limit);

  @override
  WeekQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  WeekQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  WeekQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  WeekQuery whereBeginDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  WeekQuery whereEndDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  WeekQuery whereDays({
    Map<DateTime, List<Map<String, String>>>? isEqualTo,
    Map<DateTime, List<Map<String, String>>>? isNotEqualTo,
    Map<DateTime, List<Map<String, String>>>? isLessThan,
    Map<DateTime, List<Map<String, String>>>? isLessThanOrEqualTo,
    Map<DateTime, List<Map<String, String>>>? isGreaterThan,
    Map<DateTime, List<Map<String, String>>>? isGreaterThanOrEqualTo,
    List<Map<DateTime, List<Map<String, String>>>>? whereIn,
    List<Map<DateTime, List<Map<String, String>>>>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  WeekQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    WeekDocumentSnapshot? startAtDocument,
    WeekDocumentSnapshot? endAtDocument,
    WeekDocumentSnapshot? endBeforeDocument,
    WeekDocumentSnapshot? startAfterDocument,
  });

  WeekQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    WeekDocumentSnapshot? startAtDocument,
    WeekDocumentSnapshot? endAtDocument,
    WeekDocumentSnapshot? endBeforeDocument,
    WeekDocumentSnapshot? startAfterDocument,
  });

  WeekQuery orderByBeginDate({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    WeekDocumentSnapshot? startAtDocument,
    WeekDocumentSnapshot? endAtDocument,
    WeekDocumentSnapshot? endBeforeDocument,
    WeekDocumentSnapshot? startAfterDocument,
  });

  WeekQuery orderByEndDate({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    WeekDocumentSnapshot? startAtDocument,
    WeekDocumentSnapshot? endAtDocument,
    WeekDocumentSnapshot? endBeforeDocument,
    WeekDocumentSnapshot? startAfterDocument,
  });

  WeekQuery orderByDays({
    bool descending = false,
    Map<DateTime, List<Map<String, String>>> startAt,
    Map<DateTime, List<Map<String, String>>> startAfter,
    Map<DateTime, List<Map<String, String>>> endAt,
    Map<DateTime, List<Map<String, String>>> endBefore,
    WeekDocumentSnapshot? startAtDocument,
    WeekDocumentSnapshot? endAtDocument,
    WeekDocumentSnapshot? endBeforeDocument,
    WeekDocumentSnapshot? startAfterDocument,
  });
}

class _$WeekQuery extends QueryReference<Week, WeekQuerySnapshot>
    implements WeekQuery {
  _$WeekQuery(
    this._collection, {
    required Query<Week> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<WeekQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(WeekQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<WeekQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(WeekQuerySnapshot._fromQuerySnapshot);
  }

  @override
  WeekQuery limit(int limit) {
    return _$WeekQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  WeekQuery limitToLast(int limit) {
    return _$WeekQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  WeekQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$WeekQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  WeekQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$WeekQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  WeekQuery whereBeginDate({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$WeekQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$WeekFieldMap['beginDate']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$WeekPerFieldToJson.beginDate(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$WeekPerFieldToJson.beginDate(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$WeekPerFieldToJson.beginDate(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$WeekPerFieldToJson.beginDate(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$WeekPerFieldToJson.beginDate(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$WeekPerFieldToJson.beginDate(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map((e) => _$WeekPerFieldToJson.beginDate(e)),
        whereNotIn: whereNotIn?.map((e) => _$WeekPerFieldToJson.beginDate(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  WeekQuery whereEndDate({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$WeekQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$WeekFieldMap['endDate']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$WeekPerFieldToJson.endDate(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$WeekPerFieldToJson.endDate(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$WeekPerFieldToJson.endDate(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$WeekPerFieldToJson.endDate(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$WeekPerFieldToJson.endDate(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$WeekPerFieldToJson.endDate(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map((e) => _$WeekPerFieldToJson.endDate(e)),
        whereNotIn: whereNotIn?.map((e) => _$WeekPerFieldToJson.endDate(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  WeekQuery whereDays({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<Map<DateTime, List<Map<String, String>>>>? whereIn,
    List<Map<DateTime, List<Map<String, String>>>>? whereNotIn,
    bool? isNull,
  }) {
    return _$WeekQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$WeekFieldMap['days']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$WeekPerFieldToJson
                .days(isEqualTo as Map<DateTime, List<Map<String, String>>>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$WeekPerFieldToJson
                .days(isNotEqualTo as Map<DateTime, List<Map<String, String>>>)
            : null,
        isLessThan: isLessThan != null
            ? _$WeekPerFieldToJson
                .days(isLessThan as Map<DateTime, List<Map<String, String>>>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$WeekPerFieldToJson.days(
                isLessThanOrEqualTo as Map<DateTime, List<Map<String, String>>>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$WeekPerFieldToJson
                .days(isGreaterThan as Map<DateTime, List<Map<String, String>>>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$WeekPerFieldToJson.days(isGreaterThanOrEqualTo
                as Map<DateTime, List<Map<String, String>>>)
            : null,
        whereIn: whereIn?.map((e) => _$WeekPerFieldToJson.days(e)),
        whereNotIn: whereNotIn?.map((e) => _$WeekPerFieldToJson.days(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  WeekQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WeekDocumentSnapshot? startAtDocument,
    WeekDocumentSnapshot? endAtDocument,
    WeekDocumentSnapshot? endBeforeDocument,
    WeekDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$WeekQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  WeekQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WeekDocumentSnapshot? startAtDocument,
    WeekDocumentSnapshot? endAtDocument,
    WeekDocumentSnapshot? endBeforeDocument,
    WeekDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$WeekQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  WeekQuery orderByBeginDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WeekDocumentSnapshot? startAtDocument,
    WeekDocumentSnapshot? endAtDocument,
    WeekDocumentSnapshot? endBeforeDocument,
    WeekDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$WeekFieldMap['beginDate']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$WeekQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  WeekQuery orderByEndDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WeekDocumentSnapshot? startAtDocument,
    WeekDocumentSnapshot? endAtDocument,
    WeekDocumentSnapshot? endBeforeDocument,
    WeekDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$WeekFieldMap['endDate']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$WeekQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  WeekQuery orderByDays({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WeekDocumentSnapshot? startAtDocument,
    WeekDocumentSnapshot? endAtDocument,
    WeekDocumentSnapshot? endBeforeDocument,
    WeekDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$WeekFieldMap['days']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$WeekQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$WeekQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class WeekDocumentSnapshot extends FirestoreDocumentSnapshot<Week> {
  WeekDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Week> snapshot;

  @override
  WeekDocumentReference get reference {
    return WeekDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Week? data;
}

class WeekQuerySnapshot
    extends FirestoreQuerySnapshot<Week, WeekQueryDocumentSnapshot> {
  WeekQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory WeekQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Week> snapshot,
  ) {
    final docs = snapshot.docs.map(WeekQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        WeekDocumentSnapshot._,
      );
    }).toList();

    return WeekQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<WeekDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    WeekDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<WeekDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Week> snapshot;

  @override
  final List<WeekQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<WeekDocumentSnapshot>> docChanges;
}

class WeekQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Week>
    implements WeekDocumentSnapshot {
  WeekQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Week> snapshot;

  @override
  final Week data;

  @override
  WeekDocumentReference get reference {
    return WeekDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ShoppingListCollectionReference
    implements
        ShoppingListQuery,
        FirestoreCollectionReference<ShoppingList, ShoppingListQuerySnapshot> {
  factory ShoppingListCollectionReference(
    DocumentReference<User> parent,
  ) = _$ShoppingListCollectionReference;

  static ShoppingList fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$ShoppingListFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    ShoppingList value,
    SetOptions? options,
  ) {
    return {..._$ShoppingListToJson(value)}..remove('id');
  }

  @override
  CollectionReference<ShoppingList> get reference;

  /// A reference to the containing [UserDocumentReference] if this is a subcollection.
  UserDocumentReference get parent;

  @override
  ShoppingListDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ShoppingListDocumentReference> add(ShoppingList value);
}

class _$ShoppingListCollectionReference extends _$ShoppingListQuery
    implements ShoppingListCollectionReference {
  factory _$ShoppingListCollectionReference(
    DocumentReference<User> parent,
  ) {
    return _$ShoppingListCollectionReference._(
      UserDocumentReference(parent),
      parent.collection('shoppinglists').withConverter(
            fromFirestore: ShoppingListCollectionReference.fromFirestore,
            toFirestore: ShoppingListCollectionReference.toFirestore,
          ),
    );
  }

  _$ShoppingListCollectionReference._(
    this.parent,
    CollectionReference<ShoppingList> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UserDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<ShoppingList> get reference =>
      super.reference as CollectionReference<ShoppingList>;

  @override
  ShoppingListDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ShoppingListDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ShoppingListDocumentReference> add(ShoppingList value) {
    return reference
        .add(value)
        .then((ref) => ShoppingListDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ShoppingListCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ShoppingListDocumentReference extends FirestoreDocumentReference<
    ShoppingList, ShoppingListDocumentSnapshot> {
  factory ShoppingListDocumentReference(
          DocumentReference<ShoppingList> reference) =
      _$ShoppingListDocumentReference;

  DocumentReference<ShoppingList> get reference;

  /// A reference to the [ShoppingListCollectionReference] containing this document.
  ShoppingListCollectionReference get parent {
    return _$ShoppingListCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  late final ShoppingListItemCollectionReference shoppinglistitems =
      _$ShoppingListItemCollectionReference(
    reference,
  );

  @override
  Stream<ShoppingListDocumentSnapshot> snapshots();

  @override
  Future<ShoppingListDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    DateTime beginDate,
    FieldValue beginDateFieldValue,
    DateTime endDate,
    FieldValue endDateFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    DateTime beginDate,
    FieldValue beginDateFieldValue,
    DateTime endDate,
    FieldValue endDateFieldValue,
  });
}

class _$ShoppingListDocumentReference extends FirestoreDocumentReference<
    ShoppingList,
    ShoppingListDocumentSnapshot> implements ShoppingListDocumentReference {
  _$ShoppingListDocumentReference(this.reference);

  @override
  final DocumentReference<ShoppingList> reference;

  /// A reference to the [ShoppingListCollectionReference] containing this document.
  ShoppingListCollectionReference get parent {
    return _$ShoppingListCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UserCollectionReference.fromFirestore,
        toFirestore: UserCollectionReference.toFirestore,
      ),
    );
  }

  late final ShoppingListItemCollectionReference shoppinglistitems =
      _$ShoppingListItemCollectionReference(
    reference,
  );

  @override
  Stream<ShoppingListDocumentSnapshot> snapshots() {
    return reference.snapshots().map(ShoppingListDocumentSnapshot._);
  }

  @override
  Future<ShoppingListDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ShoppingListDocumentSnapshot._);
  }

  @override
  Future<ShoppingListDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(ShoppingListDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? beginDate = _sentinel,
    FieldValue? beginDateFieldValue,
    Object? endDate = _sentinel,
    FieldValue? endDateFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      beginDate == _sentinel || beginDateFieldValue == null,
      "Cannot specify both beginDate and beginDateFieldValue",
    );
    assert(
      endDate == _sentinel || endDateFieldValue == null,
      "Cannot specify both endDate and endDateFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$ShoppingListFieldMap['name']!:
            _$ShoppingListPerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$ShoppingListFieldMap['name']!: nameFieldValue,
      if (beginDate != _sentinel)
        _$ShoppingListFieldMap['beginDate']!:
            _$ShoppingListPerFieldToJson.beginDate(beginDate as DateTime),
      if (beginDateFieldValue != null)
        _$ShoppingListFieldMap['beginDate']!: beginDateFieldValue,
      if (endDate != _sentinel)
        _$ShoppingListFieldMap['endDate']!:
            _$ShoppingListPerFieldToJson.endDate(endDate as DateTime),
      if (endDateFieldValue != null)
        _$ShoppingListFieldMap['endDate']!: endDateFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? beginDate = _sentinel,
    FieldValue? beginDateFieldValue,
    Object? endDate = _sentinel,
    FieldValue? endDateFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      beginDate == _sentinel || beginDateFieldValue == null,
      "Cannot specify both beginDate and beginDateFieldValue",
    );
    assert(
      endDate == _sentinel || endDateFieldValue == null,
      "Cannot specify both endDate and endDateFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$ShoppingListFieldMap['name']!:
            _$ShoppingListPerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$ShoppingListFieldMap['name']!: nameFieldValue,
      if (beginDate != _sentinel)
        _$ShoppingListFieldMap['beginDate']!:
            _$ShoppingListPerFieldToJson.beginDate(beginDate as DateTime),
      if (beginDateFieldValue != null)
        _$ShoppingListFieldMap['beginDate']!: beginDateFieldValue,
      if (endDate != _sentinel)
        _$ShoppingListFieldMap['endDate']!:
            _$ShoppingListPerFieldToJson.endDate(endDate as DateTime),
      if (endDateFieldValue != null)
        _$ShoppingListFieldMap['endDate']!: endDateFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingListDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class ShoppingListQuery
    implements QueryReference<ShoppingList, ShoppingListQuerySnapshot> {
  @override
  ShoppingListQuery limit(int limit);

  @override
  ShoppingListQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  ShoppingListQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  ShoppingListQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ShoppingListQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ShoppingListQuery whereBeginDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  ShoppingListQuery whereEndDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  ShoppingListQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    ShoppingListDocumentSnapshot? startAtDocument,
    ShoppingListDocumentSnapshot? endAtDocument,
    ShoppingListDocumentSnapshot? endBeforeDocument,
    ShoppingListDocumentSnapshot? startAfterDocument,
  });

  ShoppingListQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ShoppingListDocumentSnapshot? startAtDocument,
    ShoppingListDocumentSnapshot? endAtDocument,
    ShoppingListDocumentSnapshot? endBeforeDocument,
    ShoppingListDocumentSnapshot? startAfterDocument,
  });

  ShoppingListQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ShoppingListDocumentSnapshot? startAtDocument,
    ShoppingListDocumentSnapshot? endAtDocument,
    ShoppingListDocumentSnapshot? endBeforeDocument,
    ShoppingListDocumentSnapshot? startAfterDocument,
  });

  ShoppingListQuery orderByBeginDate({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    ShoppingListDocumentSnapshot? startAtDocument,
    ShoppingListDocumentSnapshot? endAtDocument,
    ShoppingListDocumentSnapshot? endBeforeDocument,
    ShoppingListDocumentSnapshot? startAfterDocument,
  });

  ShoppingListQuery orderByEndDate({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    ShoppingListDocumentSnapshot? startAtDocument,
    ShoppingListDocumentSnapshot? endAtDocument,
    ShoppingListDocumentSnapshot? endBeforeDocument,
    ShoppingListDocumentSnapshot? startAfterDocument,
  });
}

class _$ShoppingListQuery
    extends QueryReference<ShoppingList, ShoppingListQuerySnapshot>
    implements ShoppingListQuery {
  _$ShoppingListQuery(
    this._collection, {
    required Query<ShoppingList> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<ShoppingListQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(ShoppingListQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<ShoppingListQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(ShoppingListQuerySnapshot._fromQuerySnapshot);
  }

  @override
  ShoppingListQuery limit(int limit) {
    return _$ShoppingListQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListQuery limitToLast(int limit) {
    return _$ShoppingListQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShoppingListQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShoppingListQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListQuery whereName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShoppingListQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ShoppingListFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ShoppingListPerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ShoppingListPerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$ShoppingListPerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ShoppingListPerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ShoppingListPerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ShoppingListPerFieldToJson
                .name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$ShoppingListPerFieldToJson.name(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$ShoppingListPerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListQuery whereBeginDate({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShoppingListQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ShoppingListFieldMap['beginDate']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ShoppingListPerFieldToJson.beginDate(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ShoppingListPerFieldToJson.beginDate(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$ShoppingListPerFieldToJson.beginDate(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ShoppingListPerFieldToJson
                .beginDate(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ShoppingListPerFieldToJson.beginDate(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ShoppingListPerFieldToJson
                .beginDate(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map((e) => _$ShoppingListPerFieldToJson.beginDate(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$ShoppingListPerFieldToJson.beginDate(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListQuery whereEndDate({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShoppingListQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ShoppingListFieldMap['endDate']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ShoppingListPerFieldToJson.endDate(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ShoppingListPerFieldToJson.endDate(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$ShoppingListPerFieldToJson.endDate(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ShoppingListPerFieldToJson
                .endDate(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ShoppingListPerFieldToJson.endDate(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ShoppingListPerFieldToJson
                .endDate(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map((e) => _$ShoppingListPerFieldToJson.endDate(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$ShoppingListPerFieldToJson.endDate(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShoppingListDocumentSnapshot? startAtDocument,
    ShoppingListDocumentSnapshot? endAtDocument,
    ShoppingListDocumentSnapshot? endBeforeDocument,
    ShoppingListDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShoppingListQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShoppingListQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShoppingListDocumentSnapshot? startAtDocument,
    ShoppingListDocumentSnapshot? endAtDocument,
    ShoppingListDocumentSnapshot? endBeforeDocument,
    ShoppingListDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShoppingListQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShoppingListQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShoppingListDocumentSnapshot? startAtDocument,
    ShoppingListDocumentSnapshot? endAtDocument,
    ShoppingListDocumentSnapshot? endBeforeDocument,
    ShoppingListDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ShoppingListFieldMap['name']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShoppingListQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShoppingListQuery orderByBeginDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShoppingListDocumentSnapshot? startAtDocument,
    ShoppingListDocumentSnapshot? endAtDocument,
    ShoppingListDocumentSnapshot? endBeforeDocument,
    ShoppingListDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ShoppingListFieldMap['beginDate']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShoppingListQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShoppingListQuery orderByEndDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShoppingListDocumentSnapshot? startAtDocument,
    ShoppingListDocumentSnapshot? endAtDocument,
    ShoppingListDocumentSnapshot? endBeforeDocument,
    ShoppingListDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ShoppingListFieldMap['endDate']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShoppingListQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$ShoppingListQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ShoppingListDocumentSnapshot
    extends FirestoreDocumentSnapshot<ShoppingList> {
  ShoppingListDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<ShoppingList> snapshot;

  @override
  ShoppingListDocumentReference get reference {
    return ShoppingListDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ShoppingList? data;
}

class ShoppingListQuerySnapshot extends FirestoreQuerySnapshot<ShoppingList,
    ShoppingListQueryDocumentSnapshot> {
  ShoppingListQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory ShoppingListQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<ShoppingList> snapshot,
  ) {
    final docs =
        snapshot.docs.map(ShoppingListQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        ShoppingListDocumentSnapshot._,
      );
    }).toList();

    return ShoppingListQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<ShoppingListDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    ShoppingListDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<ShoppingListDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<ShoppingList> snapshot;

  @override
  final List<ShoppingListQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ShoppingListDocumentSnapshot>> docChanges;
}

class ShoppingListQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<ShoppingList>
    implements ShoppingListDocumentSnapshot {
  ShoppingListQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<ShoppingList> snapshot;

  @override
  final ShoppingList data;

  @override
  ShoppingListDocumentReference get reference {
    return ShoppingListDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ShoppingListItemCollectionReference
    implements
        ShoppingListItemQuery,
        FirestoreCollectionReference<ShoppingListItem,
            ShoppingListItemQuerySnapshot> {
  factory ShoppingListItemCollectionReference(
    DocumentReference<ShoppingList> parent,
  ) = _$ShoppingListItemCollectionReference;

  static ShoppingListItem fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$ShoppingListItemFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    ShoppingListItem value,
    SetOptions? options,
  ) {
    return {..._$ShoppingListItemToJson(value)}..remove('id');
  }

  @override
  CollectionReference<ShoppingListItem> get reference;

  /// A reference to the containing [ShoppingListDocumentReference] if this is a subcollection.
  ShoppingListDocumentReference get parent;

  @override
  ShoppingListItemDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ShoppingListItemDocumentReference> add(ShoppingListItem value);
}

class _$ShoppingListItemCollectionReference extends _$ShoppingListItemQuery
    implements ShoppingListItemCollectionReference {
  factory _$ShoppingListItemCollectionReference(
    DocumentReference<ShoppingList> parent,
  ) {
    return _$ShoppingListItemCollectionReference._(
      ShoppingListDocumentReference(parent),
      parent.collection('shoppinglistitems').withConverter(
            fromFirestore: ShoppingListItemCollectionReference.fromFirestore,
            toFirestore: ShoppingListItemCollectionReference.toFirestore,
          ),
    );
  }

  _$ShoppingListItemCollectionReference._(
    this.parent,
    CollectionReference<ShoppingListItem> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final ShoppingListDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<ShoppingListItem> get reference =>
      super.reference as CollectionReference<ShoppingListItem>;

  @override
  ShoppingListItemDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ShoppingListItemDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ShoppingListItemDocumentReference> add(ShoppingListItem value) {
    return reference
        .add(value)
        .then((ref) => ShoppingListItemDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ShoppingListItemCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ShoppingListItemDocumentReference
    extends FirestoreDocumentReference<ShoppingListItem,
        ShoppingListItemDocumentSnapshot> {
  factory ShoppingListItemDocumentReference(
          DocumentReference<ShoppingListItem> reference) =
      _$ShoppingListItemDocumentReference;

  DocumentReference<ShoppingListItem> get reference;

  /// A reference to the [ShoppingListItemCollectionReference] containing this document.
  ShoppingListItemCollectionReference get parent {
    return _$ShoppingListItemCollectionReference(
      reference.parent.parent!.withConverter<ShoppingList>(
        fromFirestore: ShoppingListCollectionReference.fromFirestore,
        toFirestore: ShoppingListCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ShoppingListItemDocumentSnapshot> snapshots();

  @override
  Future<ShoppingListItemDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String item,
    FieldValue itemFieldValue,
    String? quantity,
    FieldValue quantityFieldValue,
    bool isSelected,
    FieldValue isSelectedFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String item,
    FieldValue itemFieldValue,
    String? quantity,
    FieldValue quantityFieldValue,
    bool isSelected,
    FieldValue isSelectedFieldValue,
  });
}

class _$ShoppingListItemDocumentReference extends FirestoreDocumentReference<
        ShoppingListItem, ShoppingListItemDocumentSnapshot>
    implements ShoppingListItemDocumentReference {
  _$ShoppingListItemDocumentReference(this.reference);

  @override
  final DocumentReference<ShoppingListItem> reference;

  /// A reference to the [ShoppingListItemCollectionReference] containing this document.
  ShoppingListItemCollectionReference get parent {
    return _$ShoppingListItemCollectionReference(
      reference.parent.parent!.withConverter<ShoppingList>(
        fromFirestore: ShoppingListCollectionReference.fromFirestore,
        toFirestore: ShoppingListCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ShoppingListItemDocumentSnapshot> snapshots() {
    return reference.snapshots().map(ShoppingListItemDocumentSnapshot._);
  }

  @override
  Future<ShoppingListItemDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ShoppingListItemDocumentSnapshot._);
  }

  @override
  Future<ShoppingListItemDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(ShoppingListItemDocumentSnapshot._);
  }

  Future<void> update({
    Object? item = _sentinel,
    FieldValue? itemFieldValue,
    Object? quantity = _sentinel,
    FieldValue? quantityFieldValue,
    Object? isSelected = _sentinel,
    FieldValue? isSelectedFieldValue,
  }) async {
    assert(
      item == _sentinel || itemFieldValue == null,
      "Cannot specify both item and itemFieldValue",
    );
    assert(
      quantity == _sentinel || quantityFieldValue == null,
      "Cannot specify both quantity and quantityFieldValue",
    );
    assert(
      isSelected == _sentinel || isSelectedFieldValue == null,
      "Cannot specify both isSelected and isSelectedFieldValue",
    );
    final json = {
      if (item != _sentinel)
        _$ShoppingListItemFieldMap['item']!:
            _$ShoppingListItemPerFieldToJson.item(item as String),
      if (itemFieldValue != null)
        _$ShoppingListItemFieldMap['item']!: itemFieldValue,
      if (quantity != _sentinel)
        _$ShoppingListItemFieldMap['quantity']!:
            _$ShoppingListItemPerFieldToJson.quantity(quantity as String?),
      if (quantityFieldValue != null)
        _$ShoppingListItemFieldMap['quantity']!: quantityFieldValue,
      if (isSelected != _sentinel)
        _$ShoppingListItemFieldMap['isSelected']!:
            _$ShoppingListItemPerFieldToJson.isSelected(isSelected as bool),
      if (isSelectedFieldValue != null)
        _$ShoppingListItemFieldMap['isSelected']!: isSelectedFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? item = _sentinel,
    FieldValue? itemFieldValue,
    Object? quantity = _sentinel,
    FieldValue? quantityFieldValue,
    Object? isSelected = _sentinel,
    FieldValue? isSelectedFieldValue,
  }) {
    assert(
      item == _sentinel || itemFieldValue == null,
      "Cannot specify both item and itemFieldValue",
    );
    assert(
      quantity == _sentinel || quantityFieldValue == null,
      "Cannot specify both quantity and quantityFieldValue",
    );
    assert(
      isSelected == _sentinel || isSelectedFieldValue == null,
      "Cannot specify both isSelected and isSelectedFieldValue",
    );
    final json = {
      if (item != _sentinel)
        _$ShoppingListItemFieldMap['item']!:
            _$ShoppingListItemPerFieldToJson.item(item as String),
      if (itemFieldValue != null)
        _$ShoppingListItemFieldMap['item']!: itemFieldValue,
      if (quantity != _sentinel)
        _$ShoppingListItemFieldMap['quantity']!:
            _$ShoppingListItemPerFieldToJson.quantity(quantity as String?),
      if (quantityFieldValue != null)
        _$ShoppingListItemFieldMap['quantity']!: quantityFieldValue,
      if (isSelected != _sentinel)
        _$ShoppingListItemFieldMap['isSelected']!:
            _$ShoppingListItemPerFieldToJson.isSelected(isSelected as bool),
      if (isSelectedFieldValue != null)
        _$ShoppingListItemFieldMap['isSelected']!: isSelectedFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingListItemDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class ShoppingListItemQuery
    implements QueryReference<ShoppingListItem, ShoppingListItemQuerySnapshot> {
  @override
  ShoppingListItemQuery limit(int limit);

  @override
  ShoppingListItemQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  ShoppingListItemQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  ShoppingListItemQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ShoppingListItemQuery whereItem({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ShoppingListItemQuery whereQuantity({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  ShoppingListItemQuery whereIsSelected({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  ShoppingListItemQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    ShoppingListItemDocumentSnapshot? startAtDocument,
    ShoppingListItemDocumentSnapshot? endAtDocument,
    ShoppingListItemDocumentSnapshot? endBeforeDocument,
    ShoppingListItemDocumentSnapshot? startAfterDocument,
  });

  ShoppingListItemQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ShoppingListItemDocumentSnapshot? startAtDocument,
    ShoppingListItemDocumentSnapshot? endAtDocument,
    ShoppingListItemDocumentSnapshot? endBeforeDocument,
    ShoppingListItemDocumentSnapshot? startAfterDocument,
  });

  ShoppingListItemQuery orderByItem({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ShoppingListItemDocumentSnapshot? startAtDocument,
    ShoppingListItemDocumentSnapshot? endAtDocument,
    ShoppingListItemDocumentSnapshot? endBeforeDocument,
    ShoppingListItemDocumentSnapshot? startAfterDocument,
  });

  ShoppingListItemQuery orderByQuantity({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ShoppingListItemDocumentSnapshot? startAtDocument,
    ShoppingListItemDocumentSnapshot? endAtDocument,
    ShoppingListItemDocumentSnapshot? endBeforeDocument,
    ShoppingListItemDocumentSnapshot? startAfterDocument,
  });

  ShoppingListItemQuery orderByIsSelected({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    ShoppingListItemDocumentSnapshot? startAtDocument,
    ShoppingListItemDocumentSnapshot? endAtDocument,
    ShoppingListItemDocumentSnapshot? endBeforeDocument,
    ShoppingListItemDocumentSnapshot? startAfterDocument,
  });
}

class _$ShoppingListItemQuery
    extends QueryReference<ShoppingListItem, ShoppingListItemQuerySnapshot>
    implements ShoppingListItemQuery {
  _$ShoppingListItemQuery(
    this._collection, {
    required Query<ShoppingListItem> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<ShoppingListItemQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(ShoppingListItemQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<ShoppingListItemQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(ShoppingListItemQuerySnapshot._fromQuerySnapshot);
  }

  @override
  ShoppingListItemQuery limit(int limit) {
    return _$ShoppingListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListItemQuery limitToLast(int limit) {
    return _$ShoppingListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListItemQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShoppingListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListItemQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShoppingListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListItemQuery whereItem({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShoppingListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ShoppingListItemFieldMap['item']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ShoppingListItemPerFieldToJson.item(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ShoppingListItemPerFieldToJson.item(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$ShoppingListItemPerFieldToJson.item(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ShoppingListItemPerFieldToJson
                .item(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ShoppingListItemPerFieldToJson.item(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ShoppingListItemPerFieldToJson
                .item(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$ShoppingListItemPerFieldToJson.item(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$ShoppingListItemPerFieldToJson.item(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListItemQuery whereQuantity({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShoppingListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ShoppingListItemFieldMap['quantity']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ShoppingListItemPerFieldToJson.quantity(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ShoppingListItemPerFieldToJson.quantity(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$ShoppingListItemPerFieldToJson.quantity(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ShoppingListItemPerFieldToJson
                .quantity(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ShoppingListItemPerFieldToJson
                .quantity(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ShoppingListItemPerFieldToJson
                .quantity(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn:
            whereIn?.map((e) => _$ShoppingListItemPerFieldToJson.quantity(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$ShoppingListItemPerFieldToJson.quantity(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListItemQuery whereIsSelected({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShoppingListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ShoppingListItemFieldMap['isSelected']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ShoppingListItemPerFieldToJson.isSelected(isEqualTo as bool)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ShoppingListItemPerFieldToJson.isSelected(isNotEqualTo as bool)
            : null,
        isLessThan: isLessThan != null
            ? _$ShoppingListItemPerFieldToJson.isSelected(isLessThan as bool)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ShoppingListItemPerFieldToJson
                .isSelected(isLessThanOrEqualTo as bool)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ShoppingListItemPerFieldToJson.isSelected(isGreaterThan as bool)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ShoppingListItemPerFieldToJson
                .isSelected(isGreaterThanOrEqualTo as bool)
            : null,
        whereIn:
            whereIn?.map((e) => _$ShoppingListItemPerFieldToJson.isSelected(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$ShoppingListItemPerFieldToJson.isSelected(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShoppingListItemQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShoppingListItemDocumentSnapshot? startAtDocument,
    ShoppingListItemDocumentSnapshot? endAtDocument,
    ShoppingListItemDocumentSnapshot? endBeforeDocument,
    ShoppingListItemDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShoppingListItemQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShoppingListItemQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShoppingListItemDocumentSnapshot? startAtDocument,
    ShoppingListItemDocumentSnapshot? endAtDocument,
    ShoppingListItemDocumentSnapshot? endBeforeDocument,
    ShoppingListItemDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShoppingListItemQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShoppingListItemQuery orderByItem({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShoppingListItemDocumentSnapshot? startAtDocument,
    ShoppingListItemDocumentSnapshot? endAtDocument,
    ShoppingListItemDocumentSnapshot? endBeforeDocument,
    ShoppingListItemDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ShoppingListItemFieldMap['item']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShoppingListItemQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShoppingListItemQuery orderByQuantity({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShoppingListItemDocumentSnapshot? startAtDocument,
    ShoppingListItemDocumentSnapshot? endAtDocument,
    ShoppingListItemDocumentSnapshot? endBeforeDocument,
    ShoppingListItemDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ShoppingListItemFieldMap['quantity']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShoppingListItemQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShoppingListItemQuery orderByIsSelected({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShoppingListItemDocumentSnapshot? startAtDocument,
    ShoppingListItemDocumentSnapshot? endAtDocument,
    ShoppingListItemDocumentSnapshot? endBeforeDocument,
    ShoppingListItemDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ShoppingListItemFieldMap['isSelected']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShoppingListItemQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$ShoppingListItemQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ShoppingListItemDocumentSnapshot
    extends FirestoreDocumentSnapshot<ShoppingListItem> {
  ShoppingListItemDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<ShoppingListItem> snapshot;

  @override
  ShoppingListItemDocumentReference get reference {
    return ShoppingListItemDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ShoppingListItem? data;
}

class ShoppingListItemQuerySnapshot extends FirestoreQuerySnapshot<
    ShoppingListItem, ShoppingListItemQueryDocumentSnapshot> {
  ShoppingListItemQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory ShoppingListItemQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<ShoppingListItem> snapshot,
  ) {
    final docs =
        snapshot.docs.map(ShoppingListItemQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        ShoppingListItemDocumentSnapshot._,
      );
    }).toList();

    return ShoppingListItemQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<ShoppingListItemDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    ShoppingListItemDocumentSnapshot Function(DocumentSnapshot<T> doc)
        decodeDoc,
  ) {
    return FirestoreDocumentChange<ShoppingListItemDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<ShoppingListItem> snapshot;

  @override
  final List<ShoppingListItemQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ShoppingListItemDocumentSnapshot>>
      docChanges;
}

class ShoppingListItemQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<ShoppingListItem>
    implements ShoppingListItemDocumentSnapshot {
  ShoppingListItemQueryDocumentSnapshot._(this.snapshot)
      : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<ShoppingListItem> snapshot;

  @override
  final ShoppingListItem data;

  @override
  ShoppingListItemDocumentReference get reference {
    return ShoppingListItemDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
    );

const _$UserFieldMap = <String, String>{
  'id': 'id',
};

// ignore: unused_element
abstract class _$UserPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      name: json['name'] as String,
      id: json['id'] as String?,
      type: json['type'] as String,
    );

const _$IngredientFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'type': 'type',
};

// ignore: unused_element
abstract class _$IngredientPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? type(String instance) => instance;
}

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: json['id'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
      recipes: (json['recipes'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
      prepTime: json['prepTime'] as String,
      cookTime: json['cookTime'] as String,
      description: json['description'] as String,
      instructions: json['instructions'] as String,
      name: json['name'] as String,
    );

const _$RecipeFieldMap = <String, String>{
  'id': 'id',
  'ingredients': 'ingredients',
  'recipes': 'recipes',
  'prepTime': 'prepTime',
  'cookTime': 'cookTime',
  'description': 'description',
  'instructions': 'instructions',
  'name': 'name',
};

// ignore: unused_element
abstract class _$RecipePerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? ingredients(List<Map<String, String>> instance) => instance;
  // ignore: unused_element
  static Object? recipes(List<Map<String, String>> instance) => instance;
  // ignore: unused_element
  static Object? prepTime(String instance) => instance;
  // ignore: unused_element
  static Object? cookTime(String instance) => instance;
  // ignore: unused_element
  static Object? description(String instance) => instance;
  // ignore: unused_element
  static Object? instructions(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'ingredients': instance.ingredients,
      'recipes': instance.recipes,
      'prepTime': instance.prepTime,
      'cookTime': instance.cookTime,
      'description': instance.description,
      'instructions': instance.instructions,
      'name': instance.name,
    };

Week _$WeekFromJson(Map<String, dynamic> json) => Week(
      id: json['id'] as String?,
      beginDate: const FirestoreDateTimeConverter()
          .fromJson(json['beginDate'] as Timestamp),
      endDate: const FirestoreDateTimeConverter()
          .fromJson(json['endDate'] as Timestamp),
      days: (json['days'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            DateTime.parse(k),
            (e as List<dynamic>)
                .map((e) => Map<String, String>.from(e as Map))
                .toList()),
      ),
    );

const _$WeekFieldMap = <String, String>{
  'id': 'id',
  'beginDate': 'beginDate',
  'endDate': 'endDate',
  'days': 'days',
};

// ignore: unused_element
abstract class _$WeekPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? beginDate(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? endDate(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? days(Map<DateTime, List<Map<String, String>>> instance) =>
      instance.map((k, e) => MapEntry(k.toIso8601String(), e));
}

Map<String, dynamic> _$WeekToJson(Week instance) => <String, dynamic>{
      'id': instance.id,
      'beginDate':
          const FirestoreDateTimeConverter().toJson(instance.beginDate),
      'endDate': const FirestoreDateTimeConverter().toJson(instance.endDate),
      'days': instance.days.map((k, e) => MapEntry(k.toIso8601String(), e)),
    };

ShoppingList _$ShoppingListFromJson(Map<String, dynamic> json) => ShoppingList(
      id: json['id'] as String?,
      name: json['name'] as String,
      beginDate: const FirestoreDateTimeConverter()
          .fromJson(json['beginDate'] as Timestamp),
      endDate: const FirestoreDateTimeConverter()
          .fromJson(json['endDate'] as Timestamp),
    );

const _$ShoppingListFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'beginDate': 'beginDate',
  'endDate': 'endDate',
};

// ignore: unused_element
abstract class _$ShoppingListPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? beginDate(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? endDate(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
}

Map<String, dynamic> _$ShoppingListToJson(ShoppingList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'beginDate':
          const FirestoreDateTimeConverter().toJson(instance.beginDate),
      'endDate': const FirestoreDateTimeConverter().toJson(instance.endDate),
    };

ShoppingListItem _$ShoppingListItemFromJson(Map<String, dynamic> json) =>
    ShoppingListItem(
      id: json['id'] as String?,
      isSelected: json['isSelected'] as bool?,
      item: json['item'] as String,
      quantity: json['quantity'] as String?,
    );

const _$ShoppingListItemFieldMap = <String, String>{
  'id': 'id',
  'item': 'item',
  'quantity': 'quantity',
  'isSelected': 'isSelected',
};

// ignore: unused_element
abstract class _$ShoppingListItemPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? item(String instance) => instance;
  // ignore: unused_element
  static Object? quantity(String? instance) => instance;
  // ignore: unused_element
  static Object? isSelected(bool instance) => instance;
}

Map<String, dynamic> _$ShoppingListItemToJson(ShoppingListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'quantity': instance.quantity,
      'isSelected': instance.isSelected,
    };
