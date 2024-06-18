import 'dart:convert';
import 'dart:io';
import 'package:fipe_consultation/src/models/company_model.dart';
import 'package:http/http.dart';
import 'package:mobx/mobx.dart';

part 'company_controller.g.dart';

class CompanyController = CompanyControllerBase with _$CompanyController;

abstract class CompanyControllerBase with Store {
  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @observable
  CompanyModel? company;

  @action
  Future<void> searchCnpj(String cnpj) async {
    try {
      isLoading = true;
      final response = await get(
        Uri.parse('https://brasilapi.com.br/api/cnpj/v1/$cnpj'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json'
        },
      ).timeout(const Duration(seconds: 10));

      company = null;
      errorMessage = '';

      switch (response.statusCode) {
        case 200:
          company = CompanyModel.fromJson(jsonDecode(response.body));
          break;
        case 404:
          errorMessage = 'Nenhum resultado encontrado!';
          break;
        default:
          errorMessage = 'Nenhum resultado encontrado!';
          throw Exception('Erro ao buscar o CNPJ: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar o CNPJ: $e');
    } finally {
      isLoading = false;
    }
  }
}
