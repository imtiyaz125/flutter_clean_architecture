import 'dart:async';
import 'package:flutter_clean_architecture/Utils/ApiConstants.dart';
import 'package:flutter_clean_architecture/network/NetworkBound.dart';
import 'package:flutter_clean_architecture/beans/UserRespBean.dart';
import 'package:flutter_clean_architecture/beans/Quotes.dart';

class UserRepository {
  NetworkUtil _netUtil = new NetworkUtil();


  Future<UserResponse> getUser() {
    return _netUtil.getReq(ApiConstants.USERS_URL).then((dynamic res) {
      print(res.toString());
      return UserResponse.fromJson(res.data);
    });
  }
  Future<Quotes> getQuotes() {
    return _netUtil.getReq(ApiConstants.QUOTES_URL).then((dynamic res) {
      print(res.toString());
      return Quotes.fromJson(res.data);
    });
  }


}