abstract class Failure {
  final String errormsg;

  Failure(this.errormsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errormsg);

  // factory ServerFailure.fromDioError(DioError dioError){
  //   return switch (dioError.type)
  // ;}
  factory ServerFailure.fromResponse(int statuscode, dynamic respons) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(respons['error']['message']);
    } else {
      return ServerFailure('not found 404');
    }
  }
}
