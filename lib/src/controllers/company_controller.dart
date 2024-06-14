import 'dart:convert';

import 'package:br_api/br_api.dart';
import 'package:fipe_consultation/src/models/company_model.dart';
import 'package:mobx/mobx.dart';

part 'company_controller.g.dart';

class CompanyController = CompanyControllerBase with _$CompanyController;

abstract class CompanyControllerBase with Store {
  @observable
  bool isLoading = false;

  @observable
  CompanyModel? company;

  @action
  Future<void> searchCnpj(String cnpj) async {
    try {
      isLoading = true;
      final data = await Company.searchCnpj(cnpj: cnpj);
      print(jsonEncode(data));
      company = CompanyModel.fromJson(jsonDecode(jsonEncode(data)));
    }finally {
      isLoading = false;
    }
  }
}
