import 'package:digimon_2324/footballer_card.dart';
import 'package:flutter/material.dart';
import 'footballer_model.dart';

class FootballerList extends StatelessWidget {
  final List<Footballer> footballers;
  const FootballerList(this.footballers, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: footballers.length,
      // ignore: avoid_types_as_parameter_names
      itemBuilder: (context, int) {
        return FootballerCard(footballers[int]);
      },
    );
  }
}
