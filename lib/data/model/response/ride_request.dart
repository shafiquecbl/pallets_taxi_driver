class RideRequest {
  int id;
  String displayName;
  String email;
  String username;
  String userType;
  String profileImage;
  String status;
  double? latitude;
  double? longitude;
  OnRideRequest? onRideRequest;
  Rider? rider;
  Payment? payment;

  RideRequest({
    required this.id,
    required this.displayName,
    required this.email,
    required this.username,
    required this.userType,
    required this.profileImage,
    required this.status,
    required this.latitude,
    required this.longitude,
    this.onRideRequest,
    required this.rider,
    required this.payment,
  });

  factory RideRequest.fromJson(Map<String, dynamic> json) => RideRequest(
        id: json["id"],
        displayName: json["display_name"],
        email: json["email"],
        username: json["username"],
        userType: json["user_type"],
        profileImage: json["profile_image"],
        status: json["status"],
        latitude: json['latitude'] != null
            ? double.parse(json['latitude'].toString())
            : json['latitude'],
        longitude: json['longitude'] != null
            ? double.parse(json['longitude'].toString())
            : json['longitude'],
        onRideRequest: json["on_ride_request"] == null
            ? null
            : OnRideRequest.fromJson(json["on_ride_request"]),
        rider: json["rider"] == null ? null : Rider.fromJson(json["rider"]),
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "display_name": displayName,
        "email": email,
        "username": username,
        "user_type": userType,
        "profile_image": profileImage,
        "status": status,
        "latitude": latitude,
        "longitude": longitude,
        "on_ride_request": onRideRequest?.toJson(),
        "rider": rider?.toJson(),
        "payment": payment?.toJson(),
      };
}

class OnRideRequest {
  int id;
  int riderId;
  int serviceId;
  int isSchedule;
  String? otp;
  num totalAmount;
  num? subtotal;
  num? extraChargesAmount;
  int? driverId;
  String? driverName;
  String? riderName;
  String? driverEmail;
  String? riderEmail;
  String? driverContactNumber;
  String? riderContactNumber;
  String? driverProfileImage;
  String? riderProfileImage;
  double startLatitude;
  double startLongitude;
  String startAddress;
  double endLatitude;
  double endLongitude;
  String endAddress;
  String distanceUnit;
  DateTime? startTime;
  DateTime? endTime;
  num? distance;
  num? duration;
  int seatCount;
  String? reason;
  String status;
  num? tips;
  num? baseFare;
  num? minimumFare;
  num? perDistance;
  num? perDistanceCharge;
  num? perMinuteDrive;
  num? perMinuteDriveCharge;
  num? perMinuteWaiting;
  num? waitingTime;
  num? waitingTimeLimit;
  num? perMinuteWaitingCharge;
  num? cancelationCharges;
  dynamic cancelBy;
  num? paymentId;
  String paymentType;
  String paymentStatus;
  List<num?> extraCharges;
  num? couponDiscount;
  num? couponCode;
  dynamic couponData;
  int isRiderRated;
  int isDriverRated;
  DateTime createdAt;
  DateTime updatedAt;
  int isRideForOther;
  dynamic otherRiderData;
  bool isUrgent;
  DateTime startDate;
  DateTime endDate;
  String userNote;
  String weight;
  String dimensions;
  String equipments;
  int helpers;

  OnRideRequest({
    required this.id,
    required this.riderId,
    required this.serviceId,
    required this.isSchedule,
    required this.otp,
    required this.totalAmount,
    required this.subtotal,
    required this.extraChargesAmount,
    required this.driverId,
    required this.driverName,
    required this.riderName,
    required this.driverEmail,
    required this.riderEmail,
    required this.driverContactNumber,
    required this.riderContactNumber,
    required this.driverProfileImage,
    required this.riderProfileImage,
    required this.startLatitude,
    required this.startLongitude,
    required this.startAddress,
    required this.endLatitude,
    required this.endLongitude,
    required this.endAddress,
    required this.distanceUnit,
    required this.startTime,
    required this.endTime,
    required this.distance,
    required this.duration,
    required this.seatCount,
    required this.reason,
    required this.status,
    required this.tips,
    required this.baseFare,
    required this.minimumFare,
    required this.perDistance,
    required this.perDistanceCharge,
    required this.perMinuteDrive,
    required this.perMinuteDriveCharge,
    required this.perMinuteWaiting,
    required this.waitingTime,
    required this.waitingTimeLimit,
    required this.perMinuteWaitingCharge,
    required this.cancelationCharges,
    required this.cancelBy,
    required this.paymentId,
    required this.paymentType,
    required this.paymentStatus,
    required this.extraCharges,
    required this.couponDiscount,
    required this.couponCode,
    required this.couponData,
    required this.isRiderRated,
    required this.isDriverRated,
    required this.createdAt,
    required this.updatedAt,
    required this.isRideForOther,
    required this.otherRiderData,
    required this.isUrgent,
    required this.startDate,
    required this.endDate,
    required this.userNote,
    required this.weight,
    required this.dimensions,
    required this.equipments,
    required this.helpers,
  });

  factory OnRideRequest.fromJson(Map<String, dynamic> json) => OnRideRequest(
        id: json["id"],
        riderId: json["rider_id"],
        serviceId: json["service_id"],
        isSchedule: json["is_schedule"],
        otp: json["otp"],
        totalAmount: json["total_amount"],
        subtotal: json["subtotal"],
        extraChargesAmount: json["extra_charges_amount"],
        driverId: json["driver_id"],
        driverName: json["driver_name"],
        riderName: json["rider_name"],
        driverEmail: json["driver_email"],
        riderEmail: json["rider_email"],
        driverContactNumber: json["driver_contact_number"],
        riderContactNumber: json["rider_contact_number"],
        driverProfileImage: json["driver_profile_image"],
        riderProfileImage: json["rider_profile_image"],
        startLatitude: double.parse(json["start_latitude"].toString()),
        startLongitude: double.parse(json["start_longitude"]),
        startAddress: json["start_address"],
        endLatitude: double.parse(json["end_latitude"]),
        endLongitude: double.parse(json["end_longitude"]),
        endAddress: json["end_address"],
        distanceUnit: json["distance_unit"],
        startTime: json["start_time"] != null
            ? DateTime.parse(json["start_time"])
            : null,
        endTime:
            json["end_time"] != null ? DateTime.parse(json["end_time"]) : null,
        distance: json["distance"],
        duration: json["duration"],
        seatCount: json["seat_count"],
        reason: json["reason"],
        status: json["status"],
        tips: json["tips"],
        baseFare: json["base_fare"],
        minimumFare: json["minimum_fare"],
        perDistance: json["per_distance"],
        perDistanceCharge: json["per_distance_charge"],
        perMinuteDrive: json["per_minute_drive"],
        perMinuteDriveCharge: json["per_minute_drive_charge"],
        perMinuteWaiting: json["per_minute_waiting"],
        waitingTime: json["waiting_time"],
        waitingTimeLimit: json["waiting_time_limit"],
        perMinuteWaitingCharge: json["per_minute_waiting_charge"],
        cancelationCharges: json["cancelation_charges"],
        cancelBy: json["cancel_by"],
        paymentId: json["payment_id"],
        paymentType: json["payment_type"],
        paymentStatus: json["payment_status"],
        extraCharges: List<num?>.from(json["extra_charges"].map((x) => x)),
        couponDiscount: json["coupon_discount"],
        couponCode: json["coupon_code"],
        couponData: json["coupon_data"],
        isRiderRated: json["is_rider_rated"],
        isDriverRated: json["is_driver_rated"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isRideForOther: json["is_ride_for_other"],
        otherRiderData: json["other_rider_data"],
        isUrgent: json["is_urgent"] == 1 ? true : false,
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        userNote: json["user_note"] ?? '',
        weight: json["weight"],
        dimensions: json["dimensions"],
        equipments: json["additional_equipments"],
        helpers: int.parse(json["helper"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rider_id": riderId,
        "service_id": serviceId,
        "is_schedule": isSchedule,
        "otp": otp,
        "total_amount": totalAmount,
        "subtotal": subtotal,
        "extra_charges_amount": extraChargesAmount,
        "driver_id": driverId,
        "driver_name": driverName,
        "rider_name": riderName,
        "driver_email": driverEmail,
        "rider_email": riderEmail,
        "driver_contact_number": driverContactNumber,
        "rider_contact_number": riderContactNumber,
        "driver_profile_image": driverProfileImage,
        "rider_profile_image": riderProfileImage,
        "start_latitude": startLatitude,
        "start_longitude": startLongitude,
        "start_address": startAddress,
        "end_latitude": endLatitude,
        "end_longitude": endLongitude,
        "end_address": endAddress,
        "distance_unit": distanceUnit,
        "start_time": startTime,
        "end_time": endTime,
        "distance": distance,
        "duration": duration,
        "seat_count": seatCount,
        "reason": reason,
        "status": status,
        "tips": tips,
        "base_fare": baseFare,
        "minimum_fare": minimumFare,
        "per_distance": perDistance,
        "per_distance_charge": perDistanceCharge,
        "per_minute_drive": perMinuteDrive,
        "per_minute_drive_charge": perMinuteDriveCharge,
        "per_minute_waiting": perMinuteWaiting,
        "waiting_time": waitingTime,
        "waiting_time_limit": waitingTimeLimit,
        "per_minute_waiting_charge": perMinuteWaitingCharge,
        "cancelation_charges": cancelationCharges,
        "cancel_by": cancelBy,
        "payment_id": paymentId,
        "payment_type": paymentType,
        "payment_status": paymentStatus,
        "extra_charges": List<dynamic>.from(extraCharges.map((x) => x)),
        "coupon_discount": couponDiscount,
        "coupon_code": couponCode,
        "coupon_data": couponData,
        "is_rider_rated": isRiderRated,
        "is_driver_rated": isDriverRated,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_ride_for_other": isRideForOther,
        "other_rider_data": otherRiderData,
        "is_urgent": isUrgent,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "user_note": userNote,
        "weight": weight,
        "dimensions": dimensions,
        "additional_equipments": equipments,
        "helper": helpers,
      };
}

class Rider {
  int id;
  String firstName;
  String lastName;
  String displayName;
  String email;
  String username;
  String userType;
  String? address;
  String? contactNumber;
  String? profileImage;
  String? latitude;
  String? longitude;
  num rating;

  Rider({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.email,
    required this.username,
    required this.userType,
    required this.address,
    required this.contactNumber,
    required this.profileImage,
    required this.latitude,
    required this.longitude,
    required this.rating,
  });

  factory Rider.fromJson(Map<String, dynamic> json) => Rider(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        displayName: json["display_name"],
        email: json["email"],
        username: json["username"],
        userType: json["user_type"],
        address: json["address"],
        contactNumber: json["contact_number"],
        profileImage: json["profile_image"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "display_name": displayName,
        "email": email,
        "username": username,
        "user_type": userType,
        "address": address,
        "contact_number": contactNumber,
        "profile_image": profileImage,
        "latitude": latitude,
        "longitude": longitude,
        "rating": rating,
      };
}

class Payment {
  int? id;
  int? rideRequestId;
  int? riderId;
  String? riderName;
  DateTime? datetime;
  double? totalAmount;
  String? receivedBy;
  num? adminCommission;
  num? fleetCommission;
  num? driverFee;
  num? driverTips;
  num? driverCommission;
  String? txnId;
  String? paymentType;
  String? paymentStatus;
  DateTime createdAt;
  DateTime updatedAt;

  Payment({
    required this.id,
    required this.rideRequestId,
    required this.riderId,
    required this.riderName,
    required this.datetime,
    required this.totalAmount,
    required this.receivedBy,
    required this.adminCommission,
    required this.fleetCommission,
    required this.driverFee,
    required this.driverTips,
    required this.driverCommission,
    required this.txnId,
    required this.paymentType,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        rideRequestId: json["ride_request_id"],
        riderId: json["rider_id"],
        riderName: json["rider_name"],
        datetime:
            json["datetime"] != null ? DateTime.parse(json["datetime"]) : null,
        totalAmount: json["total_amount"] != null
            ? double.parse(json["total_amount"].toString())
            : json["total_amount"],
        receivedBy: json["received_by"],
        adminCommission: json["admin_commission"] != null
            ? double.parse(json["admin_commission"].toString())
            : json["admin_commission"],
        fleetCommission: json["fleet_commission"] != null
            ? double.parse(json["fleet_commission"].toString())
            : json["fleet_commission"],
        driverFee: json["driver_fee"] != null
            ? double.parse(json["driver_fee"].toString())
            : json["driver_fee"],
        driverTips: json["driver_tips"] != null
            ? double.parse(json["driver_tips"].toString())
            : json["driver_tips"],
        driverCommission: json["driver_commission"] != null
            ? double.parse(json["driver_commission"].toString())
            : json["driver_commission"],
        txnId: json["txn_id"],
        paymentType: json["payment_type"],
        paymentStatus: json["payment_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ride_request_id": rideRequestId,
        "rider_id": riderId,
        "rider_name": riderName,
        "datetime": datetime?.toIso8601String(),
        "total_amount": totalAmount,
        "received_by": receivedBy,
        "admin_commission": adminCommission,
        "fleet_commission": fleetCommission,
        "driver_fee": driverFee,
        "driver_tips": driverTips,
        "driver_commission": driverCommission,
        "txn_id": txnId,
        "payment_type": paymentType,
        "payment_status": paymentStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
