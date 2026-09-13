import 'package:flutter/material.dart';
import '../models/territorio.dart';
import 'territorio_detail_screen.dart';

class TerritoriosScreen extends StatefulWidget {
  const TerritoriosScreen({super.key});

  @override
  State<TerritoriosScreen> createState() => _TerritoriosScreenState();
}

class _TerritoriosScreenState extends State<TerritoriosScreen> {
  List<Territorio> territorios = [];

  @override
  void initState() {
    super.initState();
    // Cria os 14 territórios automaticamente
    for (int i = 1; i <= 14; i++) {
      territorios.add(Territorio(id: i, nome: 'Território $i'));
    }
  }

  // FUNÇÃO PARA ADICIONAR NOVO TERRITÓRIO
  void _adicionarTerritorio() {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Novo Território', style: TextStyle(color: Color(0xFF1A365D), fontWeight: FontWeight.bold)),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Digite o nome...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A365D)),
              onPressed: () {
                setState(() {
                  int novoId = territorios.length + 1;
                  String nome = controller.text.trim().isEmpty ? 'Território $novoId' : controller.text.trim();
                  territorios.add(Territorio(id: novoId, nome: nome));
                });
                Navigator.pop(context);
              },
              child: const Text('Adicionar', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  // FUNÇÃO PARA EDITAR O NOME DO TERRITÓRIO
  void _editarNomeTerritorio(int index) {
    final territorio = territorios[index];
    final TextEditingController controller = TextEditingController(text: territorio.nome);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text('Editar Território ${territorio.id}', style: const TextStyle(color: Color(0xFF1A365D), fontWeight: FontWeight.bold)),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Digite o novo nome...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A365D)),
              onPressed: () {
                setState(() {
                  territorio.nome = controller.text.trim().isEmpty ? 'Sem nome' : controller.text.trim();
                });
                Navigator.pop(context);
              },
              child: const Text('Salvar', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  // FUNÇÃO PARA MARCAR/DESMARCAR O TERRITÓRIO
  void _alternarSelecao(int index) {
    setState(() {
      territorios[index].isSelecionado = !territorios[index].isSelecionado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TERRITÓRIOS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1.2)),
        backgroundColor: const Color(0xFF1A365D),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      // BOTÃO FLUTUANTE PARA ADICIONAR TERRITÓRIO
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarTerritorio,
        backgroundColor: const Color(0xFF1A365D),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: territorios.length,
        itemBuilder: (context, index) {
          final territorio = territorios[index];
          final bool isSelecionado = territorio.isSelecionado;

          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: isSelecionado ? Colors.green : Colors.transparent, width: 2),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              // Ao clicar no cartão, abre a tela de detalhes do território
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TerritorioDetailScreen(territorio: territorio),
                  ),
                );
                setState(() {}); // Atualiza a tela ao voltar
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    // NÚMERO DO TERRITÓRIO
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: isSelecionado ? Colors.green.withOpacity(0.2) : const Color(0xFF1A365D).withOpacity(0.1),
                      child: Text(
                        '${territorio.id}',
                        style: TextStyle(color: isSelecionado ? Colors.green : const Color(0xFF1A365D), fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // NOME E STATUS
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            territorio.nome,
                            style: const TextStyle(color: Color(0xFF1A365D), fontWeight: FontWeight.w600, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            isSelecionado ? 'Território em uso' : 'Disponível',
                            style: TextStyle(color: isSelecionado ? Colors.green : Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    // BOTÃO EDITAR NOME
                    IconButton(
                      icon: const Icon(Icons.edit_outlined, size: 20, color: Color(0xFF1A365D)),
                      onPressed: () => _editarNomeTerritorio(index),
                      tooltip: 'Trocar nome',
                    ),
                    // CHECKBOX DE SELEÇÃO
                    Checkbox(
                      value: isSelecionado,
                      activeColor: Colors.green,
                      onChanged: (bool? value) => _alternarSelecao(index),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
