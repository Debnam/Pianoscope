enum Difficulty { Easy, Medium, Hard }

class Song {
  final String _title;
  final String _artist;
  final Difficulty _difficulty;

  const Song(this._title, this._artist, this._difficulty);

  String get title => _title;

  String get artist => _artist;

  Difficulty get difficulty => _difficulty;
}
