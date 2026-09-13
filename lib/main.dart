import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Importa a tela inicial (que criaremos depois)

void main() {
  runApp(const TerritorioApp());
}

class TerritorioApp extends StatelessWidget {
  const TerritorioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapa do Território',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Cores base do aplicativo
        primaryColor: const Color(0xFF1A365D), // Azul escuro
        scaffoldBackgroundColor: const Color(0xFFF3F4F6), // Cinza claro
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const HomeScreen(), // Define a tela inicial
    );
  }
}
class Territorio {
  final int id;
  String nome;
  bool isSelecionado;
  String? imagemPath; // Armazena o caminho da foto salva no celular

  Territorio({
    required this.id,
    required this.nome,
    this.isSelecionado = false,
    this.imagemPath,
  });
}
                    
