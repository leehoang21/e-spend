import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';
part 'pick_image_state.dart';

@injectable
class PickImageCubit extends BaseBloc<PickImageState> {
  PickImageCubit() : super(PickImageInitial());

  void addImage(File image) {
    emit(ResultImage(image));
  }
}
