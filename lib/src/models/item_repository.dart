class ItemPost {
  String _author;
  String _name;
  String _description;
  String _authorImage;

  ItemPost.fromJSON(Map<String, dynamic> parsedJson) {
    _author = parsedJson['author'];
    _name = parsedJson['name'];
    _description = parsedJson['description'];
    _authorImage = parsedJson['avatar'];
  }

  String get authorImage => _authorImage;

  String get description => _description;

  String get name => _name;

  String get author => _author;
}
