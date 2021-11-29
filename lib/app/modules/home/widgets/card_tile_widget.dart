import 'package:flutter/material.dart';
import '../../../../core/data/models/covid_case.dart';
import '../../../../core/ui/themes/app_colors.dart';
import '../../../../core/ui/themes/app_text_styles.dart';

class CardTileWidget extends StatelessWidget {
  final CovidCase caseCovid;

  const CardTileWidget({Key? key, required this.caseCovid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Card(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85 / 3,
                height: MediaQuery.of(context).size.height * 0.20 / 2,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      caseCovid.state!,
                      style: AppTextStyles.ufText,
                    ),
                    Text(
                      "${caseCovid.deathRate.toString()}%",
                      style: AppTextStyles.ufText,
                    ),
                  ],
                )),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                caseCovid.city != null
                    ? Text(
                        caseCovid.city!,
                        style: AppTextStyles.munText,
                      )
                    : Text(
                        'Estado: ${caseCovid.state}',
                        style: AppTextStyles.stateText,
                      ),
                Text('Casos confimardos: ${caseCovid.confirmed.toString()}'),
                Text('Data: ${caseCovid.date}'),
                Text('Mortes: ${caseCovid.deaths}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
