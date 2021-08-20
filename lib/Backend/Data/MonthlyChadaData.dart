import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class MonthlyChadaData {
  String nameOfMonth;
  DateTime expiredDate;

  double chadaAmmount;
  int totalMembers;
  String status;
  double totalAmount;
  double collectedAmount;
  List<String> nameOfAllMembers;
  List<String> nameOfCompleted;
  List<String> nameOfUncompleted;
  MonthlyChadaData({
    @required this.nameOfMonth,
    @required this.expiredDate,
    @required this.chadaAmmount,
    @required this.totalMembers,
    @required this.status,
    @required this.totalAmount,
    @required this.collectedAmount,
    this.nameOfAllMembers = const [],
    this.nameOfCompleted = const [],
    this.nameOfUncompleted = const [],
  });

  MonthlyChadaData copyWith({
    String nameOfMonth,
    DateTime expiredDate,
    double chadaAmmount,
    int totalMembers,
    String status,
    double totalAmount,
    double collectedAmount,
    List<String> nameOfAllMembers,
    List<String> nameOfCompleted,
    List<String> nameOfUncompleted,
  }) {
    return MonthlyChadaData(
      nameOfMonth: nameOfMonth ?? this.nameOfMonth,
      expiredDate: expiredDate ?? this.expiredDate,
      chadaAmmount: chadaAmmount ?? this.chadaAmmount,
      totalMembers: totalMembers ?? this.totalMembers,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      collectedAmount: collectedAmount ?? this.collectedAmount,
      nameOfAllMembers: nameOfAllMembers ?? this.nameOfAllMembers,
      nameOfCompleted: nameOfCompleted ?? this.nameOfCompleted,
      nameOfUncompleted: nameOfUncompleted ?? this.nameOfUncompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nameOfMonth': nameOfMonth,
      'expiredDate': expiredDate.millisecondsSinceEpoch,
      'chadaAmmount': chadaAmmount,
      'totalMembers': totalMembers,
      'status': status,
      'totalAmount': totalAmount,
      'collectedAmount': collectedAmount,
      'nameOfAllMembers': nameOfAllMembers,
      'nameOfCompleted': nameOfCompleted,
      'nameOfUncompleted': nameOfUncompleted,
    };
  }

  factory MonthlyChadaData.fromMap(Map<String, dynamic> map) {
    return MonthlyChadaData(
      nameOfMonth: map['nameOfMonth'] ?? '',
      expiredDate: DateTime.fromMillisecondsSinceEpoch(map['expiredDate']),
      chadaAmmount: map['chadaAmmount'] ?? 0.0,
      totalMembers: map['totalMembers'] ?? 0,
      status: map['status'] ?? '',
      totalAmount: map['totalAmount'] ?? 0.0,
      collectedAmount: map['collectedAmount'] ?? 0.0,
      nameOfAllMembers: List<String>.from(map['nameOfAllMembers'] ?? const []),
      nameOfCompleted: List<String>.from(map['nameOfCompleted'] ?? const []),
      nameOfUncompleted:
          List<String>.from(map['nameOfUncompleted'] ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory MonthlyChadaData.fromJson(String source) =>
      MonthlyChadaData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MonthlyChadaData(nameOfMonth: $nameOfMonth, expiredDate: $expiredDate, chadaAmmount: $chadaAmmount, totalMembers: $totalMembers, status: $status, totalAmount: $totalAmount, collectedAmount: $collectedAmount, nameOfAllMembers: $nameOfAllMembers, nameOfCompleted: $nameOfCompleted, nameOfUncompleted: $nameOfUncompleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MonthlyChadaData &&
        other.nameOfMonth == nameOfMonth &&
        other.expiredDate == expiredDate &&
        other.chadaAmmount == chadaAmmount &&
        other.totalMembers == totalMembers &&
        other.status == status &&
        other.totalAmount == totalAmount &&
        other.collectedAmount == collectedAmount &&
        listEquals(other.nameOfAllMembers, nameOfAllMembers) &&
        listEquals(other.nameOfCompleted, nameOfCompleted) &&
        listEquals(other.nameOfUncompleted, nameOfUncompleted);
  }

  @override
  int get hashCode {
    return nameOfMonth.hashCode ^
        expiredDate.hashCode ^
        chadaAmmount.hashCode ^
        totalMembers.hashCode ^
        status.hashCode ^
        totalAmount.hashCode ^
        collectedAmount.hashCode ^
        nameOfAllMembers.hashCode ^
        nameOfCompleted.hashCode ^
        nameOfUncompleted.hashCode;
  }
}
