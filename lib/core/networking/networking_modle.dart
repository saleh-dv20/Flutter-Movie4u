import 'package:equatable/equatable.dart';

class NetWorkingModle extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const NetWorkingModle({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });
  
  factory NetWorkingModle.fromJson(Map<String, dynamic> json) =>
      NetWorkingModle(
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
        success: json['success'],
      );

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
