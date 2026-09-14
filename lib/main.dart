import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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
        primaryColor: const Color(0xFF1A365D),
        scaffoldBackgroundColor: const Color(0xFFE0E0E0),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// ==========================================
// SISTEMA DE ADMINISTRADORES E PERMISSÕES
// ==========================================
class Admin {
  String nome;
  String senha;
  bool isPrincipal;
  Admin({required this.nome, required this.senha, this.isPrincipal = false});
}

class AuthManager {
  static List<Admin> admins = [];
  static Admin? adminLogado;
  static const String senhaPrincipal = '1234';
  static const int limiteMaximo = 3;

  static bool get temAdminPrincipal => admins.any((a) => a.isPrincipal);
  static bool get isLogado => adminLogado != null;
  static bool get isAdminPrincipal => adminLogado?.isPrincipal ?? false;
  static bool get podeEditarTudo => isLogado && !isAdminPrincipal;
  static bool get podeEditarGradesBasicas => true;
  static bool get podeAdicionarMais => isAdminPrincipal && admins.length < limiteMaximo;

  static String? cadastrarPrincipal(String nome, String senha) {
    if (temAdminPrincipal) return 'Já existe um administrador principal cadastrado';
    if (nome.trim().isEmpty) return 'Digite um nome válido';
    if (senha != senhaPrincipal) return 'Senha incorreta! A senha é: $senhaPrincipal';
    admins.add(Admin(nome: nome.trim(), senha: senha, isPrincipal: true));
    adminLogado = admins.last;
    SalvamentoManager.marcarAlteracao();
    return null;
  }

  static String? adicionarAdmin(String nome, String senha) {
    if (!isAdminPrincipal) return 'Apenas o administrador principal pode adicionar';
    if (admins.length >= limiteMaximo) return 'Limite de $limiteMaximo administradores atingido';
    if (nome.trim().isEmpty) return 'Digite um nome válido';
    if (senha.isEmpty) return 'Digite uma senha';
    if (admins.any((a) => a.nome.toLowerCase() == nome.trim().toLowerCase())) return 'Já existe um administrador com esse nome';
    admins.add(Admin(nome: nome.trim(), senha: senha, isPrincipal: false));
    SalvamentoManager.marcarAlteracao();
    return null;
  }

  static String? removerAdmin(String nome) {
    if (!isAdminPrincipal) return 'Apenas o administrador principal pode remover';
    if (nome == adminLogado?.nome) return 'Você não pode remover a si mesmo';
    admins.removeWhere((a) => a.nome == nome);
    SalvamentoManager.marcarAlteracao();
    return null;
  }

  static String? login(String nome, String senha) {
    final admin = admins.firstWhere(
      (a) => a.nome.toLowerCase() == nome.trim().toLowerCase() && a.senha == senha,
      orElse: () => Admin(nome: '', senha: ''),
    );
    if (admin.nome.isEmpty) return 'Nome ou senha incorretos';
    adminLogado = admin;
    return null;
  }

  static void logout() {
    adminLogado = null;
  }
}

// ==========================================
// BANNER DE PERMISSÃO
// ==========================================
Widget buildBannerPermissao() {
  if (AuthManager.podeEditarTudo) return const SizedBox.shrink();

  String mensagem;
  IconData icone;
  Color cor;

  if (AuthManager.isAdminPrincipal) {
    icone = Icons.star;
    cor = Colors.orange[800]!;
    mensagem = 'Administrador principal: você só pode gerenciar administradores.';
  } else {
    icone = Icons.edit;
    cor = Colors.blue[700]!;
    mensagem = 'Você pode editar as grades Dirigente (território) e Quadras Trabalhadas.';
  }

  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: cor.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: cor, width: 2),
    ),
    child: Row(
      children: [
        Icon(icone, color: cor, size: 22),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            mensagem,
            style: TextStyle(fontSize: 12, color: cor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

// ==========================================
// HELPER: TextField com permissão customizável
// ==========================================
Widget campoEditavel({
  required TextEditingController controller,
  TextAlign textAlign = TextAlign.center,
  TextStyle? style,
  String? hintText,
  TextStyle? hintStyle,
  EdgeInsets contentPadding = const EdgeInsets.all(12),
  VoidCallback? onChanged,
  bool isDense = true,
  double? fontSize,
  InputBorder border = InputBorder.none,
  String? labelText,
  TextStyle? labelStyle,
  Widget? prefixIcon,
  bool? editavelOverride,
}) {
  final editavel = editavelOverride ?? AuthManager.podeEditarTudo;
  return TextField(
    controller: controller,
    textAlign: textAlign,
    readOnly: !editavel,
    enabled: true,
    style: style ?? TextStyle(fontSize: fontSize ?? 14, color: const Color(0xFF1A365D), fontWeight: FontWeight.bold),
    onChanged: editavel ? (_) => onChanged?.call() : null,
    decoration: InputDecoration(
      border: border,
      contentPadding: contentPadding,
      isDense: isDense,
      hintText: hintText,
      hintStyle: hintStyle,
      labelText: labelText,
      labelStyle: labelStyle,
      prefixIcon: prefixIcon,
      filled: !editavel,
      fillColor: !editavel ? Colors.grey[200]?.withValues(alpha: 0.5) : null,
    ),
  );
}

// ==========================================
// DADOS COMPARTILHADOS
// ==========================================
class DadosCompartilhados {
  static List<String> segundaSexta = [
    'João Silva', 'Carlos Santos', 'Pedro Oliveira', 'Lucas Souza', 'Marcos Lima',
    'Mateus Costa', 'André Pereira', 'Rafael Almeida', 'Bruno Ferreira', 'Diego Rocha',
    'Antônio Cardoso', 'José Ribeiro', 'Francisco Alves', 'Manuel Monteiro', 'Raimundo Dias',
    'Sebastião Nunes', 'Vicente Prado', 'Joaquim Freitas', 'Luiz Barros', 'Elias Castro',
  ];
  static List<String> sabado = [
    'Felipe Martins', 'Gabriel Barbosa', 'Thiago Nunes', 'Rodrigo Cardoso', 'Eduardo Ramos',
    'Vinícius Dias', 'Leonardo Pinto', 'Fábio Moreira', 'Renato Correia', 'Sérgio Teixeira',
    'Alexandre Melo', 'Bernardo Pires', 'Caio Andrade', 'Douglas Bastos', 'Emerson Farias',
    'Flávio Guimarães', 'Gilberto Amaral', 'Heitor Sales', 'Ivan Bittencourt', 'Júlio César',
  ];
  static List<String> domingo = [
    'Paulo Henrique', 'Daniel Freitas', 'Marcelo Antunes', 'Roberto Cunha', 'Alexandre Braga',
    'Fernando Gomes', 'Ricardo Barros', 'Gustavo Neves', 'Hugo Castro', 'Igor Monteiro',
    'Jonas Vieira', 'Kleber Tavares', 'Leandro Machado', 'Márcio Peixoto', 'Nelson Rezende',
    'Otávio Figueiredo', 'Patrick Sampaio', 'Quirino Lopes', 'Rogério Dantas', 'Samuel Xavier',
  ];
}

// ==========================================
// ESTADO COMPARTILHADO DO S.13
// ==========================================
class BlocoS13 {
  String nomeIrmao;
  String dataDesignacao;
  String dataConclusao;
  BlocoS13({this.nomeIrmao = '', this.dataDesignacao = '', this.dataConclusao = ''});
}

class RegistroS13 {
  static Map<int, List<BlocoS13>> registros = {};
  static String anoServico = '';

  static void inicializar() {
    for (int i = 1; i <= 20; i++) {
      registros.putIfAbsent(i, () => List.generate(4, (_) => BlocoS13()));
    }
  }

  static void atualizarBloco(int territorioId, int indiceBloco, {String? nome, String? dataDesignacao, String? dataConclusao}) {
    if (indiceBloco < 0 || indiceBloco > 3) return;
    registros.putIfAbsent(territorioId, () => List.generate(4, (_) => BlocoS13()));
    final bloco = registros[territorioId]![indiceBloco];
    if (nome != null) bloco.nomeIrmao = nome;
    if (dataDesignacao != null) bloco.dataDesignacao = dataDesignacao;
    if (dataConclusao != null) bloco.dataConclusao = dataConclusao;
    SalvamentoManager.marcarAlteracao();
  }
}

// ==========================================
// MODELO DE DADOS
// ==========================================
class Territorio {
  final int id;
  String nome;
  bool isSelecionado;
  String? imagemUrl;
  Territorio({required this.id, required this.nome, this.isSelecionado = false, this.imagemUrl});
}

// ==========================================
// ESTILO DE ALTO RELEVO
// ==========================================
List<BoxShadow> get altoRelevo => [
  BoxShadow(color: Colors.black.withValues(alpha: 0.35), offset: const Offset(4, 4), blurRadius: 4),
  BoxShadow(color: Colors.white.withValues(alpha: 0.9), offset: const Offset(-3, -3), blurRadius: 4),
];

List<BoxShadow> get relevoPequeno => [
  BoxShadow(color: Colors.black.withValues(alpha: 0.35), offset: const Offset(2, 2), blurRadius: 3),
  BoxShadow(color: Colors.white.withValues(alpha: 0.9), offset: const Offset(-2, -2), blurRadius: 3),
];

// ==========================================
// GERENCIADOR DE SALVAMENTO
// ==========================================
class SalvamentoManager {
  static bool temAlteracoesNaoSalvas = false;

  static void marcarAlteracao() {
    temAlteracoesNaoSalvas = true;
  }

  static Future<bool> salvarTudo(BuildContext context) async {
    temAlteracoesNaoSalvas = false;
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8),
            Text('Tudo salvo com sucesso!', style: TextStyle(fontSize: 16)),
          ]),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    }
    return true;
  }
}

// ==========================================
// BOTÃO DE SALVAR
// ==========================================
Widget buildBotaoSalvar(BuildContext context) {
  return IconButton(
    tooltip: 'Salvar tudo',
    icon: Stack(
      children: [
        const Icon(Icons.save, color: Colors.white, size: 26),
        if (SalvamentoManager.temAlteracoesNaoSalvas)
          Positioned(
            right: 0, top: 0,
            child: Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle)),
          ),
      ],
    ),
    onPressed: () => SalvamentoManager.salvarTudo(context),
  );
}

// ==========================================
// 🌟 FUNÇÃO DE IMPRESSÃO DO S.13 (REAL)
// ==========================================
Future<void> imprimirS13(BuildContext context) async {
  try {
    final pdf = pw.Document();

    final headers = [
      'Terr.\nn.º', 'Última\ndata',
      'Designado 1', 'Datas 1',
      'Designado 2', 'Datas 2',
      'Designado 3', 'Datas 3',
      'Designado 4', 'Datas 4',
    ];

    final List<List<String>> linhas = [];
    for (int i = 1; i <= 20; i++) {
      final blocos = RegistroS13.registros[i] ?? [];
      final linha = <String>[
        (i).toString().padLeft(2, '0'),
        '',
      ];
      for (int b = 0; b < 4; b++) {
        if (b < blocos.length) {
          linha.add(blocos[b].nomeIrmao.isEmpty ? '-' : blocos[b].nomeIrmao);
          final design = blocos[b].dataDesignacao.isEmpty ? '-' : blocos[b].dataDesignacao;
          final concl = blocos[b].dataConclusao.isEmpty ? '-' : blocos[b].dataConclusao;
          linha.add('$design\n$concl');
        } else {
          linha.add('-');
          linha.add('-');
        }
      }
      linhas.add(linha);
    }

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: const pw.EdgeInsets.all(20),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Text(
                  'REGISTRO DE DESIGNAÇÃO DE TERRITÓRIO',
                  style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.SizedBox(height: 12),
              pw.Text(
                'Ano de Serviço: ${RegistroS13.anoServico.isEmpty ? "___________" : RegistroS13.anoServico}',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 12),
              pw.Table.fromTextArray(
                headers: headers,
                data: linhas,
                border: pw.TableBorder.all(width: 0.5),
                headerStyle: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
                cellStyle: const pw.TextStyle(fontSize: 7),
                headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
                cellAlignment: pw.Alignment.center,
                headerAlignment: pw.Alignment.center,
                cellHeight: 22,
                headerHeight: 30,
              ),
              pw.SizedBox(height: 12),
              pw.Text(
                '*Ao iniciar uma nova folha, use esta coluna para registrar a data em que cada território foi concluído pela última vez.',
                style: const pw.TextStyle(fontSize: 7),
              ),
              pw.SizedBox(height: 4),
              pw.Text('S-13-T 01/22', style: const pw.TextStyle(fontSize: 7)),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'S.13 - ${RegistroS13.anoServico}',
    );
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao imprimir: $e')),
      );
    }
  }
}

// ==========================================
// TELA INICIAL (HOME)
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAPA DO TERRITÓRIO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white, letterSpacing: 1.2)),
        centerTitle: true,
        backgroundColor: const Color(0xFF1A365D),
        elevation: 0,
        actions: [buildBotaoSalvar(context)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBannerPermissao(),
            const CalendarStrip(),
            const SizedBox(height: 24),
            const Text('Território de Congregação', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.0,
              children: [
                _buildMenuCard(context, icon: Icons.map_outlined, title: 'Territórios', onTap: () => _navegarParaTela(context, 'Territórios')),
                _buildMenuCard(context, icon: Icons.menu_book_outlined, title: 'Serviço de Campo', onTap: () => _navegarParaTela(context, 'Serviço de Campo')),
                _buildMenuCard(context, icon: Icons.calendar_month_outlined, title: 'Eventos', onTap: () => _navegarParaTela(context, 'Eventos')),
                _buildMenuCard(context, icon: Icons.people_outline, title: 'Dirigente', onTap: () => _navegarParaTela(context, 'Dirigente')),
                _buildMenuCard(context, icon: Icons.assignment_outlined, title: 'S.13', onTap: () => _navegarParaTela(context, 'S.13')),
                _buildMenuCard(context, icon: Icons.admin_panel_settings_outlined, title: 'Administrador', onTap: () => _navegarParaTela(context, 'Administrador')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navegarParaTela(BuildContext context, String tituloTela) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (tituloTela == 'Territórios') return const TerritoriosScreen();
          if (tituloTela == 'Serviço de Campo') return const ServicoCampoScreen();
          if (tituloTela == 'Dirigente') return const DirigentesScreen();
          if (tituloTela == 'S.13') return const S13Screen();
          if (tituloTela == 'Eventos') return const EventosScreen();
          if (tituloTela == 'Administrador') return const AdminScreen();
          return PlaceholderScreen(title: tituloTela);
        },
      ),
    ).then((_) => (context as Element).markNeedsBuild());
  }

  Widget _buildMenuCard(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF1A365D), width: 4), boxShadow: altoRelevo),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          splashColor: const Color(0xFF1A365D).withValues(alpha: 0.2),
          highlightColor: Colors.white.withValues(alpha: 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: const Color(0xFF1A365D)),
              const SizedBox(height: 12),
              Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// TELA DE ADMINISTRADOR
// ==========================================
class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() { _nomeController.dispose(); _senhaController.dispose(); super.dispose(); }

  void _limparCampos() { _nomeController.clear(); _senhaController.clear(); }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(children: [const Icon(Icons.error, color: Colors.white), const SizedBox(width: 8), Expanded(child: Text(mensagem, style: const TextStyle(fontSize: 14)))]),
      backgroundColor: Colors.red, duration: const Duration(seconds: 3),
    ));
  }

  void _mostrarSucesso(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(children: [const Icon(Icons.check_circle, color: Colors.white), const SizedBox(width: 8), Expanded(child: Text(mensagem, style: const TextStyle(fontSize: 14)))]),
      backgroundColor: Colors.green, duration: const Duration(seconds: 2),
    ));
  }

  void _cadastrarPrincipal() {
    final erro = AuthManager.cadastrarPrincipal(_nomeController.text, _senhaController.text);
    if (erro != null) { _mostrarErro(erro); } else { _mostrarSucesso('Administrador principal cadastrado!'); _limparCampos(); setState(() {}); }
  }

  void _adicionarAdmin() {
    final erro = AuthManager.adicionarAdmin(_nomeController.text, _senhaController.text);
    if (erro != null) { _mostrarErro(erro); } else { _mostrarSucesso('Administrador adicionado!'); _limparCampos(); setState(() {}); }
  }

  void _login() {
    final erro = AuthManager.login(_nomeController.text, _senhaController.text);
    if (erro != null) { _mostrarErro(erro); } else { _mostrarSucesso('Bem-vindo, ${AuthManager.adminLogado!.nome}!'); _limparCampos(); setState(() {}); }
  }

  void _logout() { AuthManager.logout(); setState(() {}); }

  void _removerAdmin(String nome) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Remover Administrador', style: TextStyle(color: Color(0xFF1A365D), fontWeight: FontWeight.bold)),
        content: Text('Deseja remover o administrador "$nome"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              final erro = AuthManager.removerAdmin(nome);
              Navigator.pop(context);
              if (erro != null) { _mostrarErro(erro); } else { _mostrarSucesso('Administrador removido!'); setState(() {}); }
            },
            child: const Text('Remover', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADMINISTRADOR', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.2)),
        backgroundColor: const Color(0xFF1A365D),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(padding: const EdgeInsets.all(16.0), child: _construirTela()),
    );
  }

  Widget _construirTela() {
    if (!AuthManager.temAdminPrincipal) return _buildFormularioPrincipal();
    if (!AuthManager.isLogado) return _buildFormularioLogin();
    return _buildPainelAdmins();
  }

  Widget _buildFormularioPrincipal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange, width: 3)),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28), SizedBox(width: 8), Text('Primeiro Acesso', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87))]),
            SizedBox(height: 8),
            Text('Cadastre o administrador principal para liberar o sistema.\nA senha inicial é: 1234', style: TextStyle(fontSize: 14, color: Colors.black87)),
          ]),
        ),
        const SizedBox(height: 24),
        _buildCampoTexto(controller: _nomeController, label: 'Nome do Administrador Principal', icon: Icons.person),
        const SizedBox(height: 16),
        _buildCampoTexto(controller: _senhaController, label: 'Senha (1234)', icon: Icons.lock, obscure: true),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity, height: 55,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A365D), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: Colors.black, width: 3))),
            onPressed: _cadastrarPrincipal,
            icon: const Icon(Icons.admin_panel_settings, color: Colors.white),
            label: const Text('Cadastrar Administrador', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildFormularioLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(children: [Icon(Icons.login, color: Color(0xFF1A365D), size: 28), SizedBox(width: 8), Text('Login de Administrador', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF1A365D)))]),
        const SizedBox(height: 8),
        const Text('Digite seu nome e senha para acessar o painel.', style: TextStyle(fontSize: 14, color: Colors.black54)),
        const SizedBox(height: 24),
        _buildCampoTexto(controller: _nomeController, label: 'Nome', icon: Icons.person),
        const SizedBox(height: 16),
        _buildCampoTexto(controller: _senhaController, label: 'Senha', icon: Icons.lock, obscure: true),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity, height: 55,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A365D), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: Colors.black, width: 3))),
            onPressed: _login,
            icon: const Icon(Icons.login, color: Colors.white),
            label: const Text('Entrar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.blue, width: 2)),
          child: const Text(
            'ℹ️ Qualquer pessoa pode editar a grade DIRIGENTE (dentro dos territórios) e QUADRAS TRABALHADAS.',
            style: TextStyle(fontSize: 12, color: Colors.black87, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }

  Widget _buildPainelAdmins() {
    final logado = AuthManager.adminLogado!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xFF1A365D), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 3), boxShadow: altoRelevo),
          child: Row(
            children: [
              CircleAvatar(radius: 26, backgroundColor: Colors.white, child: Icon(logado.isPrincipal ? Icons.star : Icons.verified_user, color: const Color(0xFF1A365D), size: 30)),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(logado.nome, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  logado.isPrincipal ? 'Administrador Principal (só gerencia admins)' : 'Administrador (pode editar tudo)',
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ])),
              IconButton(tooltip: 'Sair', icon: const Icon(Icons.logout, color: Colors.white, size: 26), onPressed: _logout),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(children: [
          const Text('Administradores Cadastrados', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFF1A365D), borderRadius: BorderRadius.circular(20)),
            child: Text('${AuthManager.admins.length}/${AuthManager.limiteMaximo}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          ),
        ]),
        const SizedBox(height: 12),
        ...AuthManager.admins.map((a) => _buildCartaoAdmin(a)),
        const SizedBox(height: 16),
        if (AuthManager.isAdminPrincipal && AuthManager.admins.length < AuthManager.limiteMaximo) ...[
          const Divider(thickness: 2),
          const SizedBox(height: 12),
          const Text('➕ Adicionar Novo Administrador', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
          const SizedBox(height: 4),
          Text('Você pode adicionar mais ${AuthManager.limiteMaximo - AuthManager.admins.length} administrador(es).', style: const TextStyle(fontSize: 13, color: Colors.black54, fontStyle: FontStyle.italic)),
          const SizedBox(height: 16),
          _buildCampoTexto(controller: _nomeController, label: 'Nome', icon: Icons.person),
          const SizedBox(height: 12),
          _buildCampoTexto(controller: _senhaController, label: 'Senha', icon: Icons.lock, obscure: true),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity, height: 50,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A365D), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: Colors.black, width: 3))),
              onPressed: _adicionarAdmin,
              icon: const Icon(Icons.person_add, color: Colors.white),
              label: const Text('Adicionar Administrador', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),
        ] else if (AuthManager.isAdminPrincipal && AuthManager.admins.length >= AuthManager.limiteMaximo) ...[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange, width: 2)),
            child: const Row(children: [Icon(Icons.info, color: Colors.orange, size: 28), SizedBox(width: 8), Expanded(child: Text('Limite de 3 administradores atingido.', style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold)))]),
          ),
        ],
      ],
    );
  }

  Widget _buildCartaoAdmin(Admin admin) {
    final isLogado = AuthManager.adminLogado?.nome == admin.nome;
    final podeRemover = AuthManager.isAdminPrincipal && !admin.isPrincipal;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: admin.isPrincipal ? Colors.orange : const Color(0xFF1A365D), width: 3), boxShadow: relevoPequeno),
      child: Row(
        children: [
          CircleAvatar(radius: 22, backgroundColor: admin.isPrincipal ? Colors.orange[100] : Colors.grey[200], child: Icon(admin.isPrincipal ? Icons.star : Icons.verified_user, color: admin.isPrincipal ? Colors.orange[800] : const Color(0xFF1A365D))),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text(admin.nome, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
              if (isLogado) ...[const SizedBox(width: 6), Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)), child: const Text('Você', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)))],
            ]),
            Text(admin.isPrincipal ? 'Principal — só gerencia admins' : 'Administrador — pode editar tudo', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
          ])),
          if (podeRemover) IconButton(icon: const Icon(Icons.delete_outline, color: Colors.red), tooltip: 'Remover', onPressed: () => _removerAdmin(admin.nome)),
        ],
      ),
    );
  }

  Widget _buildCampoTexto({required TextEditingController controller, required String label, required IconData icon, bool obscure = false}) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF1A365D), width: 3), boxShadow: relevoPequeno),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(fontSize: 16, color: Color(0xFF1A365D), fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF1A365D), fontWeight: FontWeight.bold),
          prefixIcon: Icon(icon, color: const Color(0xFF1A365D)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
      ),
    );
  }
}

// ==========================================
// TELA DE EVENTOS
// ==========================================
class EventosScreen extends StatefulWidget {
  const EventosScreen({super.key});
  @override
  State<EventosScreen> createState() => _EventosScreenState();
}

class _EventosScreenState extends State<EventosScreen> {
  static const int totalLinhas = 20;
  static const int totalGrupos = 5;
  static const int totalNumeros = 80;

  late List<List<TextEditingController>> nomeControllers;
  late List<List<bool>> pgPego;
  late List<List<List<bool>>> diasMarcados;

  static const double wN = 48;
  static const double wPG = 75;
  static const double wNome = 220;
  static const double wDias = 210;
  static const double hHeader = 34;
  static const double hLinha = 48;

  static const Color corBorda = Colors.black;
  static const Color corAzul = Color(0xFF1A365D);
  static const Color corCinza = Color(0xFFE0E0E0);

  @override
  void initState() {
    super.initState();
    nomeControllers = List.generate(totalLinhas, (_) => List.generate(totalGrupos, (_) => TextEditingController()));
    pgPego = List.generate(totalLinhas, (_) => List.filled(totalGrupos, false));
    diasMarcados = List.generate(totalLinhas, (_) => List.generate(totalGrupos, (_) => [false, false, false]));
  }

  @override
  void dispose() {
    for (var linha in nomeControllers) { for (var c in linha) { c.dispose(); } }
    super.dispose();
  }

  String _numeroDaCelula(int linha, int grupo) {
    final index = grupo * totalLinhas + linha;
    if (index >= totalNumeros) return '';
    return (index + 1).toString().padLeft(2, '0');
  }

  Widget _container({required double width, required double height, Color cor = Colors.white, required Widget child}) {
    return Container(width: width, height: height, decoration: BoxDecoration(color: cor, border: const Border(right: BorderSide(color: corBorda, width: 1), bottom: BorderSide(color: corBorda, width: 1))), child: Center(child: child));
  }

  Widget _cabecalho(String texto, double width) {
    return _container(width: width, height: hHeader, cor: corAzul, child: Text(texto, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)));
  }

  Widget _celulaNumero(int linha, int grupo) {
    return _container(width: wN, height: hLinha, cor: corCinza, child: Text(_numeroDaCelula(linha, grupo), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: corAzul)));
  }

  Widget _celulaPG(int linha, int grupo) {
    final pego = pgPego[linha][grupo];
    final editavel = AuthManager.podeEditarTudo;
    return Container(
      width: wPG, height: hLinha,
      decoration: const BoxDecoration(color: Colors.white, border: Border(right: BorderSide(color: corBorda, width: 1), bottom: BorderSide(color: corBorda, width: 1))),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: pego ? Colors.green[400] : corCinza,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: corAzul, width: 2),
            boxShadow: relevoPequeno,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: editavel ? () { setState(() => pgPego[linha][grupo] = !pgPego[linha][grupo]); SalvamentoManager.marcarAlteracao(); } : null,
              child: Center(child: Padding(padding: const EdgeInsets.all(2), child: Text(pego ? 'OK' : 'PG', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: pego ? Colors.white : corAzul)))),
            ),
          ),
        ),
      ),
    );
  }

  Widget _celulaNome(int linha, int grupo) {
    return Container(
      width: wNome, height: hLinha,
      decoration: const BoxDecoration(color: Colors.white, border: Border(right: BorderSide(color: corBorda, width: 1), bottom: BorderSide(color: corBorda, width: 1))),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: campoEditavel(
        controller: nomeControllers[linha][grupo],
        textAlign: TextAlign.left,
        fontSize: 14,
        hintText: 'Nome...',
        hintStyle: const TextStyle(fontSize: 12, color: Colors.black38, fontWeight: FontWeight.normal),
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        onChanged: () => SalvamentoManager.marcarAlteracao(),
      ),
    );
  }

  Widget _celulaDias(int linha, int grupo) {
    final marcados = diasMarcados[linha][grupo];
    final editavel = AuthManager.podeEditarTudo;
    const nomes = ['SEX', 'SÁB', 'DOM'];
    return Container(
      width: wDias, height: hLinha,
      decoration: const BoxDecoration(color: Colors.white, border: Border(right: BorderSide(color: corBorda, width: 1), bottom: BorderSide(color: corBorda, width: 1))),
      padding: const EdgeInsets.all(3),
      child: Row(
        children: List.generate(3, (i) {
          final ativo = marcados[i];
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              decoration: BoxDecoration(color: ativo ? corAzul : corCinza, borderRadius: BorderRadius.circular(5), border: Border.all(color: corAzul, width: 2), boxShadow: relevoPequeno),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: editavel ? () { setState(() => diasMarcados[linha][grupo][i] = !diasMarcados[linha][grupo][i]); SalvamentoManager.marcarAlteracao(); } : null,
                  child: Center(child: Text(nomes[i], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: ativo ? Colors.white : corAzul))),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _grupoCabecalho() => Row(children: [_cabecalho('N*', wN), _cabecalho('PG', wPG), _cabecalho('NOME', wNome), _cabecalho('DIAS', wDias)]);
  Widget _grupoLinha(int linha, int grupo) => Row(children: [_celulaNumero(linha, grupo), _celulaPG(linha, grupo), _celulaNome(linha, grupo), _celulaDias(linha, grupo)]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EVENTOS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.2)),
        backgroundColor: corAzul,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [buildBotaoSalvar(context)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBannerPermissao(),
            const Center(child: Text('REGISTRO DE EVENTOS', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: corAzul))),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: corBorda, width: 2), color: Colors.white),
                child: Column(
                  children: [
                    Row(children: List.generate(totalGrupos, (_) => _grupoCabecalho())),
                    ...List.generate(totalLinhas, (linha) => Row(children: List.generate(totalGrupos, (grupo) => _grupoLinha(linha, grupo)))),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text('💡 PG = marcar quando o irmão pegar a passagem. DIAS = marcar em quais dias o irmão vai participar.', style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic, color: Colors.black87)),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TELA S.13 (com botão de imprimir real)
// ==========================================
class S13Screen extends StatefulWidget {
  const S13Screen({super.key});
  @override
  State<S13Screen> createState() => _S13ScreenState();
}

class _S13ScreenState extends State<S13Screen> {
  late List<List<TextEditingController>> controllers;
  late TextEditingController _anoServicoController;

  static const double wTerr = 55;
  static const double wUltima = 115;
  static const double wData = 130;
  static const double wBloco = wData * 2;
  static const double hCabecalhoLinha = 36;
  static const double hNome = 42;
  static const double hData = 42;
  static const Color corBorda = Colors.black;

  @override
  void initState() {
    super.initState();
    RegistroS13.inicializar();
    controllers = List.generate(20, (_) => List.generate(13, (_) => TextEditingController()));
    _anoServicoController = TextEditingController(text: RegistroS13.anoServico);
    for (int i = 1; i <= 20; i++) {
      final blocos = RegistroS13.registros[i] ?? [];
      for (int b = 0; b < blocos.length && b < 4; b++) {
        controllers[i - 1][1 + b].text = blocos[b].nomeIrmao;
        controllers[i - 1][5 + b].text = blocos[b].dataDesignacao;
        controllers[i - 1][9 + b].text = blocos[b].dataConclusao;
      }
    }
  }

  @override
  void dispose() {
    for (var row in controllers) { for (var c in row) { c.dispose(); } }
    _anoServicoController.dispose();
    super.dispose();
  }

  void _salvarCamposS13() {
    if (!AuthManager.podeEditarTudo) return;
    for (int i = 0; i < 20; i++) {
      final id = i + 1;
      for (int b = 0; b < 4; b++) {
        RegistroS13.atualizarBloco(id, b, nome: controllers[i][1 + b].text, dataDesignacao: controllers[i][5 + b].text, dataConclusao: controllers[i][9 + b].text);
      }
    }
    RegistroS13.anoServico = _anoServicoController.text;
  }

  Widget _containerBorda({required double width, required double height, Color cor = Colors.white, required Widget child}) {
    return Container(width: width, height: height, decoration: BoxDecoration(color: cor, border: const Border(right: BorderSide(color: corBorda, width: 1), bottom: BorderSide(color: corBorda, width: 1))), child: child);
  }

  Widget _celulaCabecalhoTexto({required double width, required double height, required String texto, Color cor = Colors.white, double fontSize = 11}) {
    return _containerBorda(width: width, height: height, cor: cor, child: Center(child: Padding(padding: const EdgeInsets.all(2), child: Text(texto, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize)))));
  }

  Widget _celulaComCampo({required double width, required double height, required TextEditingController ctrl, double fontSize = 11}) {
    return _containerBorda(width: width, height: height, child: Center(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 2), child: campoEditavel(controller: ctrl, fontSize: fontSize, contentPadding: const EdgeInsets.symmetric(vertical: 6), onChanged: () => SalvamentoManager.marcarAlteracao()))));
  }

  Widget _celulaNumero(String numero) {
    return _containerBorda(width: wTerr, height: hNome + hData, child: Center(child: Text(numero, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))));
  }

  Widget _cabecalhoBloco() {
    return Column(children: [
      _celulaCabecalhoTexto(width: wBloco, height: hCabecalhoLinha, texto: 'Designado para', cor: Colors.grey, fontSize: 11),
      Row(children: [
        _celulaCabecalhoTexto(width: wData, height: hCabecalhoLinha, texto: 'Data da designação', fontSize: 10),
        _celulaCabecalhoTexto(width: wData, height: hCabecalhoLinha, texto: 'Data da conclusão', fontSize: 10),
      ]),
    ]);
  }

  Widget _linhaBloco(int rowIndex, int blocoIndex) {
    return Column(children: [
      _celulaComCampo(width: wBloco, height: hNome, ctrl: controllers[rowIndex][1 + blocoIndex], fontSize: 13),
      Row(children: [
        _celulaComCampo(width: wData, height: hData, ctrl: controllers[rowIndex][5 + blocoIndex], fontSize: 11),
        _celulaComCampo(width: wData, height: hData, ctrl: controllers[rowIndex][9 + blocoIndex], fontSize: 11),
      ]),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S.13', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.2)),
        backgroundColor: const Color(0xFF1A365D),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.print, color: Colors.white, size: 26),
            tooltip: 'Imprimir / Salvar PDF',
            onPressed: () => imprimirS13(context),
          ),
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white, size: 26),
            tooltip: AuthManager.podeEditarTudo ? 'Salvar S.13' : 'Sem permissão',
            onPressed: AuthManager.podeEditarTudo ? () async { _salvarCamposS13(); await SalvamentoManager.salvarTudo(context); } : null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBannerPermissao(),
            const Center(child: Text('REGISTRO DE DESIGNAÇÃO DE TERRITÓRIO', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1A365D)), textAlign: TextAlign.center)),
            const SizedBox(height: 12),
            Row(children: [
              const Text('Ano de Serviço: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFF1A365D), width: 2)),
                child: campoEditavel(controller: _anoServicoController, fontSize: 15, contentPadding: const EdgeInsets.symmetric(vertical: 6), hintText: 'Ex: 2026', hintStyle: const TextStyle(fontSize: 14, color: Colors.black38, fontWeight: FontWeight.normal), onChanged: () => SalvamentoManager.marcarAlteracao()),
              )),
            ]),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: corBorda, width: 2), color: Colors.white),
                child: Column(
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      _celulaCabecalhoTexto(width: wTerr, height: hCabecalhoLinha * 2, texto: 'Terr.\nn.º'),
                      _celulaCabecalhoTexto(width: wUltima, height: hCabecalhoLinha * 2, texto: 'Última data\nconcluída*'),
                      _cabecalhoBloco(), _cabecalhoBloco(), _cabecalhoBloco(), _cabecalhoBloco(),
                    ]),
                    ...List.generate(20, (rowIndex) => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      _celulaNumero((rowIndex + 1).toString().padLeft(2, '0')),
                      _celulaComCampo(width: wUltima, height: hNome + hData, ctrl: controllers[rowIndex][0]),
                      _linhaBloco(rowIndex, 0), _linhaBloco(rowIndex, 1), _linhaBloco(rowIndex, 2), _linhaBloco(rowIndex, 3),
                    ])),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text('*Ao iniciar uma nova folha, use esta coluna para registrar a data em que cada território foi concluído pela última vez.', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 4),
            const Text('S-13-T 01/22', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TELA DE DIRIGENTES
// ==========================================
class DirigentesScreen extends StatefulWidget {
  const DirigentesScreen({super.key});
  @override
  State<DirigentesScreen> createState() => _DirigentesScreenState();
}

class _DirigentesScreenState extends State<DirigentesScreen> {
  late List<TextEditingController> col1Controllers;
  late List<TextEditingController> col2Controllers;
  late List<TextEditingController> col3Controllers;

  @override
  void initState() {
    super.initState();
    col1Controllers = DadosCompartilhados.segundaSexta.map((n) => TextEditingController(text: n)).toList();
    col2Controllers = DadosCompartilhados.sabado.map((n) => TextEditingController(text: n)).toList();
    col3Controllers = DadosCompartilhados.domingo.map((n) => TextEditingController(text: n)).toList();
  }

  @override
  void dispose() {
    for (var c in col1Controllers) { c.dispose(); }
    for (var c in col2Controllers) { c.dispose(); }
    for (var c in col3Controllers) { c.dispose(); }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editavel = AuthManager.podeEditarTudo;
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIRIGENTE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.2)),
        backgroundColor: const Color(0xFF1A365D),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [buildBotaoSalvar(context)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBannerPermissao(),
            const Text('Rodízio de Dirigentes', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
            const SizedBox(height: 4),
            Text(
              editavel
                  ? '✅ Esta grade é editável por administradores.'
                  : '🔒 Apenas administradores (1 e 2) podem editar esta grade.',
              style: TextStyle(
                fontSize: 13,
                color: editavel ? Colors.green : Colors.red[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildGradeDirigentes(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeDirigentes() {
    final headers = ['SEGUNDA A SEXTA', 'SÁBADO', 'DOMINGO'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF1A365D), width: 4), borderRadius: BorderRadius.circular(8), boxShadow: altoRelevo),
        child: Table(
          border: TableBorder.all(color: Colors.black, width: 1.5),
          columnWidths: const {0: FixedColumnWidth(200), 1: FixedColumnWidth(170), 2: FixedColumnWidth(170)},
          children: [
            TableRow(decoration: const BoxDecoration(color: Color(0xFF1A365D)), children: headers.map((h) => Padding(padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6), child: Text(h, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)))).toList()),
            ...List.generate(20, (i) => TableRow(
              decoration: BoxDecoration(color: i % 2 == 0 ? Colors.grey[200] : Colors.grey[300]),
              children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0), child: campoEditavel(controller: col1Controllers[i], textAlign: TextAlign.left, fontSize: 16, contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4), onChanged: () { DadosCompartilhados.segundaSexta[i] = col1Controllers[i].text; SalvamentoManager.marcarAlteracao(); })),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0), child: campoEditavel(controller: col2Controllers[i], textAlign: TextAlign.left, fontSize: 16, contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4), onChanged: () { DadosCompartilhados.sabado[i] = col2Controllers[i].text; SalvamentoManager.marcarAlteracao(); })),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0), child: campoEditavel(controller: col3Controllers[i], textAlign: TextAlign.left, fontSize: 16, contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4), onChanged: () { DadosCompartilhados.domingo[i] = col3Controllers[i].text; SalvamentoManager.marcarAlteracao(); })),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TELA DE SERVIÇO DE CAMPO
// ==========================================
class ServicoCampoScreen extends StatefulWidget {
  const ServicoCampoScreen({super.key});
  @override
  State<ServicoCampoScreen> createState() => _ServicoCampoScreenState();
}

class _ServicoCampoScreenState extends State<ServicoCampoScreen> {
  late int anoAtual;
  late int mesAtual;
  late DateTime dataReferencia;
  List<TextEditingController> locaisController = [];
  List<TextEditingController> dirigentesController = [];
  List<String> dias = [];
  List<String> diasSemana = [];
  List<String> horarios = [];

  @override
  void initState() {
    super.initState();
    final hoje = DateTime.now();
    anoAtual = hoje.year; mesAtual = hoje.month;
    dataReferencia = DateTime(anoAtual, mesAtual, 1);
    _gerarDados();
  }

  @override
  void dispose() {
    for (var c in locaisController) { c.dispose(); }
    for (var c in dirigentesController) { c.dispose(); }
    super.dispose();
  }

  void _mudarMes(int delta) {
    setState(() {
      mesAtual += delta;
      if (mesAtual > 12) { mesAtual = 1; anoAtual++; }
      if (mesAtual < 1) { mesAtual = 12; anoAtual--; }
      dataReferencia = DateTime(anoAtual, mesAtual, 1);
      _limparDados();
      _gerarDados();
    });
  }

  void _limparDados() {
    for (var c in locaisController) { c.dispose(); }
    for (var c in dirigentesController) { c.dispose(); }
    locaisController.clear(); dirigentesController.clear();
    dias.clear(); diasSemana.clear(); horarios.clear();
  }

  String _designarDirigente(int diaSemanaNum, int contSeg, int contSab, int contDom, int contDomAlt) {
    if (diaSemanaNum >= 1 && diaSemanaNum <= 5) return DadosCompartilhados.segundaSexta[contSeg % DadosCompartilhados.segundaSexta.length];
    if (diaSemanaNum == 6) return DadosCompartilhados.sabado[contSab % DadosCompartilhados.sabado.length];
    return contDomAlt % 2 == 0 ? DadosCompartilhados.sabado[contSab % DadosCompartilhados.sabado.length] : DadosCompartilhados.domingo[contDom % DadosCompartilhados.domingo.length];
  }

  void _gerarDados() {
    final int ano = dataReferencia.year;
    final int mes = dataReferencia.month;
    final int ultimoDia = DateTime(ano, mes + 1, 0).day;
    final List<String> nomesDiasSemana = ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'];
    final DateTime limite = DateTime(2026, 12, 31);
    int contSeg = 0, contSab = 0, contDom = 0, contDomAlt = 0;

    for (int dia = 1; dia <= ultimoDia; dia++) {
      final DateTime data = DateTime(ano, mes, dia);
      final int diaSemanaNum = data.weekday;
      final String nomeDia = nomesDiasSemana[diaSemanaNum % 7];
      String horario = '08:30';
      if (data.isBefore(limite) || data.isAtSameMomentAs(limite)) { if (diaSemanaNum == DateTime.thursday) { horario = '17:30'; } } else { if (diaSemanaNum == DateTime.wednesday) { horario = '17:30'; } }
      final String dirigenteAuto = _designarDirigente(diaSemanaNum, contSeg, contSab, contDom, contDomAlt);
      if (diaSemanaNum >= 1 && diaSemanaNum <= 5) { contSeg++; } else if (diaSemanaNum == 6) { contSab++; } else { if (contDomAlt % 2 == 0) { contSab++; } else { contDom++; } contDomAlt++; }
      dias.add(dia.toString().padLeft(2, '0'));
      diasSemana.add(nomeDia);
      horarios.add(horario);
      locaisController.add(TextEditingController());
      dirigentesController.add(TextEditingController(text: dirigenteAuto));
    }
  }

  @override
  Widget build(BuildContext context) {
    const List<String> nomesMeses = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];
    final String nomeMes = nomesMeses[mesAtual - 1];
    return Scaffold(
      appBar: AppBar(
        title: const Text('SERVIÇO DE CAMPO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.2)),
        backgroundColor: const Color(0xFF1A365D),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [buildBotaoSalvar(context)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBannerPermissao(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF1A365D), width: 3), boxShadow: altoRelevo),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(onPressed: () => _mudarMes(-1), icon: const Icon(Icons.chevron_left, color: Color(0xFF1A365D), size: 32)),
                Column(children: [
                  Text('$nomeMes $anoAtual', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
                  const Text('Designação automática', style: TextStyle(fontSize: 11, color: Color(0xFF1A365D), fontWeight: FontWeight.w600)),
                ]),
                IconButton(onPressed: () => _mudarMes(1), icon: const Icon(Icons.chevron_right, color: Color(0xFF1A365D), size: 32)),
              ]),
            ),
            const SizedBox(height: 16),
            _buildGradeServico(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeServico() {
    final headers = ['MÊS', 'SEMANA', 'LOCAL', 'HORÁRIO', 'DIRIGENTE'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF1A365D), width: 4), borderRadius: BorderRadius.circular(8), boxShadow: altoRelevo),
        child: Table(
          border: TableBorder.all(color: Colors.black, width: 1.5),
          columnWidths: const {0: FixedColumnWidth(60), 1: FixedColumnWidth(100), 2: FixedColumnWidth(200), 3: FixedColumnWidth(90), 4: FixedColumnWidth(200)},
          children: [
            TableRow(decoration: const BoxDecoration(color: Color(0xFF1A365D)), children: headers.map((h) => Padding(padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4), child: Text(h, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)))).toList()),
            ...List.generate(dias.length, (i) => TableRow(
              decoration: BoxDecoration(color: i % 2 == 0 ? Colors.grey[200] : Colors.grey[300]),
              children: [
                Padding(padding: const EdgeInsets.all(8.0), child: Text(dias[i], textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1A365D)))),
                Padding(padding: const EdgeInsets.all(8.0), child: Text(diasSemana[i], textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, color: Color(0xFF1A365D), fontWeight: FontWeight.bold))),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0), child: campoEditavel(controller: locaisController[i], textAlign: TextAlign.left, fontSize: 16, contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4), hintText: 'Digite o local...', hintStyle: const TextStyle(fontSize: 14, color: Colors.black45), onChanged: () => SalvamentoManager.marcarAlteracao())),
                Container(padding: const EdgeInsets.all(8.0), color: horarios[i] == '17:30' ? Colors.orange[300] : null, child: Text(horarios[i], textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: horarios[i] == '17:30' ? Colors.deepOrange[900] : const Color(0xFF1A365D)))),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0), child: campoEditavel(controller: dirigentesController[i], textAlign: TextAlign.left, fontSize: 16, contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4), hintText: 'Digite o nome...', hintStyle: const TextStyle(fontSize: 14, color: Colors.black45), onChanged: () => SalvamentoManager.marcarAlteracao())),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TELA DE TERRITÓRIOS
// ==========================================
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
    RegistroS13.inicializar();
    for (int i = 1; i <= 14; i++) { territorios.add(Territorio(id: i, nome: 'Território $i')); }
  }

  void _adicionarTerritorio() {
    if (!AuthManager.podeEditarTudo) return;
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Novo Território', style: TextStyle(color: Color(0xFF1A365D), fontWeight: FontWeight.bold, fontSize: 20)),
        content: TextField(controller: controller, autofocus: true, style: const TextStyle(fontSize: 18, color: Color(0xFF1A365D)), decoration: InputDecoration(hintText: 'Digite o nome...', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300], side: const BorderSide(color: Color(0xFF1A365D), width: 4), foregroundColor: const Color(0xFF1A365D), elevation: 6),
            onPressed: () { setState(() { int novoId = territorios.length + 1; String nome = controller.text.trim().isEmpty ? 'Território $novoId' : controller.text.trim(); territorios.add(Territorio(id: novoId, nome: nome)); SalvamentoManager.marcarAlteracao(); }); Navigator.pop(context); },
            child: const Text('Adicionar', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _editarNomeTerritorio(int index) {
    if (!AuthManager.podeEditarTudo) return;
    final territorio = territorios[index];
    final TextEditingController controller = TextEditingController(text: territorio.nome);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Editar Território ${territorio.id}', style: const TextStyle(color: Color(0xFF1A365D), fontWeight: FontWeight.bold, fontSize: 20)),
        content: TextField(controller: controller, autofocus: true, style: const TextStyle(fontSize: 18, color: Color(0xFF1A365D)), decoration: InputDecoration(hintText: 'Digite o novo nome...', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300], side: const BorderSide(color: Color(0xFF1A365D), width: 4), foregroundColor: const Color(0xFF1A365D), elevation: 6),
            onPressed: () { setState(() { territorio.nome = controller.text.trim().isEmpty ? 'Sem nome' : controller.text.trim(); SalvamentoManager.marcarAlteracao(); }); Navigator.pop(context); },
            child: const Text('Salvar', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _alternarSelecao(int index) {
    if (!AuthManager.podeEditarTudo) return;
    setState(() { territorios[index].isSelecionado = !territorios[index].isSelecionado; SalvamentoManager.marcarAlteracao(); });
  }

  @override
  Widget build(BuildContext context) {
    final editavel = AuthManager.podeEditarTudo;
    return Scaffold(
      appBar: AppBar(
        title: const Text('TERRITÓRIOS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.2)),
        backgroundColor: const Color(0xFF1A365D),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [buildBotaoSalvar(context)],
      ),
      floatingActionButton: editavel ? Container(
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.4), offset: const Offset(4, 4), blurRadius: 5), BoxShadow(color: Colors.white.withValues(alpha: 0.9), offset: const Offset(-3, -3), blurRadius: 5)]),
        child: FloatingActionButton(
          onPressed: _adicionarTerritorio,
          backgroundColor: Colors.grey[300], elevation: 0,
          shape: const CircleBorder(side: BorderSide(color: Color(0xFF1A365D), width: 4)),
          child: const Icon(Icons.add, color: Color(0xFF1A365D), size: 36),
        ),
      ) : null,
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(16, 16, 16, 0), child: buildBannerPermissao()),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: territorios.length,
              itemBuilder: (context, index) {
                final territorio = territorios[index];
                final bool isSelecionado = territorio.isSelecionado;
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(12), border: Border.all(color: isSelecionado ? Colors.green : const Color(0xFF1A365D), width: 4), boxShadow: altoRelevo),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async { await Navigator.push(context, MaterialPageRoute(builder: (context) => TerritorioDetailScreen(territorio: territorio))); setState(() {}); },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Row(children: [
                          CircleAvatar(radius: 22, backgroundColor: isSelecionado ? Colors.green : Colors.white, child: Text('${territorio.id}', style: TextStyle(color: isSelecionado ? Colors.white : const Color(0xFF1A365D), fontWeight: FontWeight.bold, fontSize: 18))),
                          const SizedBox(width: 16),
                          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(territorio.nome, style: const TextStyle(color: Color(0xFF1A365D), fontWeight: FontWeight.bold, fontSize: 20), maxLines: 1, overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 4),
                            Text(isSelecionado ? 'Território em uso' : 'Disponível', style: TextStyle(color: isSelecionado ? Colors.green[800] : const Color(0xFF1A365D), fontSize: 15, fontWeight: FontWeight.bold)),
                          ])),
                          IconButton(icon: Icon(Icons.edit_outlined, size: 28, color: editavel ? const Color(0xFF1A365D) : Colors.grey), onPressed: editavel ? () => _editarNomeTerritorio(index) : null),
                          Checkbox(value: isSelecionado, activeColor: Colors.green, checkColor: Colors.white, side: const BorderSide(color: Color(0xFF1A365D), width: 3), onChanged: editavel ? (bool? value) => _alternarSelecao(index) : null),
                        ]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TELA DE DETALHES DO TERRITÓRIO
// ==========================================
class TerritorioDetailScreen extends StatefulWidget {
  final Territorio territorio;
  const TerritorioDetailScreen({super.key, required this.territorio});

  @override
  State<TerritorioDetailScreen> createState() => _TerritorioDetailScreenState();
}

class _TerritorioDetailScreenState extends State<TerritorioDetailScreen> {
  List<List<int>> quadrasState = List.generate(10, (_) => List.generate(14, (_) => 0));
  late List<List<TextEditingController>> dirigenteControllers;

  @override
  void initState() {
    super.initState();
    dirigenteControllers = List.generate(10, (_) => List.generate(8, (_) => TextEditingController()));
    final blocos = RegistroS13.registros[widget.territorio.id] ?? [];
    for (int i = 0; i < blocos.length && i < 4; i++) {
      dirigenteControllers[i][0].text = blocos[i].nomeIrmao;
      dirigenteControllers[i][6].text = blocos[i].dataDesignacao;
      dirigenteControllers[i][7].text = blocos[i].dataConclusao;
    }
  }

  @override
  void dispose() {
    for (var row in dirigenteControllers) { for (var c in row) { c.dispose(); } }
    super.dispose();
  }

  void _selecionarImagem() {
    if (!AuthManager.podeEditarTudo) return;
    setState(() { widget.territorio.imagemUrl = 'https://picsum.photos/seed/${widget.territorio.id}/600/400'; });
    SalvamentoManager.marcarAlteracao();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Foto do mapa adicionada!')));
  }

  void _sincronizarLinha(int rowIndex) {
    if (rowIndex >= 4) return;
    RegistroS13.atualizarBloco(widget.territorio.id, rowIndex, nome: dirigenteControllers[rowIndex][0].text, dataDesignacao: dirigenteControllers[rowIndex][6].text, dataConclusao: dirigenteControllers[rowIndex][7].text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.territorio.nome.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
        backgroundColor: const Color(0xFF1A365D),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [buildBotaoSalvar(context)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBannerPermissao(),
            const Text('Mapa do Território', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _selecionarImagem,
              child: Container(
                width: double.infinity, height: 220,
                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF1A365D), width: 4), boxShadow: altoRelevo, image: widget.territorio.imagemUrl != null ? DecorationImage(image: NetworkImage(widget.territorio.imagemUrl!), fit: BoxFit.cover) : null),
                child: widget.territorio.imagemUrl == null ? const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.add_photo_alternate_outlined, size: 60, color: Color(0xFF1A365D)), SizedBox(height: 12), Text('Clique para adicionar a foto do mapa', style: TextStyle(color: Color(0xFF1A365D), fontSize: 18, fontWeight: FontWeight.bold))]) : null,
              ),
            ),
            const SizedBox(height: 24),
            const Text('DIRIGENTE', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
            const SizedBox(height: 4),
            const Text('✅ Esta grade é editável por todos. As 4 primeiras linhas são enviadas ao S.13', style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: Colors.green)),
            const SizedBox(height: 8),
            _buildGradeDirigente(),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('QUADRAS TRABALHADAS', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
                Text('✅ Editável por todos', style: TextStyle(fontSize: 12, color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            _buildGradeQuadras(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeDirigente() {
    final headers = ['DIRIGENTE', 'PUBLI', 'DATA', 'DIRIGENTE', 'PUBLI', 'DATA', 'DATA INICIAL', 'DATA FINAL'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF1A365D), width: 4), borderRadius: BorderRadius.circular(8), boxShadow: altoRelevo),
        child: Table(
          border: TableBorder.all(color: Colors.black, width: 1.5),
          defaultColumnWidth: const FixedColumnWidth(120),
          children: [
            TableRow(decoration: const BoxDecoration(color: Color(0xFF1A365D)), children: headers.map((h) => Padding(padding: const EdgeInsets.all(12.0), child: Text(h, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)))).toList()),
            ...List.generate(10, (rowIndex) => TableRow(
              decoration: BoxDecoration(color: rowIndex % 2 == 0 ? Colors.grey[200] : Colors.grey[300]),
              children: List.generate(8, (colIndex) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: campoEditavel(
                  controller: dirigenteControllers[rowIndex][colIndex],
                  fontSize: 14,
                  contentPadding: const EdgeInsets.all(12),
                  editavelOverride: true,
                  onChanged: () => _sincronizarLinha(rowIndex),
                ),
              )),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeQuadras() {
    final headers = List.generate(14, (index) => (index + 1).toString().padLeft(2, '0'));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF1A365D), width: 4), borderRadius: BorderRadius.circular(8), boxShadow: altoRelevo),
        child: Table(
          border: TableBorder.all(color: Colors.black, width: 1.5),
          defaultColumnWidth: const FixedColumnWidth(60),
          children: [
            TableRow(decoration: const BoxDecoration(color: Color(0xFF1A365D)), children: headers.map((h) => Padding(padding: const EdgeInsets.all(12.0), child: Text(h, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)))).toList()),
            ...List.generate(10, (rowIndex) => TableRow(
              decoration: BoxDecoration(color: rowIndex % 2 == 0 ? Colors.grey[200] : Colors.grey[300]),
              children: List.generate(14, (colIndex) {
                int state = quadrasState[rowIndex][colIndex];
                Color cellColor = Colors.transparent;
                if (state == 1) cellColor = Colors.yellow[700]!;
                if (state == 2) cellColor = Colors.green[700]!;
                return GestureDetector(
                  onTap: () { setState(() { quadrasState[rowIndex][colIndex] = (state + 1) % 3; SalvamentoManager.marcarAlteracao(); }); },
                  child: Container(height: 55, color: cellColor, child: state == 2 ? const Icon(Icons.check, size: 28, color: Colors.white) : null),
                );
              }),
            )),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// CALENDÁRIO
// ==========================================
class CalendarStrip extends StatefulWidget {
  const CalendarStrip({super.key});
  @override
  State<CalendarStrip> createState() => _CalendarStripState();
}

class _CalendarStripState extends State<CalendarStrip> {
  final ScrollController _scrollController = ScrollController();
  int _diaCentral = 1;
  late int _anoExibido;
  late int _mesExibido;

  static const double _cellWidth = 55.0;
  static const double _cellMarginH = 3.0;
  static const double _totalCellWidth = _cellWidth + (_cellMarginH * 2);
  static const double _alturaTotal = 175;
  static const double _alturaDia = 82;
  static const double _alturaMarcador = 140;
  static const double _margemVerticalDia = 10;

  @override
  void initState() {
    super.initState();
    final hoje = DateTime.now();
    _anoExibido = hoje.year; _mesExibido = hoje.month; _diaCentral = hoje.day;
    _scrollController.addListener(_atualizarDiaCentral);
    WidgetsBinding.instance.addPostFrameCallback((_) => _rolarParaHoje());
  }

  void _mudarMes(int delta) {
    setState(() {
      _mesExibido += delta;
      if (_mesExibido > 12) { _mesExibido = 1; _anoExibido++; }
      if (_mesExibido < 1) { _mesExibido = 12; _anoExibido--; }
      final hoje = DateTime.now();
      _diaCentral = (_mesExibido == hoje.month && _anoExibido == hoje.year) ? hoje.day : 1;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _rolarParaHoje());
  }

  void _rolarParaHoje() {
    if (!_scrollController.hasClients) return;
    final offset = (_diaCentral - 1) * _totalCellWidth;
    _scrollController.jumpTo(offset.clamp(0.0, _scrollController.position.maxScrollExtent));
  }

  void _atualizarDiaCentral() {
    final offset = _scrollController.offset;
    final novoDia = (offset / _totalCellWidth).round() + 1;
    if (novoDia != _diaCentral && mounted) { setState(() => _diaCentral = novoDia); }
  }

  @override
  void dispose() { _scrollController.removeListener(_atualizarDiaCentral); _scrollController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final DateTime hoje = DateTime.now();
    final int ultimoDia = DateTime(_anoExibido, _mesExibido + 1, 0).day;
    const List<String> nomesMeses = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];
    const List<String> abreviacoesDias = ['DOM', 'SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SÁB'];
    final String nomeMes = nomesMeses[_mesExibido - 1];
    final String hojeFormatado = '${hoje.day.toString().padLeft(2, '0')}/${hoje.month.toString().padLeft(2, '0')}';
    final bool isMesAtual = _mesExibido == hoje.month && _anoExibido == hoje.year;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF1A365D), width: 4), boxShadow: altoRelevo),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(onPressed: () => _mudarMes(-1), icon: const Icon(Icons.chevron_left, color: Color(0xFF1A365D), size: 28), padding: EdgeInsets.zero, constraints: const BoxConstraints()),
              Expanded(child: Column(children: [
                Text('$nomeMes $_anoExibido', style: const TextStyle(color: Color(0xFF1A365D), fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: const Color(0xFF1A365D), borderRadius: BorderRadius.circular(8)), child: Text('Hoje: $hojeFormatado', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))),
              ])),
              IconButton(onPressed: () => _mudarMes(1), icon: const Icon(Icons.chevron_right, color: Color(0xFF1A365D), size: 28), padding: EdgeInsets.zero, constraints: const BoxConstraints()),
            ]),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: _alturaTotal,
            child: LayoutBuilder(builder: (context, constraints) {
              final horizontalPadding = (constraints.maxWidth - _totalCellWidth) / 2;
              final double topMarcador = (_alturaTotal - _alturaMarcador) / 2 + 3;
              return Stack(
                alignment: Alignment.center, clipBehavior: Clip.none,
                children: [
                  Positioned(top: topMarcador, child: IgnorePointer(child: Container(
                    width: _totalCellWidth + 12, height: _alturaMarcador,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.55), offset: const Offset(5, 5), blurRadius: 7), BoxShadow(color: Colors.white.withValues(alpha: 0.95), offset: const Offset(-4, -4), blurRadius: 7)]),
                  ))),
                  ListView.builder(
                    key: ValueKey('$_anoExibido-$_mesExibido'),
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    itemCount: ultimoDia,
                    itemBuilder: (context, index) {
                      final dia = index + 1;
                      final data = DateTime(_anoExibido, _mesExibido, dia);
                      final nomeDiaSemana = abreviacoesDias[data.weekday % 7];
                      final isHoje = isMesAtual && dia == hoje.day;
                      final isCentro = dia == _diaCentral;
                      return Center(
                        child: AnimatedScale(
                          scale: isCentro ? 1.1 : 1.0, duration: const Duration(milliseconds: 180), curve: Curves.easeOutBack,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            width: _cellWidth, height: _alturaDia,
                            margin: EdgeInsets.symmetric(horizontal: _cellMarginH, vertical: _margemVerticalDia),
                            decoration: BoxDecoration(color: isHoje ? const Color(0xFF1A365D) : Colors.grey[200], borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFF1A365D), width: isCentro ? 3 : 2)),
                            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Text(nomeDiaSemana, style: TextStyle(color: isHoje ? Colors.white70 : const Color(0xFF1A365D), fontSize: 10, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 2),
                              Text(dia.toString().padLeft(2, '0'), style: TextStyle(color: isHoje ? Colors.white : const Color(0xFF1A365D), fontSize: 20, fontWeight: FontWeight.bold)),
                            ]),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(top: topMarcador, child: IgnorePointer(child: Container(
                    width: _totalCellWidth + 12, height: _alturaMarcador,
                    decoration: BoxDecoration(color: Colors.transparent, border: Border.all(color: Colors.deepOrange, width: 5), borderRadius: BorderRadius.circular(18)),
                  ))),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TELA PLACEHOLDER
// ==========================================
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)), backgroundColor: const Color(0xFF1A365D), iconTheme: const IconThemeData(color: Colors.white), centerTitle: true),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.construction, size: 100, color: Color(0xFF1A365D)),
        const SizedBox(height: 16),
        Text('Tela de $title', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1A365D))),
      ])),
    );
  }
}
