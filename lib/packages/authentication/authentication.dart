import 'dart:async';


enum AuthneticationStatus {
  authenticated,
  unauthenticated,
  unknown,
}



class Authentication {


  final _controller = StreamController<AuthneticationStatus>();


  Stream<AuthneticationStatus> get status async* {

    await Future.delayed(const Duration(seconds: 3,),);
  }
  
  
}