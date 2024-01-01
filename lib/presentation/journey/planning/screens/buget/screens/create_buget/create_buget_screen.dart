import 'package:flutter/material.dart';

class CreateBugetScreen extends StatelessWidget {
  const CreateBugetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_e_spend/common/enums/category.dart';
// import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
// import 'package:flutter_e_spend/common/extension/num_extension.dart';
// import 'package:flutter_e_spend/data/models/buget_model.dart';

// class CreateBugetScreen extends StatefulWidget {
//   final BugetModel? data;

//   const CreateBugetScreen({Key? key, this.data}) : super(key: key);
//   @override
//   State<CreateBugetScreen> createState() => _CreateBugetScreenState();
// }

// class _CreateBugetScreenState extends State<CreateBugetScreen> {
//   final TextEditingController _amountCtrl = TextEditingController();

//   final TextEditingController _walletCtrl = TextEditingController();

//   final TextEditingController _categoryCtl = TextEditingController();

//   final TextEditingController _dateCtl = TextEditingController();

//   final TextEditingController _noteCtl = TextEditingController();
//   String _walletImage = '';

//   @override
//   void initState() {
//     // if (widget.data != null) {
//     //   _amountCtrl.text = (widget.data?.amount ?? 0).getTextAmount;
//     //   _walletCtrl.text = widget.data?.wallet?.walletName ?? '';
//     //   _categoryCtl.text = widget.data?.category?.category.title ?? '';
//     //   _dateCtl.text = (widget.data?.time ?? DateTime.now()).getTextDate;
//     //   _noteCtl.text = widget.data?.note ?? '';
//     //   _walletImage = widget.data!.wallet.walletImage ?? '';
//     //   context.read<CreateTransactionBloc>().initial(widget.data!);
//     //   context.read<AddPhotoBloc>().init(widget.data!.photos ?? []);
//     // }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _amountCtrl.dispose();
//     _walletCtrl.dispose();
//     _categoryCtl.dispose();
//     _dateCtl.dispose();
//     _noteCtl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldWidget(
//       appbar: AppBarWidget(
//         title: widget.transaction == null
//             ? CreateTransactionConstants.addTransaction.tr
//             : CreateTransactionConstants.updateTransaction.tr,
//       ),
//       body: BlocListener<CreateTransactionBloc, CreateTransactionState>(
//         listener: (context, state) {
//           if (state.status == CreateTransactionStatus.succes) {
//             Navigator.pop(context);
//           }
//         },
//         child: LayoutBuilder(builder: (context, constraint) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minHeight: constraint.maxHeight),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: AppDimens.height_24,
//                       ),
//                       CreateTransactionForm(
//                         walletImage: _walletImage,
//                         amountCtrl: _amountCtrl,
//                         walletCtrl: _walletCtrl,
//                         categoryCtl: _categoryCtl,
//                         dateCtl: _dateCtl,
//                         noteCtl: _noteCtl,
//                       ),
//                       SizedBox(
//                         height: AppDimens.height_12,
//                       ),
//                       const InvoicePhotosWidget(),
//                       SizedBox(
//                         height: AppDimens.height_12,
//                       ),
//                     ],
//                   ),
//                   BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
//                     buildWhen: (previous, current) =>
//                         previous.buttonIsValid != current.buttonIsValid,
//                     builder: (context, state) {
//                       return TextButtonWidget(
//                           onPressed: () {
//                             if (state.buttonIsValid) {
//                               if (widget.transaction != null) {
//                                 _onEdit(context);
//                               } else {
//                                 _onCreate(context);
//                               }
//                             }
//                           },
//                           title: widget.transaction == null
//                               ? CreateTransactionConstants.create.tr
//                               : CreateTransactionConstants.update.tr);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }

//   void _onCreate(BuildContext context) {
//     context.read<CreateTransactionBloc>().onCreate(
//           note: _noteCtl.text,
//           photos: context.read<AddPhotoBloc>().state.photos,
//         );
//   }

//   void _onEdit(BuildContext context) {
//     context.read<CreateTransactionBloc>().onEdit(
//           id: widget.data!.id!,
//           note: _noteCtl.text,
//           photos: context.read<AddPhotoBloc>().state.photos,
//         );
//   }
// }
