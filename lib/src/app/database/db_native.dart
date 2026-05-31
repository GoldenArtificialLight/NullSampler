import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String databaseName = "null_sampler.db";

Future<Database> getDatabase() async {
  return await openDatabase(
    join(await getDatabasesPath(), databaseName),
    version: 1,
    onCreate: (db, version) async {
      await db.execute("""
                CREATE TABLE Tile (
                    idTile INTEGER PRIMARY KEY NOT NULL,
                    posicao TEXT
                );

                CREATE TABLE Sample (
                    idSample INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
                    filename TEXT NOT NULL,
                    bytes BLOB NOT NULL
                );

                CREATE TABLE Grid (
                    idGrid INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
                    idTile INTEGER NOT NULL,
                    idSample INTEGER,
                    FOREIGN KEY (idTile) REFERENCES Tile(idTile),
                    FOREIGN KEY (idSample) REFERENCES Sample(idSample)
                );
            """);

      await db.execute("""
                INSERT INTO Tile VALUES
                (1, "topLeft"),
                (2, "topCenter"),
                (3, "topRight"),
                (4, "middleLeft"),
                (5, "middleCenter"),
                (6, "middleRight"),
                (7, "bottomLeft"),
                (8, "bottomCenter"),
                (9, "bottomRight");
            """);
    },
  );
}

Future<void> cleanDatabase() async {
  await deleteDatabase(join(await getDatabasesPath(), databaseName));
}
