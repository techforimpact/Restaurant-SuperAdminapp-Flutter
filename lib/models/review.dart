// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Review {
  double ratingValue1;
  double ratingValue2;
  double ratingValue3;
  double avgRatings;
  String reviews;
  DateTime dateTime;
  String userName;
  Review({
    required this.ratingValue1,
    required this.ratingValue2,
    required this.ratingValue3,
    required this.avgRatings,
    required this.reviews,
    required this.dateTime,
    required this.userName,
  });

  Review copyWith({
    double? ratingValue1,
    double? ratingValue2,
    double? ratingValue3,
    double? avgRatings,
    String? reviews,
    DateTime? dateTime,
    String? userName,
  }) {
    return Review(
      ratingValue1: ratingValue1 ?? this.ratingValue1,
      ratingValue2: ratingValue2 ?? this.ratingValue2,
      ratingValue3: ratingValue3 ?? this.ratingValue3,
      avgRatings: avgRatings ?? this.avgRatings,
      reviews: reviews ?? this.reviews,
      dateTime: dateTime ?? this.dateTime,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ratingValue1': ratingValue1,
      'ratingValue2': ratingValue2,
      'ratingValue3': ratingValue3,
      'avgRatings': avgRatings,
      'reviews': reviews,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'userName': userName,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      ratingValue1: map['ratingValue1'] as double,
      ratingValue2: map['ratingValue2'] as double,
      ratingValue3: map['ratingValue3'] as double,
      avgRatings: map['avgRatings'] as double,
      reviews: map['reviews'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      userName: map['userName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) => Review.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Review(ratingValue1: $ratingValue1, ratingValue2: $ratingValue2, ratingValue3: $ratingValue3, avgRatings: $avgRatings, reviews: $reviews, dateTime: $dateTime, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Review &&
      other.ratingValue1 == ratingValue1 &&
      other.ratingValue2 == ratingValue2 &&
      other.ratingValue3 == ratingValue3 &&
      other.avgRatings == avgRatings &&
      other.reviews == reviews &&
      other.dateTime == dateTime &&
      other.userName == userName;
  }

  @override
  int get hashCode {
    return ratingValue1.hashCode ^
      ratingValue2.hashCode ^
      ratingValue3.hashCode ^
      avgRatings.hashCode ^
      reviews.hashCode ^
      dateTime.hashCode ^
      userName.hashCode;
  }
}
