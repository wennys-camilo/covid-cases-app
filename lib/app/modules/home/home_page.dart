import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/ui/themes/app_colors.dart';
import '../login/login_store.dart';
import 'home_store.dart';
import 'widgets/card_tile_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();

    reaction((_) => store.failure, (_) {
      store.failure!.map((failure) {
        edgeAlert(context,
            title: 'Atenção',
            description: failure.message,
            gravity: Gravity.top,
            backgroundColor: AppColors.red,
            icon: Icons.error);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Casos de Covid'),
        backgroundColor: AppColors.blue,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await Modular.get<LoginStore>().signOut();
                Modular.to.navigate('/');
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Observer(
        builder: (_) {
          return store.casesCovid == null
              ? Center(
                  child: TextButton(
                    onPressed: () {
                      store.fetchCases();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        store.loading
                            ? CircularProgressIndicator(
                                color: AppColors.blue,
                              )
                            : const Icon(Icons.refresh),
                        Text(
                          store.loading ? 'Aguarde' : 'Buscar novamente',
                          style: TextStyle(color: AppColors.blue),
                        ),
                      ],
                    ),
                  ),
                )
              : store.loading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.blue,
                    ))
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: store.casesCovid?.results.length,
                      itemBuilder: (context, i) {
                        return CardTileWidget(
                            caseCovid: store.casesCovid!.results[i]);
                      },
                    );
        },
      ),
      floatingActionButton: Observer(builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: store.casesCovid?.previous != null
                    ? AppColors.red
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                onPressed: store.casesCovid?.previous != null
                    ? () async {
                        await store.fetchCases(
                            url: store.casesCovid!.previous ?? '');
                      }
                    : null,
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                onPressed: () async {
                  await store.fetchCases(url: store.casesCovid!.next ?? '');
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
