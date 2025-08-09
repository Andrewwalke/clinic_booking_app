// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppointmentModelCollection on Isar {
  IsarCollection<AppointmentModel> get appointmentModels => this.collection();
}

const AppointmentModelSchema = CollectionSchema(
  name: r'AppointmentModel',
  id: 4476696744840279614,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.string,
    ),
    r'doctorName': PropertySchema(
      id: 1,
      name: r'doctorName',
      type: IsarType.string,
    ),
    r'hospitalName': PropertySchema(
      id: 2,
      name: r'hospitalName',
      type: IsarType.string,
    ),
    r'imageUrl': PropertySchema(
      id: 3,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 4,
      name: r'price',
      type: IsarType.long,
    ),
    r'specialty': PropertySchema(
      id: 5,
      name: r'specialty',
      type: IsarType.string,
    ),
    r'time': PropertySchema(
      id: 6,
      name: r'time',
      type: IsarType.string,
    )
  },
  estimateSize: _appointmentModelEstimateSize,
  serialize: _appointmentModelSerialize,
  deserialize: _appointmentModelDeserialize,
  deserializeProp: _appointmentModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _appointmentModelGetId,
  getLinks: _appointmentModelGetLinks,
  attach: _appointmentModelAttach,
  version: '3.1.0+1',
);

int _appointmentModelEstimateSize(
  AppointmentModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.date.length * 3;
  bytesCount += 3 + object.doctorName.length * 3;
  bytesCount += 3 + object.hospitalName.length * 3;
  bytesCount += 3 + object.imageUrl.length * 3;
  bytesCount += 3 + object.specialty.length * 3;
  bytesCount += 3 + object.time.length * 3;
  return bytesCount;
}

void _appointmentModelSerialize(
  AppointmentModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.date);
  writer.writeString(offsets[1], object.doctorName);
  writer.writeString(offsets[2], object.hospitalName);
  writer.writeString(offsets[3], object.imageUrl);
  writer.writeLong(offsets[4], object.price);
  writer.writeString(offsets[5], object.specialty);
  writer.writeString(offsets[6], object.time);
}

AppointmentModel _appointmentModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppointmentModel();
  object.date = reader.readString(offsets[0]);
  object.doctorName = reader.readString(offsets[1]);
  object.hospitalName = reader.readString(offsets[2]);
  object.id = id;
  object.imageUrl = reader.readString(offsets[3]);
  object.price = reader.readLong(offsets[4]);
  object.specialty = reader.readString(offsets[5]);
  object.time = reader.readString(offsets[6]);
  return object;
}

P _appointmentModelDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appointmentModelGetId(AppointmentModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appointmentModelGetLinks(AppointmentModel object) {
  return [];
}

void _appointmentModelAttach(
    IsarCollection<dynamic> col, Id id, AppointmentModel object) {
  object.id = id;
}

extension AppointmentModelQueryWhereSort
    on QueryBuilder<AppointmentModel, AppointmentModel, QWhere> {
  QueryBuilder<AppointmentModel, AppointmentModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppointmentModelQueryWhere
    on QueryBuilder<AppointmentModel, AppointmentModel, QWhereClause> {
  QueryBuilder<AppointmentModel, AppointmentModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppointmentModelQueryFilter
    on QueryBuilder<AppointmentModel, AppointmentModel, QFilterCondition> {
  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      dateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      dateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      doctorNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doctorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      doctorNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'doctorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      doctorNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'doctorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      doctorNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'doctorName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      doctorNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'doctorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      doctorNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'doctorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      doctorNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'doctorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      doctorNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'doctorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      doctorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doctorName',
        value: '',
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      doctorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'doctorName',
        value: '',
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      hospitalNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      hospitalNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      hospitalNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      hospitalNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hospitalName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      hospitalNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      hospitalNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      hospitalNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      hospitalNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hospitalName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      hospitalNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hospitalName',
        value: '',
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      hospitalNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hospitalName',
        value: '',
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      imageUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      imageUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      imageUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      imageUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      priceEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      priceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      priceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      priceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      specialtyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'specialty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      specialtyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'specialty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      specialtyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'specialty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      specialtyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'specialty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      specialtyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'specialty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      specialtyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'specialty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      specialtyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'specialty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      specialtyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'specialty',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      specialtyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'specialty',
        value: '',
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      specialtyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'specialty',
        value: '',
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      timeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      timeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      timeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      timeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      timeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      timeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      timeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      timeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'time',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterFilterCondition>
      timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'time',
        value: '',
      ));
    });
  }
}

extension AppointmentModelQueryObject
    on QueryBuilder<AppointmentModel, AppointmentModel, QFilterCondition> {}

extension AppointmentModelQueryLinks
    on QueryBuilder<AppointmentModel, AppointmentModel, QFilterCondition> {}

extension AppointmentModelQuerySortBy
    on QueryBuilder<AppointmentModel, AppointmentModel, QSortBy> {
  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      sortByDoctorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorName', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      sortByDoctorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorName', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      sortByHospitalName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hospitalName', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      sortByHospitalNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hospitalName', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      sortBySpecialty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialty', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      sortBySpecialtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialty', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension AppointmentModelQuerySortThenBy
    on QueryBuilder<AppointmentModel, AppointmentModel, QSortThenBy> {
  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      thenByDoctorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorName', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      thenByDoctorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorName', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      thenByHospitalName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hospitalName', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      thenByHospitalNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hospitalName', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      thenBySpecialty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialty', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      thenBySpecialtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialty', Sort.desc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QAfterSortBy>
      thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension AppointmentModelQueryWhereDistinct
    on QueryBuilder<AppointmentModel, AppointmentModel, QDistinct> {
  QueryBuilder<AppointmentModel, AppointmentModel, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QDistinct>
      distinctByDoctorName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'doctorName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QDistinct>
      distinctByHospitalName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hospitalName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QDistinct>
      distinctByImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QDistinct>
      distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QDistinct>
      distinctBySpecialty({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'specialty', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppointmentModel, AppointmentModel, QDistinct> distinctByTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time', caseSensitive: caseSensitive);
    });
  }
}

extension AppointmentModelQueryProperty
    on QueryBuilder<AppointmentModel, AppointmentModel, QQueryProperty> {
  QueryBuilder<AppointmentModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppointmentModel, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<AppointmentModel, String, QQueryOperations>
      doctorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'doctorName');
    });
  }

  QueryBuilder<AppointmentModel, String, QQueryOperations>
      hospitalNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hospitalName');
    });
  }

  QueryBuilder<AppointmentModel, String, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<AppointmentModel, int, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<AppointmentModel, String, QQueryOperations> specialtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'specialty');
    });
  }

  QueryBuilder<AppointmentModel, String, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }
}
