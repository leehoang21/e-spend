import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TabMangerCubit extends Cubit<int> {
  TabMangerCubit() : super(0);

  void changePage(int index) {
    emit(index);
  }
}
