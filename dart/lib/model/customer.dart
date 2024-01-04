class Customer {
  int? id;
  String? fullname;
  DateTime? birthday;
  String? address;
  String? phonenumber;
  Customer({this.id, this.fullname, this.birthday, this.address, this.phonenumber});

  factory Customer.valueFromJson(Map<String, dynamic> json) {
    return Customer(
      id: json["id"] as int?,
      fullname: json["fullname"] as String?,
      birthday: json["birthday"] != null ? DateTime.parse(json["birthday"] as String) : null,
      address: json["address"] as String?,
      phonenumber: json["phonenumber"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fullname": fullname,
      "birthday": birthday?.toIso8601String(),
      "address": address,
      "phonenumber": phonenumber,
    };
  }

  @override
  String toString() {
    return "id: $id, fullname: $fullname, birthday: $birthday, address: $address, phonenumber: $phonenumber";
  }
}