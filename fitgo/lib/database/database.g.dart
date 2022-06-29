// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ProfileDao? _profileDaoInstance;

  DataDao? _dataDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `profile` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `username` TEXT NOT NULL, `password` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `DatiDB` (`ind` INTEGER NOT NULL, `profileName` TEXT, `passi_today` REAL NOT NULL, `profile_id` INTEGER NOT NULL, `passi_week` INTEGER NOT NULL, `date_steps` INTEGER NOT NULL, PRIMARY KEY (`ind`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProfileDao get profileDao {
    return _profileDaoInstance ??= _$ProfileDao(database, changeListener);
  }

  @override
  DataDao get dataDao {
    return _dataDaoInstance ??= _$DataDao(database, changeListener);
  }
}

class _$ProfileDao extends ProfileDao {
  _$ProfileDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _profileInsertionAdapter = InsertionAdapter(
            database,
            'profile',
            (Profile item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'username': item.username,
                  'password': item.password
                }),
        _profileDeletionAdapter = DeletionAdapter(
            database,
            'profile',
            ['id'],
            (Profile item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'username': item.username,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Profile> _profileInsertionAdapter;

  final DeletionAdapter<Profile> _profileDeletionAdapter;

  @override
  Future<List<Profile>> findAllProfiles() async {
    return _queryAdapter.queryList('SELECT * FROM Profile',
        mapper: (Map<String, Object?> row) => Profile(
            row['id'] as int?,
            row['name'] as String,
            row['username'] as String,
            row['password'] as String));
  }

  @override
  Future<Profile?> findAllUsernames(String username) async {
    return _queryAdapter.query('SELECT * FROM Profile WHERE username = ?1',
        mapper: (Map<String, Object?> row) => Profile(
            row['id'] as int?,
            row['name'] as String,
            row['username'] as String,
            row['password'] as String),
        arguments: [username]);
  }

  @override
  Future<void> insertProfile(Profile profile) async {
    await _profileInsertionAdapter.insert(profile, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteProfile(Profile profile) async {
    await _profileDeletionAdapter.delete(profile);
  }
}

class _$DataDao extends DataDao {
  _$DataDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _datiDBInsertionAdapter = InsertionAdapter(
            database,
            'DatiDB',
            (DatiDB item) => <String, Object?>{
                  'ind': item.ind,
                  'profileName': item.profileName,
                  'passi_today': item.passi_today,
                  'profile_id': item.profile_id,
                  'passi_week': item.passi_week,
                  'date_steps': item.date_steps
                }),
        _datiDBDeletionAdapter = DeletionAdapter(
            database,
            'DatiDB',
            ['ind'],
            (DatiDB item) => <String, Object?>{
                  'ind': item.ind,
                  'profileName': item.profileName,
                  'passi_today': item.passi_today,
                  'profile_id': item.profile_id,
                  'passi_week': item.passi_week,
                  'date_steps': item.date_steps
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DatiDB> _datiDBInsertionAdapter;

  final DeletionAdapter<DatiDB> _datiDBDeletionAdapter;

  @override
  Future<DatiDB?> findAllUserId(String username) async {
    return _queryAdapter.query('SELECT * FROM DatiDB WHERE profileName = ?1',
        mapper: (Map<String, Object?> row) => DatiDB(
            row['ind'] as int,
            row['profile_id'] as int,
            row['passi_today'] as double,
            row['passi_week'] as int,
            row['date_steps'] as int,
            row['profileName'] as String?),
        arguments: [username]);
  }

  @override
  Future<List<DatiDB>> findAllData(String username) async {
    return _queryAdapter.queryList(
        'SELECT * FROM DatiDB WHERE profileName = ?1',
        mapper: (Map<String, Object?> row) => DatiDB(
            row['ind'] as int,
            row['profile_id'] as int,
            row['passi_today'] as double,
            row['passi_week'] as int,
            row['date_steps'] as int,
            row['profileName'] as String?),
        arguments: [username]);
  }

  @override
  Future<void> insertData(DatiDB dati) async {
    await _datiDBInsertionAdapter.insert(dati, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(List<DatiDB> dati) async {
    await _datiDBDeletionAdapter.deleteList(dati);
  }
}
