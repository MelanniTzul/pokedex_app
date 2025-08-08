import 'package:flutter/material.dart';
import 'package:pokedex_app/features/domain/entities/pokemon_enitity.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_card.dart';
import 'package:pokedex_app/features/shared/widgets/sort_options.dart';
import 'package:pokedex_app/features/shared/widgets/type_filter.dart';

//state no recibe cosas
class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListrScreenState();
}

class _PokemonListrScreenState extends State<PokemonListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<PokemonEnitity> pokemonList = [
    PokemonEnitity(
      id: '001',
      name: 'Bulbasour',
      types: ['hoja', 'Venenoso'],
      image: 'assets/pokemons/bulbasour.png',
    ),
    PokemonEnitity(
      id: '002',
      name: 'Charizard',
      types: ['Fuego', 'Volador'],
      image: 'assets/pokemons/charizard.png',
    ),
    PokemonEnitity(
      id: '003',
      name: 'Pikachu',
      types: [
        'Electrico',
      ],
      image: 'assets/pokemons/pikachu.png',
    ),
    PokemonEnitity(
      id: '004',
      name: 'Squirtle',
      types: [
        'Agua',
      ],
      image: 'assets/pokemons/squirtle.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
            child: Column(children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  hintText: 'Buscar Pokemon...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: TypeFilter(),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      child: SortOptions(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: pokemonList.length,
                  itemBuilder: (context, index) {
                    return PokemonCard(
                      pokemon: pokemonList[index],
                    );
                  }))
          //SizedBox(height: 30),
        ])));
  }

  @override

  // TODO: implement ==
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
