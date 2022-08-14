import 'package:logger/logger.dart';

class Log{
  static Logger log = new Logger();

  static void d(dynamic msg){
    log.d(msg);
  }

  static void i(dynamic msg){
    log.i(msg);
  }

  static void w(dynamic msg){
    log.w(msg);
  }

  static void e(dynamic msg){
    log.e(msg);
  }
}