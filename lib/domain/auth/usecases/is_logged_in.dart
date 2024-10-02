import 'package:netflix/core/usecase/usecase.dart';
import 'package:netflix/domain/auth/repositories/auth.dart';
import 'package:netflix/service_locator.dart';

class IsLoggedInUseCase extends UseCase<bool,dynamic> {
  
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
  
}