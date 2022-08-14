class HttpResponse<T>{
  int code;
  String message;
  T? bean;

  HttpResponse(this.code, this.message, this.bean);

  HttpResponse.n(this.code, this.message);

  bool isSuccess(){
    return code == 200;
  }
}