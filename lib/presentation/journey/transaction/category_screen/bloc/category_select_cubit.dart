import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/models/category_model.dart';

@injectable
class CategorySelectCubit extends Cubit<CategoryModel?> {
  CategorySelectCubit() : super(null);

  void changeSelectCategory(CategoryModel? category) {
    emit(category);
  }
}
