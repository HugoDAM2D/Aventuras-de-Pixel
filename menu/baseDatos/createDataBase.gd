extends Node

var db : SQLite = SQLite.new()

func _ready():
	var db_path = "user://mi_base_de_datos.sqlite"
	print(Engine.get_singleton_list())

	if not FileAccess.file_exists(db_path):
		db.path = db_path
		db.open_db()
		crear_tablas()
		db.close_db()
		print("Base de datos creada.")
	else:
		print("La base de datos ya existe, no se creó de nuevo.")

func crear_tablas():
	db.query("""
		CREATE TABLE IF NOT EXISTS Usuario (
			id INTEGER PRIMARY KEY AUTOINCREMENT,
			username TEXT NOT NULL UNIQUE,
			password TEXT NOT NULL
		);
	""")

	db.query("""
		CREATE TABLE IF NOT EXISTS Nivel (
			id INTEGER PRIMARY KEY AUTOINCREMENT,
			nombre TEXT NOT NULL,
			descripcion TEXT,
			dificultad INTEGER
		);
	""")
	db.query("""
		INSERT INTO Nivel (nombre, descripcion, dificultad)
		VALUES ("Nivel1", "Nivel donde empiezas las primeras aventuras de pixel", 1);
	""")


	db.query("""
		CREATE TABLE IF NOT EXISTS Puntuacion (
			id INTEGER PRIMARY KEY AUTOINCREMENT,
			usuario_id INTEGER NOT NULL,
			nivel_id INTEGER NOT NULL,
			puntuacion INTEGER NOT NULL,
			tiempo_segundos INTEGER NOT NULL,
			finalizado INTEGER NOT NULL,
			FOREIGN KEY(usuario_id) REFERENCES Usuario(id),
			FOREIGN KEY(nivel_id) REFERENCES Nivel(id)
		);
	""")
	
