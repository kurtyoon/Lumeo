import 'package:Lumeo/core/wrapper/state_wrapper.dart';

abstract class SyncNoConditionUseCase<Type> {
  StateWrapper<Type> execute();
}
