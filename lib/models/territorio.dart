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
