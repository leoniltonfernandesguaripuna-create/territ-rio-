import 'package:flutter/material.dart';
import '../widgets/calendar_strip.dart'; // Importa o calendário que fizemos
import 'territorios_screen.dart'; // Importa a tela de territórios (próximo arquivo)
import 'placeholder_screen.dart'; // Importa a tela de exemplo

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. BARRA SUPERIOR AZUL ESCURA
      appBar: AppBar(
        title: const Text(
          'MAPA DO TERRITÓRIO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1A365D),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. CALENDÁRIO HORIZONTAL
            const CalendarStrip(),
            const SizedBox(height: 24),

            // 3. TÍTULO DA SEÇÃO
            const Text(
              'Território de Congregação',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A365D),
              ),
            ),
            const SizedBox(height: 16),

            // 4. GRADE DE MENUS (6 BOTÕES)
            GridView.count(
              crossAxisCount: 2, // 2 colunas
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                _buildMenuCard(
                  context,
                  icon: Icons.map_outlined,
                  title: 'Territórios',
                  onTap: () => _navegarParaTela(context, 'Territórios'),
                ),
                _buildMenuCard(
                  context,
                  icon: Icons.menu_book_outlined,
                  title: 'Serviço de Campo',
                  onTap: () => _navegarParaTela(context, 'Serviço de Campo'),
                ),
                _buildMenuCard(
                  context,
                  icon: Icons.calendar_month_outlined,
                  title: 'Eventos',
                  onTap: () => _navegarParaTela(context, 'Eventos'),
                ),
                _buildMenuCard(
                  context,
                  icon: Icons.people_outline,
                  title: 'Dirigente',
                  onTap: () => _navegarParaTela(context, 'Dirigente'),
                ),
                _buildMenuCard(
                  context,
                  icon: Icons.assignment_outlined,
                  title: 'S.13',
                  onTap: () => _navegarParaTela(context, 'S.13'),
                ),
                _buildMenuCard(
                  context,
                  icon: Icons.admin_panel_settings_outlined,
                  title: 'Administrador',
                  onTap: () => _navegarParaTela(context, 'Administrador'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // FUNÇÃO DE NAVEGAÇÃO (Abre a tela correspondente ao botão clicado)
  void _navegarParaTela(BuildContext context, String tituloTela) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (tituloTela == 'Territórios') {
            return const TerritoriosScreen();
          }
          return PlaceholderScreen(title: tituloTela);
        },
      ),
    );
  }

  // WIDGET AUXILIAR PARA CRIAR OS CARTÕES DO MENU
  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: const Color(0xFF1A365D),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A365D),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
