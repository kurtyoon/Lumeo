import 'package:Lumeo/core/wrapper/state_wrapper.dart';

abstract class AsyncNoConditionUseCase<Type> {
  Future<StateWrapper<Type>> execute();
}
