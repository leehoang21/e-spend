import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../data/models/wallet_model.dart';
import '../../../../../../domain/use_cases/wallet_use_case.dart';

class WalletListState extends Equatable {
  const WalletListState();

  @override
  List<Object?> get props => [];
}

class WalletListNoResult extends WalletListState {}

class WalletListLoading extends WalletListState {}

class WalletListLoaded extends WalletListState {
  final List<WalletModel> walletList;

  const WalletListLoaded(this.walletList);

  @override
  List<Object?> get props => walletList;
}

class WalletListError extends WalletListState {
  final String error;

  const WalletListError(this.error);

  @override
  List<Object?> get props => [error];
}

@injectable
class WalletListCubit extends Cubit<WalletListState> {
  final WalletUseCase walletUseCase;

  WalletListCubit(this.walletUseCase) : super(WalletListLoading()) {
    getWalletList();
  }

  Future<void> getWalletList() async {
    emit(WalletListLoading());
    final result = await walletUseCase.get();
    result.fold((l) {
      if (l.isEmpty) {
        emit(WalletListNoResult());
      } else {
        emit(WalletListLoaded(l));
      }
    }, (r) {
      emit(WalletListError(r.toString()));
    });
  }
}
