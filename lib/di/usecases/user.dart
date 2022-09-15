import 'package:data/di/repository_module.dart';
import 'package:domain/usecase/user/get_current_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final getCurrentUserUseCaseProvider = Provider.autoDispose<GetCurrentUserUseCase>(
      (ref) => GetCurrentUserUseCase(ref.read(userRepoProvider),),);
