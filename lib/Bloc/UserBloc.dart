import 'package:flutter_clean_architecture/beans/UserRespBean.dart';
import 'package:flutter_clean_architecture/network/repository/UserRepository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_clean_architecture/beans/Quotes.dart';
import 'package:rxdart/subjects.dart';

class UserBloc {
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<UserResponse> _subject = BehaviorSubject<UserResponse>();
  final BehaviorSubject<Quotes> _qotes_observer = BehaviorSubject<Quotes>();
  getUser() async {
    UserResponse response = await _repository.getUser();
    _subject.sink.add(response);
  }

  getQuotes() async {
    Quotes response = await _repository.getQuotes();
    _qotes_observer.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserResponse> get subject => _subject;
  BehaviorSubject<Quotes> get qotes_observer => _qotes_observer;

}
final userBloc = UserBloc();