// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AppTableTable extends AppTable with TableInfo<$AppTableTable, App> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v1());
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _updateTimeMeta =
      const VerificationMeta('updateTime');
  @override
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
      'update_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createTime, updateTime, name, icon];
  @override
  String get aliasedName => _alias ?? 'app';
  @override
  String get actualTableName => 'app';
  @override
  VerificationContext validateIntegrity(Insertable<App> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    }
    if (data.containsKey('update_time')) {
      context.handle(
          _updateTimeMeta,
          updateTime.isAcceptableOrUnknown(
              data['update_time']!, _updateTimeMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  App map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return App(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      updateTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
    );
  }

  @override
  $AppTableTable createAlias(String alias) {
    return $AppTableTable(attachedDatabase, alias);
  }
}

class App extends DataClass implements Insertable<App> {
  final String id;
  final DateTime createTime;
  final DateTime? updateTime;
  final String name;
  final String icon;
  const App(
      {required this.id,
      required this.createTime,
      this.updateTime,
      required this.name,
      required this.icon});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['create_time'] = Variable<DateTime>(createTime);
    if (!nullToAbsent || updateTime != null) {
      map['update_time'] = Variable<DateTime>(updateTime);
    }
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<String>(icon);
    return map;
  }

  AppTableCompanion toCompanion(bool nullToAbsent) {
    return AppTableCompanion(
      id: Value(id),
      createTime: Value(createTime),
      updateTime: updateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updateTime),
      name: Value(name),
      icon: Value(icon),
    );
  }

  factory App.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return App(
      id: serializer.fromJson<String>(json['id']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      updateTime: serializer.fromJson<DateTime?>(json['updateTime']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createTime': serializer.toJson<DateTime>(createTime),
      'updateTime': serializer.toJson<DateTime?>(updateTime),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<String>(icon),
    };
  }

  App copyWith(
          {String? id,
          DateTime? createTime,
          Value<DateTime?> updateTime = const Value.absent(),
          String? name,
          String? icon}) =>
      App(
        id: id ?? this.id,
        createTime: createTime ?? this.createTime,
        updateTime: updateTime.present ? updateTime.value : this.updateTime,
        name: name ?? this.name,
        icon: icon ?? this.icon,
      );
  @override
  String toString() {
    return (StringBuffer('App(')
          ..write('id: $id, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('name: $name, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createTime, updateTime, name, icon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is App &&
          other.id == this.id &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime &&
          other.name == this.name &&
          other.icon == this.icon);
}

class AppTableCompanion extends UpdateCompanion<App> {
  final Value<String> id;
  final Value<DateTime> createTime;
  final Value<DateTime?> updateTime;
  final Value<String> name;
  final Value<String> icon;
  final Value<int> rowid;
  const AppTableCompanion({
    this.id = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppTableCompanion.insert({
    this.id = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    required String name,
    required String icon,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        icon = Value(icon);
  static Insertable<App> custom({
    Expression<String>? id,
    Expression<DateTime>? createTime,
    Expression<DateTime>? updateTime,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createTime,
      Value<DateTime?>? updateTime,
      Value<String>? name,
      Value<String>? icon,
      Value<int>? rowid}) {
    return AppTableCompanion(
      id: id ?? this.id,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppTableCompanion(')
          ..write('id: $id, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShortcutTableTable extends ShortcutTable
    with TableInfo<$ShortcutTableTable, Shortcut> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShortcutTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v1());
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updateTimeMeta =
      const VerificationMeta('updateTime');
  @override
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
      'update_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, createTime, updateTime];
  @override
  String get aliasedName => _alias ?? 'shortcut';
  @override
  String get actualTableName => 'shortcut';
  @override
  VerificationContext validateIntegrity(Insertable<Shortcut> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    } else if (isInserting) {
      context.missing(_createTimeMeta);
    }
    if (data.containsKey('update_time')) {
      context.handle(
          _updateTimeMeta,
          updateTime.isAcceptableOrUnknown(
              data['update_time']!, _updateTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Shortcut map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Shortcut(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      updateTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time']),
    );
  }

  @override
  $ShortcutTableTable createAlias(String alias) {
    return $ShortcutTableTable(attachedDatabase, alias);
  }
}

class Shortcut extends DataClass implements Insertable<Shortcut> {
  final String id;
  final String name;
  final String description;
  final DateTime createTime;
  final DateTime? updateTime;
  const Shortcut(
      {required this.id,
      required this.name,
      required this.description,
      required this.createTime,
      this.updateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['create_time'] = Variable<DateTime>(createTime);
    if (!nullToAbsent || updateTime != null) {
      map['update_time'] = Variable<DateTime>(updateTime);
    }
    return map;
  }

  ShortcutTableCompanion toCompanion(bool nullToAbsent) {
    return ShortcutTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      createTime: Value(createTime),
      updateTime: updateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updateTime),
    );
  }

  factory Shortcut.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shortcut(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      updateTime: serializer.fromJson<DateTime?>(json['updateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'createTime': serializer.toJson<DateTime>(createTime),
      'updateTime': serializer.toJson<DateTime?>(updateTime),
    };
  }

  Shortcut copyWith(
          {String? id,
          String? name,
          String? description,
          DateTime? createTime,
          Value<DateTime?> updateTime = const Value.absent()}) =>
      Shortcut(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        createTime: createTime ?? this.createTime,
        updateTime: updateTime.present ? updateTime.value : this.updateTime,
      );
  @override
  String toString() {
    return (StringBuffer('Shortcut(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, createTime, updateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shortcut &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime);
}

class ShortcutTableCompanion extends UpdateCompanion<Shortcut> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> createTime;
  final Value<DateTime?> updateTime;
  final Value<int> rowid;
  const ShortcutTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShortcutTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required DateTime createTime,
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        description = Value(description),
        createTime = Value(createTime);
  static Insertable<Shortcut> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createTime,
    Expression<DateTime>? updateTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShortcutTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<DateTime>? createTime,
      Value<DateTime?>? updateTime,
      Value<int>? rowid}) {
    return ShortcutTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShortcutTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagTableTable extends TagTable with TableInfo<$TagTableTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v1());
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _updateTimeMeta =
      const VerificationMeta('updateTime');
  @override
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
      'update_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<TagType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<TagType>($TagTableTable.$convertertype);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createTime, updateTime, name, type];
  @override
  String get aliasedName => _alias ?? 'tag';
  @override
  String get actualTableName => 'tag';
  @override
  VerificationContext validateIntegrity(Insertable<Tag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    }
    if (data.containsKey('update_time')) {
      context.handle(
          _updateTimeMeta,
          updateTime.isAcceptableOrUnknown(
              data['update_time']!, _updateTimeMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      updateTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: $TagTableTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
    );
  }

  @override
  $TagTableTable createAlias(String alias) {
    return $TagTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TagType, int, int> $convertertype =
      const EnumIndexConverter<TagType>(TagType.values);
}

class Tag extends DataClass implements Insertable<Tag> {
  final String id;
  final DateTime createTime;
  final DateTime? updateTime;
  final String name;
  final TagType type;
  const Tag(
      {required this.id,
      required this.createTime,
      this.updateTime,
      required this.name,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['create_time'] = Variable<DateTime>(createTime);
    if (!nullToAbsent || updateTime != null) {
      map['update_time'] = Variable<DateTime>(updateTime);
    }
    map['name'] = Variable<String>(name);
    {
      final converter = $TagTableTable.$convertertype;
      map['type'] = Variable<int>(converter.toSql(type));
    }
    return map;
  }

  TagTableCompanion toCompanion(bool nullToAbsent) {
    return TagTableCompanion(
      id: Value(id),
      createTime: Value(createTime),
      updateTime: updateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updateTime),
      name: Value(name),
      type: Value(type),
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<String>(json['id']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      updateTime: serializer.fromJson<DateTime?>(json['updateTime']),
      name: serializer.fromJson<String>(json['name']),
      type: $TagTableTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createTime': serializer.toJson<DateTime>(createTime),
      'updateTime': serializer.toJson<DateTime?>(updateTime),
      'name': serializer.toJson<String>(name),
      'type':
          serializer.toJson<int>($TagTableTable.$convertertype.toJson(type)),
    };
  }

  Tag copyWith(
          {String? id,
          DateTime? createTime,
          Value<DateTime?> updateTime = const Value.absent(),
          String? name,
          TagType? type}) =>
      Tag(
        id: id ?? this.id,
        createTime: createTime ?? this.createTime,
        updateTime: updateTime.present ? updateTime.value : this.updateTime,
        name: name ?? this.name,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('name: $name, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createTime, updateTime, name, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime &&
          other.name == this.name &&
          other.type == this.type);
}

class TagTableCompanion extends UpdateCompanion<Tag> {
  final Value<String> id;
  final Value<DateTime> createTime;
  final Value<DateTime?> updateTime;
  final Value<String> name;
  final Value<TagType> type;
  final Value<int> rowid;
  const TagTableCompanion({
    this.id = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagTableCompanion.insert({
    this.id = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    required String name,
    required TagType type,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        type = Value(type);
  static Insertable<Tag> custom({
    Expression<String>? id,
    Expression<DateTime>? createTime,
    Expression<DateTime>? updateTime,
    Expression<String>? name,
    Expression<int>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createTime,
      Value<DateTime?>? updateTime,
      Value<String>? name,
      Value<TagType>? type,
      Value<int>? rowid}) {
    return TagTableCompanion(
      id: id ?? this.id,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      name: name ?? this.name,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      final converter = $TagTableTable.$convertertype;
      map['type'] = Variable<int>(converter.toSql(type.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagTableCompanion(')
          ..write('id: $id, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagAppMapTableTable extends TagAppMapTable
    with TableInfo<$TagAppMapTableTable, TagAppMap> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagAppMapTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tag (id)'));
  static const VerificationMeta _appIdMeta = const VerificationMeta('appId');
  @override
  late final GeneratedColumn<String> appId = GeneratedColumn<String>(
      'app_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES app (id)'));
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updateTimeMeta =
      const VerificationMeta('updateTime');
  @override
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
      'update_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [tagId, appId, createTime, updateTime];
  @override
  String get aliasedName => _alias ?? 'tag_app_map';
  @override
  String get actualTableName => 'tag_app_map';
  @override
  VerificationContext validateIntegrity(Insertable<TagAppMap> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    if (data.containsKey('app_id')) {
      context.handle(
          _appIdMeta, appId.isAcceptableOrUnknown(data['app_id']!, _appIdMeta));
    } else if (isInserting) {
      context.missing(_appIdMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    } else if (isInserting) {
      context.missing(_createTimeMeta);
    }
    if (data.containsKey('update_time')) {
      context.handle(
          _updateTimeMeta,
          updateTime.isAcceptableOrUnknown(
              data['update_time']!, _updateTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tagId, appId};
  @override
  TagAppMap map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagAppMap(
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag_id'])!,
      appId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}app_id'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      updateTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time']),
    );
  }

  @override
  $TagAppMapTableTable createAlias(String alias) {
    return $TagAppMapTableTable(attachedDatabase, alias);
  }
}

class TagAppMap extends DataClass implements Insertable<TagAppMap> {
  final String tagId;
  final String appId;
  final DateTime createTime;
  final DateTime? updateTime;
  const TagAppMap(
      {required this.tagId,
      required this.appId,
      required this.createTime,
      this.updateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tag_id'] = Variable<String>(tagId);
    map['app_id'] = Variable<String>(appId);
    map['create_time'] = Variable<DateTime>(createTime);
    if (!nullToAbsent || updateTime != null) {
      map['update_time'] = Variable<DateTime>(updateTime);
    }
    return map;
  }

  TagAppMapTableCompanion toCompanion(bool nullToAbsent) {
    return TagAppMapTableCompanion(
      tagId: Value(tagId),
      appId: Value(appId),
      createTime: Value(createTime),
      updateTime: updateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updateTime),
    );
  }

  factory TagAppMap.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagAppMap(
      tagId: serializer.fromJson<String>(json['tagId']),
      appId: serializer.fromJson<String>(json['appId']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      updateTime: serializer.fromJson<DateTime?>(json['updateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tagId': serializer.toJson<String>(tagId),
      'appId': serializer.toJson<String>(appId),
      'createTime': serializer.toJson<DateTime>(createTime),
      'updateTime': serializer.toJson<DateTime?>(updateTime),
    };
  }

  TagAppMap copyWith(
          {String? tagId,
          String? appId,
          DateTime? createTime,
          Value<DateTime?> updateTime = const Value.absent()}) =>
      TagAppMap(
        tagId: tagId ?? this.tagId,
        appId: appId ?? this.appId,
        createTime: createTime ?? this.createTime,
        updateTime: updateTime.present ? updateTime.value : this.updateTime,
      );
  @override
  String toString() {
    return (StringBuffer('TagAppMap(')
          ..write('tagId: $tagId, ')
          ..write('appId: $appId, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tagId, appId, createTime, updateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagAppMap &&
          other.tagId == this.tagId &&
          other.appId == this.appId &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime);
}

class TagAppMapTableCompanion extends UpdateCompanion<TagAppMap> {
  final Value<String> tagId;
  final Value<String> appId;
  final Value<DateTime> createTime;
  final Value<DateTime?> updateTime;
  final Value<int> rowid;
  const TagAppMapTableCompanion({
    this.tagId = const Value.absent(),
    this.appId = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagAppMapTableCompanion.insert({
    required String tagId,
    required String appId,
    required DateTime createTime,
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : tagId = Value(tagId),
        appId = Value(appId),
        createTime = Value(createTime);
  static Insertable<TagAppMap> custom({
    Expression<String>? tagId,
    Expression<String>? appId,
    Expression<DateTime>? createTime,
    Expression<DateTime>? updateTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tagId != null) 'tag_id': tagId,
      if (appId != null) 'app_id': appId,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagAppMapTableCompanion copyWith(
      {Value<String>? tagId,
      Value<String>? appId,
      Value<DateTime>? createTime,
      Value<DateTime?>? updateTime,
      Value<int>? rowid}) {
    return TagAppMapTableCompanion(
      tagId: tagId ?? this.tagId,
      appId: appId ?? this.appId,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (appId.present) {
      map['app_id'] = Variable<String>(appId.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagAppMapTableCompanion(')
          ..write('tagId: $tagId, ')
          ..write('appId: $appId, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagShortcutMapTableTable extends TagShortcutMapTable
    with TableInfo<$TagShortcutMapTableTable, TagShortcutMap> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagShortcutMapTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tag (id)'));
  static const VerificationMeta _shortcutIdMeta =
      const VerificationMeta('shortcutId');
  @override
  late final GeneratedColumn<String> shortcutId = GeneratedColumn<String>(
      'shortcut_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES shortcut (id)'));
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updateTimeMeta =
      const VerificationMeta('updateTime');
  @override
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
      'update_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [tagId, shortcutId, createTime, updateTime];
  @override
  String get aliasedName => _alias ?? 'tag_shortcut_map';
  @override
  String get actualTableName => 'tag_shortcut_map';
  @override
  VerificationContext validateIntegrity(Insertable<TagShortcutMap> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    if (data.containsKey('shortcut_id')) {
      context.handle(
          _shortcutIdMeta,
          shortcutId.isAcceptableOrUnknown(
              data['shortcut_id']!, _shortcutIdMeta));
    } else if (isInserting) {
      context.missing(_shortcutIdMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    } else if (isInserting) {
      context.missing(_createTimeMeta);
    }
    if (data.containsKey('update_time')) {
      context.handle(
          _updateTimeMeta,
          updateTime.isAcceptableOrUnknown(
              data['update_time']!, _updateTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tagId, shortcutId};
  @override
  TagShortcutMap map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagShortcutMap(
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag_id'])!,
      shortcutId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shortcut_id'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      updateTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time']),
    );
  }

  @override
  $TagShortcutMapTableTable createAlias(String alias) {
    return $TagShortcutMapTableTable(attachedDatabase, alias);
  }
}

class TagShortcutMap extends DataClass implements Insertable<TagShortcutMap> {
  final String tagId;
  final String shortcutId;
  final DateTime createTime;
  final DateTime? updateTime;
  const TagShortcutMap(
      {required this.tagId,
      required this.shortcutId,
      required this.createTime,
      this.updateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tag_id'] = Variable<String>(tagId);
    map['shortcut_id'] = Variable<String>(shortcutId);
    map['create_time'] = Variable<DateTime>(createTime);
    if (!nullToAbsent || updateTime != null) {
      map['update_time'] = Variable<DateTime>(updateTime);
    }
    return map;
  }

  TagShortcutMapTableCompanion toCompanion(bool nullToAbsent) {
    return TagShortcutMapTableCompanion(
      tagId: Value(tagId),
      shortcutId: Value(shortcutId),
      createTime: Value(createTime),
      updateTime: updateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updateTime),
    );
  }

  factory TagShortcutMap.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagShortcutMap(
      tagId: serializer.fromJson<String>(json['tagId']),
      shortcutId: serializer.fromJson<String>(json['shortcutId']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      updateTime: serializer.fromJson<DateTime?>(json['updateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tagId': serializer.toJson<String>(tagId),
      'shortcutId': serializer.toJson<String>(shortcutId),
      'createTime': serializer.toJson<DateTime>(createTime),
      'updateTime': serializer.toJson<DateTime?>(updateTime),
    };
  }

  TagShortcutMap copyWith(
          {String? tagId,
          String? shortcutId,
          DateTime? createTime,
          Value<DateTime?> updateTime = const Value.absent()}) =>
      TagShortcutMap(
        tagId: tagId ?? this.tagId,
        shortcutId: shortcutId ?? this.shortcutId,
        createTime: createTime ?? this.createTime,
        updateTime: updateTime.present ? updateTime.value : this.updateTime,
      );
  @override
  String toString() {
    return (StringBuffer('TagShortcutMap(')
          ..write('tagId: $tagId, ')
          ..write('shortcutId: $shortcutId, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tagId, shortcutId, createTime, updateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagShortcutMap &&
          other.tagId == this.tagId &&
          other.shortcutId == this.shortcutId &&
          other.createTime == this.createTime &&
          other.updateTime == this.updateTime);
}

class TagShortcutMapTableCompanion extends UpdateCompanion<TagShortcutMap> {
  final Value<String> tagId;
  final Value<String> shortcutId;
  final Value<DateTime> createTime;
  final Value<DateTime?> updateTime;
  final Value<int> rowid;
  const TagShortcutMapTableCompanion({
    this.tagId = const Value.absent(),
    this.shortcutId = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagShortcutMapTableCompanion.insert({
    required String tagId,
    required String shortcutId,
    required DateTime createTime,
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : tagId = Value(tagId),
        shortcutId = Value(shortcutId),
        createTime = Value(createTime);
  static Insertable<TagShortcutMap> custom({
    Expression<String>? tagId,
    Expression<String>? shortcutId,
    Expression<DateTime>? createTime,
    Expression<DateTime>? updateTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (tagId != null) 'tag_id': tagId,
      if (shortcutId != null) 'shortcut_id': shortcutId,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagShortcutMapTableCompanion copyWith(
      {Value<String>? tagId,
      Value<String>? shortcutId,
      Value<DateTime>? createTime,
      Value<DateTime?>? updateTime,
      Value<int>? rowid}) {
    return TagShortcutMapTableCompanion(
      tagId: tagId ?? this.tagId,
      shortcutId: shortcutId ?? this.shortcutId,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (shortcutId.present) {
      map['shortcut_id'] = Variable<String>(shortcutId.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagShortcutMapTableCompanion(')
          ..write('tagId: $tagId, ')
          ..write('shortcutId: $shortcutId, ')
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $AppTableTable appTable = $AppTableTable(this);
  late final $ShortcutTableTable shortcutTable = $ShortcutTableTable(this);
  late final $TagTableTable tagTable = $TagTableTable(this);
  late final $TagAppMapTableTable tagAppMapTable = $TagAppMapTableTable(this);
  late final $TagShortcutMapTableTable tagShortcutMapTable =
      $TagShortcutMapTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [appTable, shortcutTable, tagTable, tagAppMapTable, tagShortcutMapTable];
}
