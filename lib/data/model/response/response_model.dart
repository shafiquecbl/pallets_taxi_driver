class ResponseModel {
  bool isSuccess;
  String message;

  ResponseModel({
    required this.isSuccess,
    required this.message,
  });

  ResponseModel copyWith({
    bool? isSuccess,
    String? message,
  }) {
    return ResponseModel(
      isSuccess: isSuccess ?? this.isSuccess,
      message: message ?? this.message,
    );
  }
}

ResponseModel get successResponse => ResponseModel(
      isSuccess: true,
      message: 'success',
    );
ResponseModel get failedResponse => ResponseModel(
      isSuccess: false,
      message: 'failed',
    );
