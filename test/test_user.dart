import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spendytracking/data/repositories/auth_repository.dart';

import 'test_user.mocks.dart';

@GenerateMocks([AuthRepository])
main() {
  group("test auth repo ", () {
    late MockAuthRepository mockAuthRepository;
    setUp(() {
      mockAuthRepository = MockAuthRepository();
    });

    test("test id return", () async {
      when(mockAuthRepository.getIntIdUserLocal()).thenAnswer((_) async {
        return 0;
      });
      expect(await mockAuthRepository.getIntIdUserLocal(), isA<int>());
      expect(await mockAuthRepository.getIntIdUserLocal(), equals(0));
      expect(await mockAuthRepository.getIntIdUserLocal(), isNotNull);
    });
  });

  // group("test login bloc", () {
  //   final mockAuthUseCase = MockAuthUseCase();
  //   final loginBloc = LoginBloc(authUseCase: mockAuthUseCase);
  //   // final user = UserModel(userId: "12", name: "Checking", avatar: "http");
  //   blocTest(
  //     'emits [LoginInit, LoginError] when stateUserLogin returns an error',
  //     build: () {
  //       when(mockAuthUseCase.stateUserLogin())
  //           .thenAnswer((_) async => 'Login failed');
  //       return loginBloc;
  //     },
  //     act: (bloc) => bloc.add(LoginEventGetUser()),
  //     expect: () => [
  //       LoginInit(),
  //       LoginError(error: 'Login failed'),
  //     ],
  //   );
  //
  //   blocTest<LoginBloc, LoginState>(
  //     'emits [LoginInit, LoginLoading, LoginSuccess] when all async methods succeed',
  //     build: () {
  //       when(mockAuthUseCase.stateUserLogin()).thenAnswer((_) async => '');
  //       when(mockAuthUseCase.addUser()).thenAnswer((_) async => '');
  //       when( mockAuthUseCase.setUserId()).thenAnswer((_) async => null);
  //       return loginBloc;
  //     },
  //     act: (bloc) => bloc.add(LoginEventGetUser()),
  //     expect: () => [
  //       LoginInit(),
  //       LoginLoading(),
  //       LoginSuccess(),
  //     ],
  //   );
  // });
}
