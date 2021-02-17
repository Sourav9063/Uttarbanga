import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:Uttarbanga/GlobalVar.dart';

class UserData {
  String name;
  String imageLink;
  String uid;
  String designation;
  String department;
  String icNo;
  String address;
  String zilla;
  String upazilla;
  String phoneNumber;
  String bloodType;
  Timestamp joiningDate;
  Timestamp lprDate;
  UserData({
    @required this.name,
    @required this.imageLink,
    @required this.uid,
    @required this.designation,
    @required this.department,
    @required this.icNo,
    @required this.address,
    @required this.zilla,
    @required this.upazilla,
    @required this.phoneNumber,
    @required this.bloodType,
    @required this.joiningDate,
    @required this.lprDate,
  });

  UserData.placeholder();

  // UserData.getUserObj(
  //     {@required this.name,
  //     @required this.designation,
  //     @required this.department,
  //     @required this.icNo,
  //     @required this.address,
  //     @required this.zilla,
  //     @required this.upazilla,
  //     @required this.phoneNumber,
  //     @required this.joiningDate,
  //     @required this.lprDate,
  //     this.bloodType = "N/A"});

  UserData copyWith({
    String name,
    String imageLink,
    String uid,
    String designation,
    String department,
    String icNo,
    String address,
    String zilla,
    String upazilla,
    String phoneNumber,
    String bloodType,
    Timestamp joiningDate,
    Timestamp lprDate,
  }) {
    return UserData(
      name: name ?? this.name,
      imageLink: imageLink ?? this.imageLink,
      uid: uid ?? this.uid,
      designation: designation ?? this.designation,
      department: department ?? this.department,
      icNo: icNo ?? this.icNo,
      address: address ?? this.address,
      zilla: zilla ?? this.zilla,
      upazilla: upazilla ?? this.upazilla,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bloodType: bloodType ?? this.bloodType,
      joiningDate: joiningDate ?? this.joiningDate,
      lprDate: lprDate ?? this.lprDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageLink': imageLink,
      'uid': uid,
      'designation': designation,
      'department': department,
      'icNo': icNo,
      'address': address,
      'zilla': zilla,
      'upazilla': upazilla,
      'phoneNumber': phoneNumber,
      'bloodType': bloodType,
      'joiningDate': joiningDate,
      'lprDate': lprDate,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserData(
      name: map['name'] ?? '',
      imageLink: map['imageLink'] ?? '',
      uid: map['uid'] ?? '',
      designation: map['designation'] ?? '',
      department: map['department'] ?? '',
      icNo: map['icNo'] ?? '',
      address: map['address'] ?? '',
      zilla: map['zilla'] ?? '',
      upazilla: map['upazilla'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      bloodType: map['bloodType'] ?? '',
      joiningDate: map['joiningDate'],
      lprDate: map['lprDate'],
    );
  }

  // String toJson() => json.encode(toMap());

  // factory UserData.fromJson(String source) =>
  //     UserData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserData(name: $name, imageLink: $imageLink, uid: $uid, designation: $designation, department: $department, icNo: $icNo, address: $address, zilla: $zilla, upazilla: $upazilla, phoneNumber: $phoneNumber, bloodType: $bloodType, joiningDate: $joiningDate, lprDate: $lprDate)';
  }

  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;

  //   return o is UserData &&
  //       o.name == name &&
  //       o.imageLink == imageLink &&
  //       o.uid == uid &&
  //       o.designation == designation &&
  //       o.department == department &&
  //       o.icNo == icNo &&
  //       o.address == address &&
  //       o.zilla == zilla &&
  //       o.upazilla == upazilla &&
  //       o.phoneNumber == phoneNumber &&
  //       o.bloodType == bloodType &&
  //       o.joiningDate == joiningDate &&
  //       o.lprDate == lprDate;
  // }

  // @override
  // int get hashCode {
  //   return name.hashCode ^
  //       imageLink.hashCode ^
  //       uid.hashCode ^
  //       designation.hashCode ^
  //       department.hashCode ^
  //       icNo.hashCode ^
  //       address.hashCode ^
  //       zilla.hashCode ^
  //       upazilla.hashCode ^
  //       phoneNumber.hashCode ^
  //       bloodType.hashCode ^
  //       joiningDate.hashCode ^
  //       lprDate.hashCode;
  // }
}
