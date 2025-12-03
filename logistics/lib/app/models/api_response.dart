class ApiResponse<T> {
  final int code;
  final String msg;
  final T? data;

  ApiResponse({
    required this.code,
    required this.msg,
    this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic)? fromJsonT,
  ) {
    return ApiResponse<T>(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: fromJsonT != null && json['data'] != null
        ? fromJsonT(json['data'])
        : json['data'] as T?,
    );
  }

  bool get isSuccess => code == 0;
}