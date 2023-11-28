class Address {
  int? _id;
  String _name = "";
  String? _notes;
  String _label = '';
  String _address = '';
  String _phonenum = '';

  Address(this._name, this._label, this._address, this._phonenum, [this._notes]) {
    if (_notes == null) {
      _notes = "";
    }
  }

  Address.withId(this._id, this._name, this._label, this._address, this._phonenum, [this._notes]) {
    if (_notes == null) {
      _notes = "";
    }
  }

  int? get id => _id;
  String get name => _name;
  String? get notes => _notes;
  String get label => _label;
  String get address => _address;
  String get phonenum => _phonenum;

  set name(String newName) {
    if (newName.length <= 255) {
      this._name = newName;
    }
  }

  set notes(String? newNotes) {
    if (newNotes != null && newNotes.length <= 255) {
      this._notes = newNotes;
    }
  }

  set label(String newLabel) {
    if (newLabel.length <= 55) {
      this._label = newLabel;
    }
  }

  set address(String newAddress) {
    if (newAddress.length <= 255) {
      this._address = newAddress;
    }
  }

  set phonenum(String newPhonenum) {
    if (newPhonenum.length <= 15) {
      this._phonenum = newPhonenum;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['notes'] = _notes;
    map['label'] = _label;
    map['address'] = _address;
    map['phonenum'] = _phonenum;

    return map;
  }

  Address.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._notes = map['notes'];
    this._label = map['label'];
    this._address = map['address'];
    this._phonenum = map['phonenum'];
  }
}