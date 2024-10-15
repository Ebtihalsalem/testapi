/// _id : 3
/// userId : 123
/// name : "Company A"
/// industry : "Technology"
/// size : "Medium"
/// location : "New York"
/// description : "A tech company specializing in software development."

class T {
  T({
      int? id, 
      int? userId, 
      String? name, 
      String? industry, 
      String? size, 
      String? location, 
      String? description,}){
    _id = id;
    _userId = userId;
    _name = name;
    _industry = industry;
    _size = size;
    _location = location;
    _description = description;
}

  T.fromJson(dynamic json) {
    _id = json['_id'];
    _userId = json['userId'];
    _name = json['name'];
    _industry = json['industry'];
    _size = json['size'];
    _location = json['location'];
    _description = json['description'];
  }
  int? _id;
  int? _userId;
  String? _name;
  String? _industry;
  String? _size;
  String? _location;
  String? _description;
T copyWith({  int? id,
  int? userId,
  String? name,
  String? industry,
  String? size,
  String? location,
  String? description,
}) => T(  id: id ?? _id,
  userId: userId ?? _userId,
  name: name ?? _name,
  industry: industry ?? _industry,
  size: size ?? _size,
  location: location ?? _location,
  description: description ?? _description,
);
  int? get id => _id;
  int? get userId => _userId;
  String? get name => _name;
  String? get industry => _industry;
  String? get size => _size;
  String? get location => _location;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['userId'] = _userId;
    map['name'] = _name;
    map['industry'] = _industry;
    map['size'] = _size;
    map['location'] = _location;
    map['description'] = _description;
    return map;
  }

}