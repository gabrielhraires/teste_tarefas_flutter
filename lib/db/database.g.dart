// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

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

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

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
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
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
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserRepositoryDao _userRepositoryDaoInstance;

  TaskRepositoryDao _taskRepositoryDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `User` (`name` TEXT, `email` TEXT, `dateOfBirth` TEXT, `cpf` TEXT, `cep` TEXT, `address` TEXT, `number` TEXT, `password` TEXT, `id` INTEGER PRIMARY KEY AUTOINCREMENT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task` (`name` TEXT, `finishDate` TEXT, `conclusionDate` TEXT, `user_id` INTEGER, `id` INTEGER PRIMARY KEY AUTOINCREMENT, FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserRepositoryDao get userRepositoryDao {
    return _userRepositoryDaoInstance ??=
        _$UserRepositoryDao(database, changeListener);
  }

  @override
  TaskRepositoryDao get taskRepositoryDao {
    return _taskRepositoryDaoInstance ??=
        _$TaskRepositoryDao(database, changeListener);
  }
}

class _$UserRepositoryDao extends UserRepositoryDao {
  _$UserRepositoryDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, dynamic>{
                  'name': item.name,
                  'email': item.email,
                  'dateOfBirth': item.dateOfBirth,
                  'cpf': item.cpf,
                  'cep': item.cep,
                  'address': item.address,
                  'number': item.number,
                  'password': item.password,
                  'id': item.id
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, dynamic>{
                  'name': item.name,
                  'email': item.email,
                  'dateOfBirth': item.dateOfBirth,
                  'cpf': item.cpf,
                  'cep': item.cep,
                  'address': item.address,
                  'number': item.number,
                  'password': item.password,
                  'id': item.id
                }),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, dynamic>{
                  'name': item.name,
                  'email': item.email,
                  'dateOfBirth': item.dateOfBirth,
                  'cpf': item.cpf,
                  'cep': item.cep,
                  'address': item.address,
                  'number': item.number,
                  'password': item.password,
                  'id': item.id
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _userMapper = (Map<String, dynamic> row) => User(
      id: row['id'] as int,
      name: row['name'] as String,
      email: row['email'] as String,
      dateOfBirth: row['dateOfBirth'] as String,
      cpf: row['cpf'] as String,
      cep: row['cep'] as String,
      address: row['address'] as String,
      number: row['number'] as String,
      password: row['password'] as String);

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<User> getById(int id) async {
    return _queryAdapter.query('SELECT * FROM User WHERE id = ?',
        arguments: <dynamic>[id], mapper: _userMapper);
  }

  @override
  Future<User> getByEmailAndPassword(String email, String password) async {
    return _queryAdapter.query(
        'SELECT * FROM User WHERE email = ? AND password = ?',
        arguments: <dynamic>[email, password],
        mapper: _userMapper);
  }

  @override
  Future<int> insertItem(User item) {
    return _userInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(User item) {
    return _userUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(User item) {
    return _userDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}

class _$TaskRepositoryDao extends TaskRepositoryDao {
  _$TaskRepositoryDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'task',
            (Task item) => <String, dynamic>{
                  'name': item.name,
                  'finishDate': item.finishDate,
                  'conclusionDate': item.conclusionDate,
                  'user_id': item.userId,
                  'id': item.id
                },
            changeListener),
        _taskUpdateAdapter = UpdateAdapter(
            database,
            'task',
            ['id'],
            (Task item) => <String, dynamic>{
                  'name': item.name,
                  'finishDate': item.finishDate,
                  'conclusionDate': item.conclusionDate,
                  'user_id': item.userId,
                  'id': item.id
                },
            changeListener),
        _taskDeletionAdapter = DeletionAdapter(
            database,
            'task',
            ['id'],
            (Task item) => <String, dynamic>{
                  'name': item.name,
                  'finishDate': item.finishDate,
                  'conclusionDate': item.conclusionDate,
                  'user_id': item.userId,
                  'id': item.id
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _taskMapper = (Map<String, dynamic> row) => Task(
      id: row['id'] as int,
      name: row['name'] as String,
      finishDate: row['finishDate'] as String,
      conclusionDate: row['conclusionDate'] as String,
      userId: row['user_id'] as int);

  final InsertionAdapter<Task> _taskInsertionAdapter;

  final UpdateAdapter<Task> _taskUpdateAdapter;

  final DeletionAdapter<Task> _taskDeletionAdapter;

  @override
  Future<Task> getById(int id) async {
    return _queryAdapter.query('SELECT * FROM Task WHERE id = ?',
        arguments: <dynamic>[id], mapper: _taskMapper);
  }

  @override
  Stream<List<Task>> getAllByUser(int userId) {
    return _queryAdapter.queryListStream('SELECT * FROM Task WHERE user_id = ?',
        arguments: <dynamic>[userId],
        queryableName: 'task',
        isView: false,
        mapper: _taskMapper);
  }

  @override
  Future<int> insertItem(Task item) {
    return _taskInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(Task item) {
    return _taskUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(Task item) {
    return _taskDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}
