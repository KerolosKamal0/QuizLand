class ApiResponse<T> {
  final T? data;
  final String? error;
  final bool success;

  const ApiResponse._({this.data, this.error, required this.success});

  factory ApiResponse.success(T data) =>
      ApiResponse._(data: data, success: true);

  factory ApiResponse.failure(String error) =>
      ApiResponse._(error: error, success: false);

  bool get hasData => data != null;

  @override
  String toString() =>
      'ApiResponse(success: $success, data: $data, error: $error)';
}
