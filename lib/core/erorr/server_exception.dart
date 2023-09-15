import '../networking/networking_modle.dart';

class ServerException implements Exception {
  final NetWorkingModle netWorkingModle;
  const ServerException({required this.netWorkingModle});
}

// Local Database ......

class LocalDataBase implements Exception {
  final String massage;
  const LocalDataBase({required this.massage});
}
