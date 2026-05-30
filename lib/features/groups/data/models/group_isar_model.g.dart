// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGroupIsarModelCollection on Isar {
  IsarCollection<GroupIsarModel> get groupIsarModels => this.collection();
}

const GroupIsarModelSchema = CollectionSchema(
  name: r'GroupIsarModel',
  id: -1427457704184604518,
  properties: {
    r'academicYear': PropertySchema(
      id: 0,
      name: r'academicYear',
      type: IsarType.string,
    ),
    r'day1': PropertySchema(
      id: 1,
      name: r'day1',
      type: IsarType.string,
    ),
    r'day2': PropertySchema(
      id: 2,
      name: r'day2',
      type: IsarType.string,
    ),
    r'gradeLevel': PropertySchema(
      id: 3,
      name: r'gradeLevel',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 4,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 6,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'sessionDuration': PropertySchema(
      id: 7,
      name: r'sessionDuration',
      type: IsarType.long,
    ),
    r'time1': PropertySchema(
      id: 8,
      name: r'time1',
      type: IsarType.string,
    ),
    r'time2': PropertySchema(
      id: 9,
      name: r'time2',
      type: IsarType.string,
    )
  },
  estimateSize: _groupIsarModelEstimateSize,
  serialize: _groupIsarModelSerialize,
  deserialize: _groupIsarModelDeserialize,
  deserializeProp: _groupIsarModelDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'remoteId': IndexSchema(
      id: 6301175856541681032,
      name: r'remoteId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'remoteId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _groupIsarModelGetId,
  getLinks: _groupIsarModelGetLinks,
  attach: _groupIsarModelAttach,
  version: '3.1.0+1',
);

int _groupIsarModelEstimateSize(
  GroupIsarModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.academicYear.length * 3;
  bytesCount += 3 + object.day1.length * 3;
  bytesCount += 3 + object.day2.length * 3;
  bytesCount += 3 + object.gradeLevel.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.remoteId.length * 3;
  bytesCount += 3 + object.time1.length * 3;
  bytesCount += 3 + object.time2.length * 3;
  return bytesCount;
}

void _groupIsarModelSerialize(
  GroupIsarModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.academicYear);
  writer.writeString(offsets[1], object.day1);
  writer.writeString(offsets[2], object.day2);
  writer.writeString(offsets[3], object.gradeLevel);
  writer.writeBool(offsets[4], object.isSynced);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.remoteId);
  writer.writeLong(offsets[7], object.sessionDuration);
  writer.writeString(offsets[8], object.time1);
  writer.writeString(offsets[9], object.time2);
}

GroupIsarModel _groupIsarModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GroupIsarModel();
  object.academicYear = reader.readString(offsets[0]);
  object.day1 = reader.readString(offsets[1]);
  object.day2 = reader.readString(offsets[2]);
  object.gradeLevel = reader.readString(offsets[3]);
  object.isSynced = reader.readBool(offsets[4]);
  object.isarId = id;
  object.name = reader.readString(offsets[5]);
  object.remoteId = reader.readString(offsets[6]);
  object.sessionDuration = reader.readLong(offsets[7]);
  object.time1 = reader.readString(offsets[8]);
  object.time2 = reader.readString(offsets[9]);
  return object;
}

P _groupIsarModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _groupIsarModelGetId(GroupIsarModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _groupIsarModelGetLinks(GroupIsarModel object) {
  return [];
}

void _groupIsarModelAttach(
    IsarCollection<dynamic> col, Id id, GroupIsarModel object) {
  object.isarId = id;
}

extension GroupIsarModelByIndex on IsarCollection<GroupIsarModel> {
  Future<GroupIsarModel?> getByRemoteId(String remoteId) {
    return getByIndex(r'remoteId', [remoteId]);
  }

  GroupIsarModel? getByRemoteIdSync(String remoteId) {
    return getByIndexSync(r'remoteId', [remoteId]);
  }

  Future<bool> deleteByRemoteId(String remoteId) {
    return deleteByIndex(r'remoteId', [remoteId]);
  }

  bool deleteByRemoteIdSync(String remoteId) {
    return deleteByIndexSync(r'remoteId', [remoteId]);
  }

  Future<List<GroupIsarModel?>> getAllByRemoteId(List<String> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'remoteId', values);
  }

  List<GroupIsarModel?> getAllByRemoteIdSync(List<String> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'remoteId', values);
  }

  Future<int> deleteAllByRemoteId(List<String> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'remoteId', values);
  }

  int deleteAllByRemoteIdSync(List<String> remoteIdValues) {
    final values = remoteIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'remoteId', values);
  }

  Future<Id> putByRemoteId(GroupIsarModel object) {
    return putByIndex(r'remoteId', object);
  }

  Id putByRemoteIdSync(GroupIsarModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'remoteId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRemoteId(List<GroupIsarModel> objects) {
    return putAllByIndex(r'remoteId', objects);
  }

  List<Id> putAllByRemoteIdSync(List<GroupIsarModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'remoteId', objects, saveLinks: saveLinks);
  }
}

extension GroupIsarModelQueryWhereSort
    on QueryBuilder<GroupIsarModel, GroupIsarModel, QWhere> {
  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GroupIsarModelQueryWhere
    on QueryBuilder<GroupIsarModel, GroupIsarModel, QWhereClause> {
  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterWhereClause>
      remoteIdEqualTo(String remoteId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteId',
        value: [remoteId],
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterWhereClause>
      remoteIdNotEqualTo(String remoteId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [],
              upper: [remoteId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [remoteId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [remoteId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteId',
              lower: [],
              upper: [remoteId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension GroupIsarModelQueryFilter
    on QueryBuilder<GroupIsarModel, GroupIsarModel, QFilterCondition> {
  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      academicYearEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      academicYearGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      academicYearLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      academicYearBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'academicYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      academicYearStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      academicYearEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      academicYearContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      academicYearMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'academicYear',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      academicYearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'academicYear',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      academicYearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'academicYear',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day1EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day1GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'day1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day1LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'day1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day1Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'day1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'day1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'day1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day1Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'day1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day1Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'day1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day1',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'day1',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day2EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day2GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'day2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day2LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'day2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day2Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'day2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'day2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'day2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'day2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day2Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'day2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day2',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      day2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'day2',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      gradeLevelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gradeLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      gradeLevelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gradeLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      gradeLevelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gradeLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      gradeLevelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gradeLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      gradeLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gradeLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      gradeLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gradeLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      gradeLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gradeLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      gradeLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gradeLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      gradeLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gradeLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      gradeLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gradeLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      remoteIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      remoteIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      remoteIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      remoteIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      sessionDurationEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      sessionDurationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sessionDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      sessionDurationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sessionDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      sessionDurationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sessionDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time1EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time1GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time1LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time1Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'time1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'time1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time1Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'time1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time1Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'time1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time1',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'time1',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time2EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time2GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time2LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time2Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'time2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'time2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'time2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time2Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'time2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time2',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterFilterCondition>
      time2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'time2',
        value: '',
      ));
    });
  }
}

extension GroupIsarModelQueryObject
    on QueryBuilder<GroupIsarModel, GroupIsarModel, QFilterCondition> {}

extension GroupIsarModelQueryLinks
    on QueryBuilder<GroupIsarModel, GroupIsarModel, QFilterCondition> {}

extension GroupIsarModelQuerySortBy
    on QueryBuilder<GroupIsarModel, GroupIsarModel, QSortBy> {
  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      sortByAcademicYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'academicYear', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      sortByAcademicYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'academicYear', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> sortByDay1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day1', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> sortByDay1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day1', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> sortByDay2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day2', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> sortByDay2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day2', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      sortByGradeLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradeLevel', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      sortByGradeLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradeLevel', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      sortBySessionDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionDuration', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      sortBySessionDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionDuration', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> sortByTime1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time1', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> sortByTime1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time1', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> sortByTime2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time2', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> sortByTime2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time2', Sort.desc);
    });
  }
}

extension GroupIsarModelQuerySortThenBy
    on QueryBuilder<GroupIsarModel, GroupIsarModel, QSortThenBy> {
  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      thenByAcademicYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'academicYear', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      thenByAcademicYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'academicYear', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByDay1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day1', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByDay1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day1', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByDay2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day2', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByDay2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day2', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      thenByGradeLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradeLevel', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      thenByGradeLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradeLevel', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      thenBySessionDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionDuration', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy>
      thenBySessionDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionDuration', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByTime1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time1', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByTime1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time1', Sort.desc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByTime2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time2', Sort.asc);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QAfterSortBy> thenByTime2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time2', Sort.desc);
    });
  }
}

extension GroupIsarModelQueryWhereDistinct
    on QueryBuilder<GroupIsarModel, GroupIsarModel, QDistinct> {
  QueryBuilder<GroupIsarModel, GroupIsarModel, QDistinct>
      distinctByAcademicYear({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'academicYear', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QDistinct> distinctByDay1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'day1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QDistinct> distinctByDay2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'day2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QDistinct> distinctByGradeLevel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gradeLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QDistinct>
      distinctBySessionDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionDuration');
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QDistinct> distinctByTime1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupIsarModel, GroupIsarModel, QDistinct> distinctByTime2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time2', caseSensitive: caseSensitive);
    });
  }
}

extension GroupIsarModelQueryProperty
    on QueryBuilder<GroupIsarModel, GroupIsarModel, QQueryProperty> {
  QueryBuilder<GroupIsarModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<GroupIsarModel, String, QQueryOperations>
      academicYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'academicYear');
    });
  }

  QueryBuilder<GroupIsarModel, String, QQueryOperations> day1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'day1');
    });
  }

  QueryBuilder<GroupIsarModel, String, QQueryOperations> day2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'day2');
    });
  }

  QueryBuilder<GroupIsarModel, String, QQueryOperations> gradeLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gradeLevel');
    });
  }

  QueryBuilder<GroupIsarModel, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<GroupIsarModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<GroupIsarModel, String, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<GroupIsarModel, int, QQueryOperations>
      sessionDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionDuration');
    });
  }

  QueryBuilder<GroupIsarModel, String, QQueryOperations> time1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time1');
    });
  }

  QueryBuilder<GroupIsarModel, String, QQueryOperations> time2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time2');
    });
  }
}
