import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';


import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);



  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Conversor de Moedas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.attach_money,
                size: 100,
                color: Colors.black,
              ),
              buildTextField('Real', 'R\$', viewModel.realController, viewModel.realChanged),
              const SizedBox(
                height: 12,
              ),
              buildTextField('Dólar', 'US\$', viewModel.dollarController, viewModel.dollarChanged),
              const SizedBox(
                height: 12,
              ),
              buildTextField('Euro', '€', viewModel.euroController, viewModel.euroChanged),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.getMoney());

}



buildTextField(String label, String prefix, TextEditingController controllerInput, Function(String) handleChanged) {
  return TextField(
    controller: controllerInput,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(),
        prefixText: prefix,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        )),
    style: const TextStyle(color: Colors.black, fontSize: 25),
    onChanged: handleChanged,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
  );
}

