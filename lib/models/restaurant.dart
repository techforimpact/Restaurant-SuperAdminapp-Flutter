// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Restaurent {
 String name;
 String address;
 String phone; 
 String email;
  Restaurent({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
  });


  Restaurent copyWith({
    String? name,
    String? address,
    String? phone,
    String? email,
  }) {
    return Restaurent(
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
    };
  }

  factory Restaurent.fromMap(Map<String, dynamic> map) {
    return Restaurent(
      name: map['name'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurent.fromJson(String source) => Restaurent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Restaurent(name: $name, address: $address, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Restaurent &&
      other.name == name &&
      other.address == address &&
      other.phone == phone &&
      other.email == email;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      email.hashCode;
  }
}
