import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  '0001',
                  style: textStyle.bodyMedium,
                ),
                Text(
                  'Bulbasaur',
                  style: textStyle.bodyMedium,
                ),
                Text(
                  'ACÁ VA A IR TIPO',
                  style: textStyle.bodyMedium,
                )
              ],
            ),
          ),
          const Expanded(
            child: Stack(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
