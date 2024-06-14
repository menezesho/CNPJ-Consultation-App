import 'package:fipe_consultation/src/components/loader_component.dart';
import 'package:fipe_consultation/src/controllers/company_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CompanyController companyController = CompanyController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  MaskedTextController cnpjController = MaskedTextController(mask: '00.000.000/0000-00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta CNPJ'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Observer(
            builder: (_) => companyController.isLoading
                ? const LoaderComponent()
                : Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: cnpjController,
                                decoration: const InputDecoration(
                                  labelText: 'CNPJ',
                                  hintText: '00.000.000/0000-00',
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () => companyController.searchCnpj(cnpjController.text.replaceAll('.', '').replaceAll('-', '').replaceAll('/', '')),
                                child: const Text('Consultar CNPJ'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      companyController.company == null
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                Text('CNPJ: ${companyController.company?.cnpj}'),
                                Text('UF: ${companyController.company?.uf}'),
                                Text('CEP: ${companyController.company?.cep}'),
                                Text('País: ${companyController.company?.country}'),
                                Text('Nome do sócio: ${companyController.company?.memberName}'),
                                Text('Email: ${companyController.company?.email}'),
                                Text('Porte: ${companyController.company?.size}'),
                                Text('Bairro: ${companyController.company?.neighborhood}'),
                                Text('Número: ${companyController.company?.number}'),
                                Text('Cidade: ${companyController.company?.city}'),
                                Text('Logradouro: ${companyController.company?.street}'),
                                Text('Complemento: ${companyController.company?.complement}'),
                                Text('Razão social: ${companyController.company?.socialReason}'),
                                Text('Nome fantasia: ${companyController.company?.fantasyName}'),
                                Text('Descrição: ${companyController.company?.description}'),
                                Text('Data de início: ${companyController.company?.initDate}'),
                                Text('Status de registro: ${companyController.company?.registrationStatus}'),
                              ],
                            ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
