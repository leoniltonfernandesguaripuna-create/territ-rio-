import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/territorio.dart';

class TerritorioDetailScreen extends StatefulWidget {
  final Territorio territorio;

  const TerritorioDetailScreen({super.key, required this.territorio});

  @override
  State<TerritorioDetailScreen> createState() => _TerritorioDetailScreenState();
}

class _TerritorioDetailScreenState extends State<TerritorioDetailScreen> {
  final ImagePicker _picker = ImagePicker();

  // FUNÇÃO PARA ADICIONAR A FOTO REAL DA GALERIA
  Future<void> _selecionarImagem() async {
    try {
      final XFile? imagemSelecionada = await _picker.pickImage(source: ImageSource.gallery);
      
      if (imagemSelecionada != null) {
        setState(() {
          widget.territorio.imagemPath = imagemSelecionada.path;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao selecionar imagem: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.territorio.nome.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1A365D),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ÁREA DA FOTO DO MAPA
            const Text('Mapa do Território', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _selecionarImagem,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  image: widget.territorio.imagemPath != null
                      ? DecorationImage(image: FileImage(File(widget.territorio.imagemPath!)), fit: BoxFit.cover)
                      : null,
                ),
                child: widget.territorio.imagemPath == null
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_photo_alternate_outlined, size: 50, color: Colors.grey),
                          SizedBox(height: 8),
                          Text('Clique para adicionar a foto do mapa', style: TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 24),

            // ==========================================
            // GRADE 1: DIRIGENTE
            // ==========================================
            const Text('DIRIGENTE', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
            const SizedBox(height: 8),
            _buildGradeDirigente(),
            const SizedBox(height: 24),

            // ==========================================
            // GRADE 2: QUADRAS TRABALHADAS
            // ==========================================
            const Text('QUADRAS TRABALHADAS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
            const SizedBox(height: 8),
            _buildGradeQuadras(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- CONSTRUÇÃO DA GRADE 1 (DIRIGENTE) ---
  Widget _buildGradeDirigente() {
    // Nota: Você citou 9 colunas, mas listou 8 títulos. Criamos as 8 exatas.
    final headers = ['DIRIGENTE', 'PUBLI', 'DATA', 'DIRIGENTE', 'PUBLI', 'DATA', 'DATA INICIAL', 'DATA FINAL'];
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Table(
          defaultColumnWidth: const FixedColumnWidth(90),
          border: TableBorder.all(color: Colors.grey.withOpacity(0.3)),
          children: [
            // Cabeçalho Azul
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFF1A365D)),
              children: headers.map((h) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  h,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                ),
              )).toList(),
            ),
            // 10 Linhas de Dados
            ...List.generate(10, (rowIndex) {
              return TableRow(
                decoration: BoxDecoration(color: rowIndex % 2 == 0 ? Colors.white : Colors.grey[50]),
                children: headers.map((h) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                      isDense: true,
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                )).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }

  // --- CONSTRUÇÃO DA GRADE 2 (QUADRAS TRABALHADAS) ---
  Widget _buildGradeQuadras() {
    final headers = List.generate(14, (index) => (index + 1).toString().padLeft(2, '0'));
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Table(
          defaultColumnWidth: const FixedColumnWidth(60),
          border: TableBorder.all(color: Colors.grey.withOpacity(0.3)),
          children: [
            // Cabeçalho Azul (01 a 14)
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFF1A365D)),
              children: headers.map((h) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  h,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              )).toList(),
            ),
            // 10 Linhas de Dados
            ...List.generate(10, (rowIndex) {
              return TableRow(
                decoration: BoxDecoration(color: rowIndex % 2 == 0 ? Colors.white : Colors.grey[50]),
                children: headers.map((h) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                      isDense: true,
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                )).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
