import 'package:equatable/equatable.dart';

sealed class SplashEvent extends Equatable{
}

final class SplashNavigate extends SplashEvent {
  final String? userJson;
  SplashNavigate({this.userJson});

  @override
  // TODO: implement props
  List<Object?> get props => [userJson];

}


