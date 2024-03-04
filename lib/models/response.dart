class ResponseModel<T> {
  T? message;
  bool? success;
  ResponseModel({required this.message, required this.success});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    return data;
  }
}
