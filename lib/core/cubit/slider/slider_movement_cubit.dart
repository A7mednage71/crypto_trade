import 'package:flutter_bloc/flutter_bloc.dart';

class SliderMovementCubit extends Cubit<int> {
  SliderMovementCubit(super.initialState);

  static SliderMovementCubit get(context) => BlocProvider.of(context);

  void changeCurrentSliderViewIndex(int index) {
    emit(index);
  }
}
