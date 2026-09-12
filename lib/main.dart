import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: TerritorioApp()));
}

// ═══════════════════════════════════════════════════════════
// STRINGS
// ═══════════════════════════════════════════════════════════

abstract final class AppStrings {
  static const String appName = 'Território de Congregação';
  static const String abaTerritorios = 'Territórios';
  static const String abaServicoCampo = 'Serviço de Campo';
  static const String abaEventos = 'Eventos';
  static const String abaDirigente = 'Dirigente';
  static const String abaS13 = 'S-13';
  static const String abaAdmin = 'Admin';
  static const String territoriosTitulo = 'Territórios';
  static const String renomearTitulo = 'Renomear território';
  static const String renomearLabel = 'Nome do território';
  static const String fotoMapaTitulo = 'Foto do mapa';
  static const String fotoMapaLabel = 'URL da imagem do mapa';
  static const String fotoMapaDica = 'Cole o link de uma imagem';
  static const String semFotoMapa = 'Sem foto do mapa';
  static const String adicionarFoto = 'Adicionar foto';
  static const String trocarFoto = 'Trocar foto';
  static const String removerFoto = 'Remover';
  static const String cancelar = 'Cancelar';
  static const String salvar = 'Salvar';
  static const String gradesTitulo = 'Grades';
  static const String abaGradeDirigente = 'DIRIGENTE';
  static const String abaGradeQuadras = 'QUADRAS TRABALHADAS';
  static const String editarCelula = 'Editar célula';
  static const String toqueParaMarcar = 'Toque: 1× amarelo · 2× verde · 3× limpar';
  static const String toqueParaEditar = 'Toque numa célula para editar';
  static const String abrirGrades = 'Abrir grades';
  static const String servicoCampoTitulo = 'Serviço de Campo';
  static const String colunaMes = 'MÊS';
  static const String colunaSemana = 'SEMANA';
  static const String colunaLocal = 'LOCAL';
  static const String colunaHorario = 'HORÁRIO';
  static const String colunaDirigente = 'DIRIGENTE';
  static const String localLabel = 'Local';
  static const String horarioLabel = 'Horário';
  static const String dirigenteLabel = 'Dirigente';
  static const String dirigenteGradeTitulo = 'Dirigente';
  static const String editarDirigente = 'Editar dirigente';
  static const String redistribuirTooltip = 'Redistribuir dirigentes do mês';
  static const String restaurarSimulacao = 'Restaurar simulação';
  static const String dirigentesRedistribuidos = 'Dirigentes redistribuídos';
  static const String nomesRestaurados = 'Nomes simulados restaurados';
  static const String s13Titulo = 'REGISTRO DE DESIGNAÇÃO DE TERRITÓRIO';
  static const String s13Ano = 'Ano de Serviço:';
  static const String s13Terr = 'Terr.\nnº';
  static const String s13UltimaData = 'Última data\nconcluída*';
  static const String s13DesignadoPara = 'Designado para';
  static const String s13DataDesig = 'Data da\ndesignação';
  static const String s13DataConcl = 'Data da\nconclusão';
  static const String s13Rodape =
      '*Ao iniciar uma nova folha, use esta coluna para registrar a data em que cada território foi concluído pela última vez.';
  static const String s13Codigo = 'S-13-T  01/22';
  static const String s13AnoLabel = 'Ano';
  static const String eventosTitulo = 'Eventos';
  static const String eventoColN = 'Nº';
  static const String eventoColNome = 'NOME';
  static const String eventoColDias = 'DIAS';
  static const String eventoColPg = 'PG';
  static const String eventoInstrucao =
      'Toque no NOME para editar · Toque SEX/SÁB/DOM para marcar o dia · Toque PG para indicar pagamento';
  static const String adminTitulo = 'Administração';
  static const String adminCriarPrincipal = 'Criar Administrador Principal';
  static const String adminLogin = 'Entrar como Administrador';
  static const String adminPainel = 'Painel do Administrador';
  static const String adminNome = 'Nome';
  static const String adminPin = 'PIN (4 dígitos)';
  static const String adminCriar = 'Criar';
  static const String adminEntrar = 'Entrar';
  static const String adminSair = 'Sair';
  static const String adminAdd = 'Adicionar administrador';
  static const String adminLimite = 'Limite de 6 administradores auxiliares';
  static const String adminPrincipalLabel = 'Principal';
  static const String adminAuxiliarLabel = 'Auxiliar';
  static const String adminBemVindo = 'Bem-vindo(a)';
  static const String adminInstrucaoPrincipal =
      'Você é o Administrador Principal. Pode criar até 6 administradores auxiliares.';
  static const String adminInstrucaoAuxiliar =
      'Você é um Administrador Auxiliar. Somente o principal pode criar novos admins.';
  static const String adminCriarSucesso = 'Administrador criado com sucesso!';
  static const String adminPinInvalido = 'PIN inválido. Deve ter 4 dígitos.';
  static const String adminNomeVazio = 'Digite o nome.';
  static const String adminCredenciaisErradas = 'Nome ou PIN incorretos.';
  static const String adminRemover = 'Remover';
  static const String adminRemoverConfirm = 'Remover este administrador?';
  static const String somenteAdmin = 'Somente administradores podem editar aqui';
  static const String modoLeitura = 'Modo leitura — somente administradores editam';
  static const String publicadorPodeEditarGrades = 'Você pode editar as grades Dirigente e Quadras';
}

// ═══════════════════════════════════════════════════════════
// CORES
// ═══════════════════════════════════════════════════════════

abstract final class AppColors {
  static const Color azulMarinho = Color(0xFF1E3A5F);
  static const Color azulProfundo = Color(0xFF16293F);
  static const Color azulClaro = Color(0xFF2E5A87);
  static const Color creme = Color(0xFFFAF6EC);
  static const Color cremeCard = Color(0xFFF5EFE0);
  static const Color cremeEscuro = Color(0xFFE8DFC9);
  static const Color dourado = Color(0xFFC9A961);
  static const Color douradoClaro = Color(0xFFE0C48F);
  static const Color textoEscuro = Color(0xFF2C3E50);
  static const Color textoMedio = Color(0xFF5A6B7C);
  static const Color erro = Color(0xFFB3261E);
  static const Color verdeLivre = Color(0xFF2E7D32);
  static const Color verdeNumero = Color(0xFF2E7D32);
  static const Color azulDesignado = Color(0xFF1565C0);
  static const Color douradoConcluido = Color(0xFF8D6E1F);
  static const Color vermelhoAtrasado = Color(0xFFC62828);
  static const Color roxoDirigente = Color(0xFF6A4C93);
  static const Color amareloPendente = Color(0xFFF9A825);
  static const Color preto = Color(0xFF000000);
  static const Color cinzaS13 = Color(0xFFE0E0E0);
  static const Color eventoVerde = Color(0xFF2E7D32);
  static const Color eventoAmarelo = Color(0xFFF9A825);
  static const Color eventoRoxo = Color(0xFF6A4C93);
}

// ═══════════════════════════════════════════════════════════
// TEMA
// ═══════════════════════════════════════════════════════════

abstract final class AppTheme {
  static ThemeData get claro {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.azulMarinho,
      primary: AppColors.azulMarinho,
      secondary: AppColors.dourado,
      surface: AppColors.creme,
      error: AppColors.erro,
      brightness: Brightness.light,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.creme,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.azulMarinho,
        foregroundColor: AppColors.creme,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.creme,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// CONFIG
// ═══════════════════════════════════════════════════════════

abstract final class GradeConfig {
  static const int dirigenteLinhas = 11;
  static const int dirigenteColunas = 9;
  static const List<String> dirigenteCabecalhos = <String>[
    'DIRIGENTE', 'PUBLI', 'DATA', 'DIRIGENTE', 'PUBLI', 'DATA',
    'DATA INICIAL', 'DATA FINAL', 'OBS',
  ];
  static const int quadrasLinhas = 11;
  static const int quadrasColunas = 14;
  static List<String> get quadrasCabecalhos {
    return List<String>.generate(
      quadrasColunas,
      (int i) => (i + 1).toString().padLeft(2, '0'),
    );
  }
  static const int dirigentesGradeLinhas = 21;
  static const int dirigentesGradeColunas = 3;
  static const List<String> dirigentesGradeCabecalhos = <String>[
    'SEGUNDA A SEXTA', 'SÁBADO', 'DOMINGO',
  ];
  static const int s13Territorios = 14;
  static const int s13CelulasPorTerritorio = 2;
  static const int s13Grupos = 4;
  static const int eventoGrupos = 5;
  static const int eventoLinhas = 14;
  static const int maxAdminsAuxiliares = 6;
}

abstract final class EstadoQuadra {
  static const int vazio = 0;
  static const int amarelo = 1;
  static const int verde = 2;
  static int proximo(int atual) {
    return (atual + 1) % 3;
  }
  static Color cor(int estado) {
    if (estado == amarelo) return AppColors.amareloPendente;
    if (estado == verde) return AppColors.verdeLivre;
    return AppColors.cremeCard;
  }
  static IconData? icone(int estado) {
    if (estado == amarelo) return Icons.hourglass_top;
    if (estado == verde) return Icons.check;
    return null;
  }
}

// ═══════════════════════════════════════════════════════════
// MODELOS
// ═══════════════════════════════════════════════════════════

enum StatusTerritorio {
  livre('Livre', AppColors.verdeLivre),
  designado('Designado', AppColors.azulDesignado),
  concluido('Concluído', AppColors.douradoConcluido),
  atrasado('Atrasado', AppColors.vermelhoAtrasado);

  const StatusTerritorio(this.rotulo, this.cor);
  final String rotulo;
  final Color cor;
}

class Territorio {
  const Territorio({
    required this.numero,
    required this.nome,
    required this.status,
    this.designadoPara,
    this.ultimaVisita,
    this.fotoMapaUrl,
    this.dataInicial = '',
    this.dataFinal = '',
    this.gradeDirigente = const <List<String>>[],
    this.gradeQuadras = const <List<int>>[],
  });

  final int numero;
  final String nome;
  final StatusTerritorio status;
  final String? designadoPara;
  final DateTime? ultimaVisita;
  final String? fotoMapaUrl;
  final String dataInicial;
  final String dataFinal;
  final List<List<String>> gradeDirigente;
  final List<List<int>> gradeQuadras;

  bool get temFotoMapa {
    return fotoMapaUrl != null && fotoMapaUrl!.isNotEmpty;
  }

  Territorio copyWith({
    int? numero,
    String? nome,
    StatusTerritorio? status,
    String? designadoPara,
    bool limparDesignado = false,
    DateTime? ultimaVisita,
    String? fotoMapaUrl,
    bool limparFotoMapa = false,
    String? dataInicial,
    String? dataFinal,
    List<List<String>>? gradeDirigente,
    List<List<int>>? gradeQuadras,
  }) {
    return Territorio(
      numero: numero ?? this.numero,
      nome: nome ?? this.nome,
      status: status ?? this.status,
      designadoPara: limparDesignado ? null : (designadoPara ?? this.designadoPara),
      ultimaVisita: ultimaVisita ?? this.ultimaVisita,
      fotoMapaUrl: limparFotoMapa ? null : (fotoMapaUrl ?? this.fotoMapaUrl),
      dataInicial: dataInicial ?? this.dataInicial,
      dataFinal: dataFinal ?? this.dataFinal,
      gradeDirigente: gradeDirigente ?? this.gradeDirigente,
      gradeQuadras: gradeQuadras ?? this.gradeQuadras,
    );
  }
}

class LinhaServicoCampo {
  const LinhaServicoCampo({
    required this.dia,
    this.local = '',
    this.horario = '08:30',
    this.dirigente = '',
  });
  final int dia;
  final String local;
  final String horario;
  final String dirigente;

  LinhaServicoCampo copyWith({
    int? dia,
    String? local,
    String? horario,
    String? dirigente,
  }) {
    return LinhaServicoCampo(
      dia: dia ?? this.dia,
      local: local ?? this.local,
      horario: horario ?? this.horario,
      dirigente: dirigente ?? this.dirigente,
    );
  }
}

class DesignacaoS13 {
  const DesignacaoS13({
    this.nome = '',
    this.dataDesignacao = '',
    this.dataConclusao = '',
  });
  final String nome;
  final String dataDesignacao;
  final String dataConclusao;

  DesignacaoS13 copyWith({
    String? nome,
    String? dataDesignacao,
    String? dataConclusao,
  }) {
    return DesignacaoS13(
      nome: nome ?? this.nome,
      dataDesignacao: dataDesignacao ?? this.dataDesignacao,
      dataConclusao: dataConclusao ?? this.dataConclusao,
    );
  }
}

class BlocoTerritorioS13 {
  const BlocoTerritorioS13({
    required this.numero,
    this.dataConclusao = '',
    required this.grupos,
  });
  final String numero;
  final String dataConclusao;
  final List<List<DesignacaoS13>> grupos;

  BlocoTerritorioS13 copyWith({
    String? numero,
    String? dataConclusao,
    List<List<DesignacaoS13>>? grupos,
  }) {
    return BlocoTerritorioS13(
      numero: numero ?? this.numero,
      dataConclusao: dataConclusao ?? this.dataConclusao,
      grupos: grupos ?? this.grupos,
    );
  }
}

class RegistroS13 {
  const RegistroS13({this.anoServico = '', required this.territorios});
  final String anoServico;
  final List<BlocoTerritorioS13> territorios;

  RegistroS13 copyWith({String? anoServico, List<BlocoTerritorioS13>? territorios}) {
    return RegistroS13(
      anoServico: anoServico ?? this.anoServico,
      territorios: territorios ?? this.territorios,
    );
  }
}

class LinhaEvento {
  const LinhaEvento({
    this.nome = '',
    this.dias = const <bool>[false, false, false],
    this.pg = 0,
  });
  final String nome;
  final List<bool> dias;
  final int pg;

  LinhaEvento copyWith({String? nome, List<bool>? dias, int? pg}) {
    return LinhaEvento(
      nome: nome ?? this.nome,
      dias: dias ?? this.dias,
      pg: pg ?? this.pg,
    );
  }
}

class Administrador {
  const Administrador({
    required this.id,
    required this.nome,
    required this.pin,
    this.principal = false,
  });
  final String id;
  final String nome;
  final String pin;
  final bool principal;
}

// ═══════════════════════════════════════════════════════════
// HELPERS
// ═══════════════════════════════════════════════════════════

List<List<LinhaEvento>> novoEventoVazio() {
  return List<List<LinhaEvento>>.generate(
    GradeConfig.eventoGrupos,
    (_) => List<LinhaEvento>.generate(
      GradeConfig.eventoLinhas,
      (_) => const LinhaEvento(),
    ),
  );
}

List<List<String>> novaGradeDirigente() {
  return List<List<String>>.generate(
    GradeConfig.dirigenteLinhas,
    (_) => List<String>.filled(GradeConfig.dirigenteColunas, ''),
  );
}

List<List<int>> novaGradeQuadras() {
  return List<List<int>>.generate(
    GradeConfig.quadrasLinhas,
    (_) => List<int>.filled(GradeConfig.quadrasColunas, EstadoQuadra.vazio),
  );
}

List<BlocoTerritorioS13> novosBlocosS13() {
  return List<BlocoTerritorioS13>.generate(
    GradeConfig.s13Territorios,
    (int i) {
      return BlocoTerritorioS13(
        numero: '${i + 1}',
        grupos: List<List<DesignacaoS13>>.generate(
          GradeConfig.s13Grupos,
          (_) => List<DesignacaoS13>.generate(
            GradeConfig.s13CelulasPorTerritorio,
            (_) => const DesignacaoS13(),
          ),
        ),
      );
    },
  );
}

const List<String> nomesDiasSemana = <String>[
  'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo',
];

const List<String> nomesMeses = <String>[
  'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
  'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro',
];

String nomeDiaSemana(int weekday) {
  return nomesDiasSemana[weekday - 1];
}

String horarioPadrao(DateTime data) {
  final DateTime hoje = DateTime.now();
  final DateTime inicioProximoAno = DateTime(hoje.year + 1, 1, 1);
  if (data.isBefore(inicioProximoAno)) {
    if (data.weekday == DateTime.thursday) return '17:30';
  } else {
    if (data.weekday == DateTime.wednesday) return '17:30';
  }
  return '08:30';
}

String chaveMes(int ano, int mes) {
  return '$ano-${mes.toString().padLeft(2, '0')}';
}

List<String> nomesColunaDirigente(List<List<String>> dirigentes, int coluna) {
  final List<String> out = <String>[];
  for (final List<String> linha in dirigentes) {
    if (coluna < linha.length) {
      final String nome = linha[coluna].trim();
      if (nome.isNotEmpty) out.add(nome);
    }
  }
  return out;
}

List<LinhaServicoCampo> gerarMesPadrao(int ano, int mes, List<List<String>> dirigentes) {
  final int diasNoMes = DateTime(ano, mes + 1, 0).day;
  final List<String> nomesSeg = nomesColunaDirigente(dirigentes, 0);
  final List<String> nomesSab = nomesColunaDirigente(dirigentes, 1);
  final List<String> nomesDom = nomesColunaDirigente(dirigentes, 2);
  int idxSeg = 0;
  int idxSab = 0;
  int idxDom = 0;

  return List<LinhaServicoCampo>.generate(31, (int i) {
    final int dia = i + 1;
    if (dia > diasNoMes) {
      return LinhaServicoCampo(dia: dia, horario: '');
    }
    final DateTime data = DateTime(ano, mes, dia);
    final int weekday = data.weekday;
    String dirigente = '';
    if (weekday >= DateTime.monday && weekday <= DateTime.friday) {
      if (nomesSeg.isNotEmpty) {
        dirigente = nomesSeg[idxSeg % nomesSeg.length];
        idxSeg++;
      }
    } else if (weekday == DateTime.saturday) {
      if (nomesSab.isNotEmpty) {
        dirigente = nomesSab[idxSab % nomesSab.length];
        idxSab++;
      }
    } else if (weekday == DateTime.sunday) {
      if (nomesDom.isNotEmpty) {
        dirigente = nomesDom[idxDom % nomesDom.length];
        idxDom++;
      }
    }
    return LinhaServicoCampo(
      dia: dia,
      horario: horarioPadrao(data),
      dirigente: dirigente,
    );
  });
}

const List<String> nomesIrmaosSimulados = <String>[
  'Ir. João Silva', 'Ir. Carlos Oliveira', 'Ir. Pedro Santos',
  'Ir. Marcos Souza', 'Ir. Lucas Ferreira', 'Ir. Paulo Almeida',
  'Ir. André Costa', 'Ir. Rafael Pereira', 'Ir. Bruno Lima',
  'Ir. Felipe Rodrigues', 'Ir. Gustavo Martins', 'Ir. Tiago Barbosa',
  'Ir. Daniel Ribeiro', 'Ir. Marcelo Cardoso', 'Ir. Eduardo Nunes',
  'Ir. Vinícius Araújo', 'Ir. Rodrigo Teixeira', 'Ir. Fernando Correia',
  'Ir. Leandro Castro', 'Ir. Ricardo Gomes',
];

List<List<String>> novaGradeDirigentes() {
  const int totalLinhas = GradeConfig.dirigentesGradeLinhas - 1;
  return List<List<String>>.generate(totalLinhas, (int r) {
    return List<String>.generate(GradeConfig.dirigentesGradeColunas, (int c) {
      return nomesIrmaosSimulados[(r * 3 + c) % nomesIrmaosSimulados.length];
    });
  });
}

// ═══════════════════════════════════════════════════════════
// DADOS INICIAIS
// ═══════════════════════════════════════════════════════════

final List<Territorio> territoriosIniciais = <Territorio>[
  Territorio(numero: 1, nome: 'Centro', status: StatusTerritorio.livre,
    fotoMapaUrl: 'https://placehold.co/800x600/1E3A5F/C9A961?text=Mapa+1',
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 2, nome: 'Bairro Novo', status: StatusTerritorio.designado,
    designadoPara: 'João Silva',
    fotoMapaUrl: 'https://placehold.co/800x600/1565C0/FAF6EC?text=Mapa+2',
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 3, nome: 'Vila Esperança', status: StatusTerritorio.concluido,
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 4, nome: 'Jardim das Flores', status: StatusTerritorio.livre,
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 5, nome: 'São José', status: StatusTerritorio.designado,
    designadoPara: 'Maria Santos',
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 6, nome: 'Boa Vista', status: StatusTerritorio.atrasado,
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 7, nome: 'Parque Industrial', status: StatusTerritorio.livre,
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 8, nome: 'Santa Rita', status: StatusTerritorio.concluido,
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 9, nome: 'Alto da Serra', status: StatusTerritorio.livre,
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 10, nome: 'Vila Nova', status: StatusTerritorio.designado,
    designadoPara: 'Carlos Oliveira',
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 11, nome: 'Bela Vista', status: StatusTerritorio.livre,
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 12, nome: 'Morada do Sol', status: StatusTerritorio.atrasado,
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 13, nome: 'Recanto', status: StatusTerritorio.livre,
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
  Territorio(numero: 14, nome: 'Cidade Jardim', status: StatusTerritorio.concluido,
    gradeDirigente: novaGradeDirigente(), gradeQuadras: novaGradeQuadras()),
];

// ═══════════════════════════════════════════════════════════
// PROVIDERS
// ═══════════════════════════════════════════════════════════

class TerritoriosNotifier extends Notifier<List<Territorio>> {
  @override
  List<Territorio> build() {
    return List<Territorio>.of(territoriosIniciais);
  }

  void renomear(int numero, String novoNome) {
    state = <Territorio>[
      for (final Territorio t in state)
        if (t.numero == numero) t.copyWith(nome: novoNome) else t,
    ];
  }

  void atualizarDesignado(int numero, String nome) {
    state = <Territorio>[
      for (final Territorio t in state)
        if (t.numero == numero)
          nome.trim().isEmpty
              ? t.copyWith(limparDesignado: true)
              : t.copyWith(designadoPara: nome.trim())
        else
          t,
    ];
  }

  void atualizarFotoMapa(int numero, String? url) {
    state = <Territorio>[
      for (final Territorio t in state)
        if (t.numero == numero)
          t.copyWith(fotoMapaUrl: url, limparFotoMapa: url == null || url.isEmpty)
        else
          t,
    ];
  }

  void atualizarCelulaDirigente(int num, int linha, int coluna, String valor) {
    state = <Territorio>[
      for (final Territorio t in state)
        if (t.numero == num)
          t.copyWith(
            gradeDirigente: <List<String>>[
              for (int r = 0; r < t.gradeDirigente.length; r++)
                if (r == linha)
                  <String>[
                    for (int c = 0; c < t.gradeDirigente[r].length; c++)
                      if (c == coluna) valor else t.gradeDirigente[r][c],
                  ]
                else
                  t.gradeDirigente[r],
            ],
          )
        else
          t,
    ];
  }

  void ciclarCelulaQuadra(int num, int linha, int coluna) {
    state = <Territorio>[
      for (final Territorio t in state)
        if (t.numero == num)
          t.copyWith(
            gradeQuadras: <List<int>>[
              for (int r = 0; r < t.gradeQuadras.length; r++)
                if (r == linha)
                  <int>[
                    for (int c = 0; c < t.gradeQuadras[r].length; c++)
                      if (c == coluna)
                        EstadoQuadra.proximo(t.gradeQuadras[r][c])
                      else
                        t.gradeQuadras[r][c],
                  ]
                else
                  t.gradeQuadras[r],
            ],
          )
        else
          t,
    ];
  }

  void iniciarTerritorio(int numero, String data, String dirigente) {
    state = <Territorio>[
      for (final Territorio t in state)
        if (t.numero == numero)
          t.copyWith(
            dataInicial: data,
            designadoPara: dirigente,
            status: StatusTerritorio.designado,
          )
        else
          t,
    ];
    ref.read(s13Provider.notifier).registrarInicio(numero, dirigente, data);
  }

  void concluirTerritorio(int numero, String data) {
    state = <Territorio>[
      for (final Territorio t in state)
        if (t.numero == numero)
          t.copyWith(dataFinal: data, status: StatusTerritorio.concluido)
        else
          t,
    ];
    ref.read(s13Provider.notifier).registrarConclusao(numero, data);
  }
}

final territoriosProvider = NotifierProvider<TerritoriosNotifier, List<Territorio>>(
  TerritoriosNotifier.new,
);

final territorioPorNumeroProvider = Provider.family<Territorio?, int>((ref, numero) {
  final List<Territorio> lista = ref.watch(territoriosProvider);
  for (final Territorio t in lista) {
    if (t.numero == numero) return t;
  }
  return null;
});

class DirigentesNotifier extends Notifier<List<List<String>>> {
  @override
  List<List<String>> build() {
    return novaGradeDirigentes();
  }

  void atualizar(int linha, int coluna, String valor) {
    state = <List<String>>[
      for (int r = 0; r < state.length; r++)
        if (r == linha)
          <String>[
            for (int c = 0; c < state[r].length; c++)
              if (c == coluna) valor else state[r][c],
          ]
        else
          state[r],
    ];
  }

  void restaurarSimulacao() {
    state = novaGradeDirigentes();
  }
}

final dirigentesProvider = NotifierProvider<DirigentesNotifier, List<List<String>>>(
  DirigentesNotifier.new,
);

class EventosNotifier extends Notifier<List<List<LinhaEvento>>> {
  @override
  List<List<LinhaEvento>> build() {
    return novoEventoVazio();
  }

  void atualizarNome(int grupo, int linha, String nome) {
    state = <List<LinhaEvento>>[
      for (int g = 0; g < state.length; g++)
        if (g == grupo)
          <LinhaEvento>[
            for (int l = 0; l < state[g].length; l++)
              if (l == linha) state[g][l].copyWith(nome: nome) else state[g][l],
          ]
        else
          state[g],
    ];
  }

  void toggleDia(int grupo, int linha, int diaIdx) {
    state = <List<LinhaEvento>>[
      for (int g = 0; g < state.length; g++)
        if (g == grupo)
          <LinhaEvento>[
            for (int l = 0; l < state[g].length; l++)
              if (l == linha)
                state[g][l].copyWith(
                  dias: <bool>[
                    for (int d = 0; d < 3; d++)
                      if (d == diaIdx) !state[g][l].dias[d] else state[g][l].dias[d],
                  ],
                )
              else
                state[g][l],
          ]
        else
          state[g],
    ];
  }

  void ciclarPg(int grupo, int linha) {
    state = <List<LinhaEvento>>[
      for (int g = 0; g < state.length; g++)
        if (g == grupo)
          <LinhaEvento>[
            for (int l = 0; l < state[g].length; l++)
              if (l == linha)
                state[g][l].copyWith(pg: (state[g][l].pg + 1) % 3)
              else
                state[g][l],
          ]
        else
          state[g],
    ];
  }

  void limparTudo() {
    state = novoEventoVazio();
  }
}

final eventosProvider = NotifierProvider<EventosNotifier, List<List<LinhaEvento>>>(
  EventosNotifier.new,
);

class AdminsNotifier extends Notifier<List<Administrador>> {
  int _contador = 0;

  @override
  List<Administrador> build() {
    return <Administrador>[];
  }

  bool get temPrincipal {
    return state.any((Administrador a) => a.principal);
  }

  int get totalAuxiliares {
    return state.where((Administrador a) => !a.principal).length;
  }

  bool get podeCriarAuxiliar {
    return temPrincipal && totalAuxiliares < GradeConfig.maxAdminsAuxiliares;
  }

  void criarPrincipal(String nome, String pin) {
    if (temPrincipal) return;
    _contador++;
    state = <Administrador>[
      ...state,
      Administrador(id: 'a$_contador', nome: nome, pin: pin, principal: true),
    ];
  }

  void criarAuxiliar(String nome, String pin) {
    if (!podeCriarAuxiliar) return;
    _contador++;
    state = <Administrador>[
      ...state,
      Administrador(id: 'a$_contador', nome: nome, pin: pin),
    ];
  }

  void remover(String id) {
    state = <Administrador>[
      for (final Administrador a in state)
        if (a.id == id && !a.principal) a else a,
    ];
  }

  Administrador? autenticar(String nome, String pin) {
    for (final Administrador a in state) {
      if (a.nome.toLowerCase() == nome.toLowerCase().trim() && a.pin == pin) {
        return a;
      }
    }
    return null;
  }
}

final adminsProvider = NotifierProvider<AdminsNotifier, List<Administrador>>(
  AdminsNotifier.new,
);

class AdminLogadoNotifier extends Notifier<Administrador?> {
  @override
  Administrador? build() {
    return null;
  }

  void entrar(Administrador a) {
    state = a;
  }

  void sair() {
    state = null;
  }
}

final adminLogadoProvider = NotifierProvider<AdminLogadoNotifier, Administrador?>(
  AdminLogadoNotifier.new,
);

class S13Notifier extends Notifier<RegistroS13> {
  @override
  RegistroS13 build() {
    return RegistroS13(territorios: novosBlocosS13());
  }

  void atualizarAno(String ano) {
    state = state.copyWith(anoServico: ano);
  }

  void atualizarNumero(int index, String numero) {
    state = state.copyWith(
      territorios: <BlocoTerritorioS13>[
        for (int i = 0; i < state.territorios.length; i++)
          if (i == index)
            state.territorios[i].copyWith(numero: numero)
          else
            state.territorios[i],
      ],
    );
  }

  void atualizarDataConclusaoTerritorio(int index, String data) {
    state = state.copyWith(
      territorios: <BlocoTerritorioS13>[
        for (int i = 0; i < state.territorios.length; i++)
          if (i == index)
            state.territorios[i].copyWith(dataConclusao: data)
          else
            state.territorios[i],
      ],
    );
  }

  int _encontrarIndex(int numeroTerritorio) {
    int idx = state.territorios.indexWhere((b) => b.numero == '$numeroTerritorio');
    if (idx != -1) return idx;
    final int pos = numeroTerritorio - 1;
    if (pos >= 0 && pos < state.territorios.length) return pos;
    return -1;
  }

  void registrarInicio(int numeroTerritorio, String nome, String dataDesignacao) {
    final int idx = _encontrarIndex(numeroTerritorio);
    if (idx == -1) return;
    final BlocoTerritorioS13 bloco = state.territorios[idx];
    for (int g = 0; g < bloco.grupos.length; g++) {
      for (int c = 0; c < bloco.grupos[g].length; c++) {
        if (bloco.grupos[g][c].nome.isEmpty) {
          _atualizarCelula(idx, g, c, nome, dataDesignacao, null);
          return;
        }
      }
    }
  }

  void registrarConclusao(int numeroTerritorio, String dataConclusao) {
    final int idx = _encontrarIndex(numeroTerritorio);
    if (idx == -1) return;
    final BlocoTerritorioS13 bloco = state.territorios[idx];
    for (int g = bloco.grupos.length - 1; g >= 0; g--) {
      for (int c = bloco.grupos[g].length - 1; c >= 0; c--) {
        final DesignacaoS13 d = bloco.grupos[g][c];
        if (d.dataDesignacao.isNotEmpty && d.dataConclusao.isEmpty) {
          _atualizarCelula(idx, g, c, null, null, dataConclusao);
          return;
        }
      }
    }
  }

  void limparLinha(int numeroTerritorio) {
    final int idx = _encontrarIndex(numeroTerritorio);
    if (idx == -1) return;
    state = state.copyWith(
      territorios: <BlocoTerritorioS13>[
        for (int i = 0; i < state.territorios.length; i++)
          if (i == idx)
            state.territorios[i].copyWith(
              dataConclusao: '',
              grupos: List<List<DesignacaoS13>>.generate(
                GradeConfig.s13Grupos,
                (_) => List<DesignacaoS13>.generate(
                  GradeConfig.s13CelulasPorTerritorio,
                  (_) => const DesignacaoS13(),
                ),
              ),
            )
          else
            state.territorios[i],
      ],
    );
  }

  bool linhaCompleta(String numeroTerritorio) {
    int idx = state.territorios.indexWhere((b) => b.numero == numeroTerritorio);
    if (idx == -1) {
      final int n = int.tryParse(numeroTerritorio) ?? -1;
      if (n > 0 && n - 1 < state.territorios.length) idx = n - 1;
    }
    if (idx == -1) return false;
    for (final List<DesignacaoS13> grupo in state.territorios[idx].grupos) {
      for (final DesignacaoS13 d in grupo) {
        if (d.nome.isEmpty || d.dataDesignacao.isEmpty || d.dataConclusao.isEmpty) {
          return false;
        }
      }
    }
    return true;
  }

  void _atualizarCelula(
    int idxTerr,
    int idxGrupo,
    int idxCel,
    String? nome,
    String? dataDesignacao,
    String? dataConclusao,
  ) {
    state = state.copyWith(
      territorios: <BlocoTerritorioS13>[
        for (int i = 0; i < state.territorios.length; i++)
          if (i == idxTerr)
            state.territorios[i].copyWith(
              grupos: <List<DesignacaoS13>>[
                for (int g = 0; g < state.territorios[i].grupos.length; g++)
                  if (g == idxGrupo)
                    <DesignacaoS13>[
                      for (int c = 0; c < state.territorios[i].grupos[g].length; c++)
                        if (c == idxCel)
                          state.territorios[i].grupos[g][c].copyWith(
                            nome: nome,
                            dataDesignacao: dataDesignacao,
                            dataConclusao: dataConclusao,
                          )
                        else
                          state.territorios[i].grupos[g][c],
                    ]
                  else
                    state.territorios[i].grupos[g],
              ],
            )
          else
            state.territorios[i],
      ],
    );
  }

  void atualizarNome(int i, int g, int c, String v) {
    _atualizarCelula(i, g, c, v, null, null);
  }

  void atualizarDataDesignacao(int i, int g, int c, String v) {
    _atualizarCelula(i, g, c, null, v, null);
  }

  void atualizarDataConclusao(int i, int g, int c, String v) {
    _atualizarCelula(i, g, c, null, null, v);
  }

  void limparTudo() {
    state = RegistroS13(
      anoServico: state.anoServico,
      territorios: novosBlocosS13(),
    );
  }
}

final s13Provider = NotifierProvider<S13Notifier, RegistroS13>(S13Notifier.new);

class MesSelecionado {
  const MesSelecionado(this.ano, this.mes);
  final int ano;
  final int mes;

  MesSelecionado copyWith({int? ano, int? mes}) {
    return MesSelecionado(ano ?? this.ano, mes ?? this.mes);
  }
}

class MesSelecionadoNotifier extends Notifier<MesSelecionado> {
  @override
  MesSelecionado build() {
    final DateTime hoje = DateTime.now();
    return MesSelecionado(hoje.year, hoje.month);
  }

  void anterior() {
    int m = state.mes - 1;
    int a = state.ano;
    if (m < 1) {
      m = 12;
      a -= 1;
    }
    state = state.copyWith(ano: a, mes: m);
  }

  void proximo() {
    int m = state.mes + 1;
    int a = state.ano;
    if (m > 12) {
      m = 1;
      a += 1;
    }
    state = state.copyWith(ano: a, mes: m);
  }
}

final mesSelecionadoProvider = NotifierProvider<MesSelecionadoNotifier, MesSelecionado>(
  MesSelecionadoNotifier.new,
);

class ServicoCampoNotifier extends Notifier<Map<String, List<LinhaServicoCampo>>> {
  @override
  Map<String, List<LinhaServicoCampo>> build() {
    return <String, List<LinhaServicoCampo>>{};
  }

  void garantirMes(int ano, int mes) {
    final String chave = chaveMes(ano, mes);
    if (state.containsKey(chave)) return;
    final List<List<String>> dirigentes = ref.read(dirigentesProvider);
    state = <String, List<LinhaServicoCampo>>{
      ...state,
      chave: gerarMesPadrao(ano, mes, dirigentes),
    };
  }

  void redistribuirDirigentes(int ano, int mes) {
    final String chave = chaveMes(ano, mes);
    final List<List<String>> dirigentes = ref.read(dirigentesProvider);
    final List<LinhaServicoCampo> base = gerarMesPadrao(ano, mes, dirigentes);
    final List<LinhaServicoCampo> existentes = state[chave] ?? const <LinhaServicoCampo>[];
    final Map<int, LinhaServicoCampo> porDia = <int, LinhaServicoCampo>{
      for (final LinhaServicoCampo l in existentes) l.dia: l,
    };
    state = <String, List<LinhaServicoCampo>>{
      ...state,
      chave: <LinhaServicoCampo>[
        for (final LinhaServicoCampo l in base)
          if (porDia.containsKey(l.dia))
            l.copyWith(
              local: porDia[l.dia]!.local,
              horario: porDia[l.dia]!.horario.isEmpty ? l.horario : porDia[l.dia]!.horario,
            )
          else
            l,
      ],
    };
  }

  void atualizarLinha(int ano, int mes, int dia, LinhaServicoCampo nova) {
    final String chave = chaveMes(ano, mes);
    final List<LinhaServicoCampo>? linhas = state[chave];
    if (linhas == null) return;
    state = <String, List<LinhaServicoCampo>>{
      ...state,
      chave: <LinhaServicoCampo>[
        for (final LinhaServicoCampo l in linhas)
          if (l.dia == dia) nova else l,
      ],
    };
  }

  void restaurarHorarioPadrao(int ano, int mes) {
    final String chave = chaveMes(ano, mes);
    final List<List<String>> dirigentes = ref.read(dirigentesProvider);
    final List<LinhaServicoCampo> linhas = state[chave] ?? gerarMesPadrao(ano, mes, dirigentes);
    final int diasNoMes = DateTime(ano, mes + 1, 0).day;
    state = <String, List<LinhaServicoCampo>>{
      ...state,
      chave: <LinhaServicoCampo>[
        for (final LinhaServicoCampo l in linhas)
          if (l.dia <= diasNoMes)
            l.copyWith(horario: horarioPadrao(DateTime(ano, mes, l.dia)))
          else
            l,
      ],
    };
  }
}

final servicoCampoProvider =
    NotifierProvider<ServicoCampoNotifier, Map<String, List<LinhaServicoCampo>>>(
  ServicoCampoNotifier.new,
);

// ═══════════════════════════════════════════════════════════
// HELPER: PERMISSÃO
// ═══════════════════════════════════════════════════════════

bool ehAdmin(WidgetRef ref) {
  return ref.read(adminLogadoProvider) != null;
}

void avisarSomenteAdmin(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(AppStrings.somenteAdmin),
      duration: Duration(seconds: 2),
    ),
  );
}

void executarSeAdmin(BuildContext context, WidgetRef ref, VoidCallback acao) {
  if (!ehAdmin(ref)) {
    avisarSomenteAdmin(context);
    return;
  }
  acao();
}

// ═══════════════════════════════════════════════════════════
// DIALOG
// ═══════════════════════════════════════════════════════════

Future<String?> abrirDialogEditarTexto({
  required BuildContext context,
  required String titulo,
  required String valorInicial,
  String label = 'Valor',
  TextInputType? teclado,
}) async {
  final TextEditingController controller = TextEditingController(text: valorInicial);
  return showDialog<String>(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        backgroundColor: AppColors.creme,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.dourado, width: 1.5),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            color: AppColors.textoEscuro,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: teclado,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.azulMarinho, width: 2),
            ),
          ),
          onSubmitted: (String v) => Navigator.of(ctx).pop(v),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text(
              AppStrings.cancelar,
              style: TextStyle(color: AppColors.textoMedio),
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.azulMarinho),
            onPressed: () => Navigator.of(ctx).pop(controller.text),
            child: const Text(AppStrings.salvar),
          ),
        ],
      );
    },
  );
}

Future<void> abrirDialogRenomear(
  BuildContext context,
  WidgetRef ref,
  Territorio territorio,
) async {
  final String? novoNome = await abrirDialogEditarTexto(
    context: context,
    titulo: '${AppStrings.renomearTitulo} ${territorio.numero}',
    valorInicial: territorio.nome,
    label: AppStrings.renomearLabel,
  );
  if (novoNome != null && novoNome.trim().isNotEmpty) {
    ref.read(territoriosProvider.notifier).renomear(territorio.numero, novoNome.trim());
  }
}

class _ResultadoFoto {
  const _ResultadoFoto(this.url, this.remover);
  final String? url;
  final bool remover;
}

Future<void> abrirDialogFotoMapa(
  BuildContext context,
  WidgetRef ref,
  Territorio territorio,
) async {
  final TextEditingController controller = TextEditingController(text: territorio.fotoMapaUrl ?? '');
  final _ResultadoFoto? resultado = await showDialog<_ResultadoFoto>(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        backgroundColor: AppColors.creme,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.dourado, width: 1.5),
        ),
        title: Text(
          '${AppStrings.fotoMapaTitulo} — Território ${territorio.numero}',
          style: const TextStyle(
            color: AppColors.textoEscuro,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller,
                autofocus: true,
                keyboardType: TextInputType.url,
                maxLines: 3,
                minLines: 1,
                decoration: const InputDecoration(
                  labelText: AppStrings.fotoMapaLabel,
                  hintText: 'https://...',
                  helperText: AppStrings.fotoMapaDica,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.azulMarinho, width: 2),
                  ),
                ),
                onSubmitted: (String v) => Navigator.of(ctx).pop(_ResultadoFoto(v, false)),
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: controller,
                builder: (_, TextEditingValue value, __) {
                  final String url = value.text.trim();
                  if (url.isEmpty) return const SizedBox.shrink();
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      url,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          height: 140,
                          alignment: Alignment.center,
                          color: AppColors.cremeCard,
                          child: const Text(
                            'Não foi possível carregar a imagem.',
                            style: TextStyle(color: AppColors.textoMedio, fontSize: 12),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        actions: [
          if (territorio.temFotoMapa)
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(const _ResultadoFoto(null, true)),
              child: const Text(
                AppStrings.removerFoto,
                style: TextStyle(color: AppColors.erro),
              ),
            ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text(
              AppStrings.cancelar,
              style: TextStyle(color: AppColors.textoMedio),
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.azulMarinho),
            onPressed: () => Navigator.of(ctx).pop(_ResultadoFoto(controller.text.trim(), false)),
            child: const Text(AppStrings.salvar),
          ),
        ],
      );
    },
  );

  if (resultado == null) return;

  if (resultado.remover) {
    ref.read(territoriosProvider.notifier).atualizarFotoMapa(territorio.numero, null);
  } else if (resultado.url != null && resultado.url!.isNotEmpty) {
    ref.read(territoriosProvider.notifier).atualizarFotoMapa(territorio.numero, resultado.url);
  }
}

Future<void> abrirDialogEditarCelula(
  BuildContext context,
  WidgetRef ref,
  Territorio territorio,
  int linha,
  int coluna,
) async {
  final String valorAtual = territorio.gradeDirigente[linha][coluna];
  final String? novoValor = await abrirDialogEditarTexto(
    context: context,
    titulo: '${AppStrings.editarCelula} — Linha ${linha + 1}',
    valorInicial: valorAtual,
    label: GradeConfig.dirigenteCabecalhos[coluna],
  );
  if (novoValor != null) {
    ref.read(territoriosProvider.notifier).atualizarCelulaDirigente(
      territorio.numero, linha, coluna, novoValor);
  }
}

Future<void> abrirDialogEditarServicoCampo(
  BuildContext context,
  WidgetRef ref,
  int ano,
  int mes,
  LinhaServicoCampo linha,
  String campo,
) async {
  final String valorAtual;
  final String label;
  if (campo == 'local') {
    valorAtual = linha.local;
    label = AppStrings.localLabel;
  } else if (campo == 'horario') {
    valorAtual = linha.horario;
    label = AppStrings.horarioLabel;
  } else if (campo == 'dirigente') {
    valorAtual = linha.dirigente;
    label = AppStrings.dirigenteLabel;
  } else {
    return;
  }
  final String? novo = await abrirDialogEditarTexto(
    context: context,
    titulo: '$label — Dia ${linha.dia}',
    valorInicial: valorAtual,
    label: label,
  );
  if (novo == null) return;
  LinhaServicoCampo atualizada = linha;
  if (campo == 'local') {
    atualizada = linha.copyWith(local: novo.trim());
  } else if (campo == 'horario') {
    atualizada = linha.copyWith(horario: novo.trim());
  } else if (campo == 'dirigente') {
    atualizada = linha.copyWith(dirigente: novo.trim());
  }
  ref.read(servicoCampoProvider.notifier).atualizarLinha(ano, mes, linha.dia, atualizada);
}

Future<void> abrirDialogEditarDirigente(
  BuildContext context,
  WidgetRef ref,
  int linha,
  int coluna,
) async {
  final List<List<String>> grade = ref.read(dirigentesProvider);
  final String valorAtual = grade[linha][coluna];
  final String? novoValor = await abrirDialogEditarTexto(
    context: context,
    titulo: '${AppStrings.editarDirigente} — Linha ${linha + 1}',
    valorInicial: valorAtual,
    label: GradeConfig.dirigentesGradeCabecalhos[coluna],
  );
  if (novoValor != null) {
    ref.read(dirigentesProvider.notifier).atualizar(linha, coluna, novoValor.trim());
  }
}
// ═══════════════════════════════════════════════════════════
// APP + HOME
// ═══════════════════════════════════════════════════════════

class TerritorioApp extends StatelessWidget {
  const TerritorioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.claro,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _abrir(BuildContext context, Widget tela) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => tela));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Administrador? logado = ref.watch(adminLogadoProvider);
    return Scaffold(
      backgroundColor: AppColors.azulMarinho,
      body: SafeArea(
        child: Column(
          children: [
            _Cabecalho(adminNome: logado?.nome),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.creme,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.95,
                    children: [
                      ModuloCard(
                        icone: Icons.map_outlined,
                        titulo: AppStrings.abaTerritorios,
                        onTap: () => _abrir(context, const TerritoriosScreen()),
                      ),
                      ModuloCard(
                        icone: Icons.menu_book_outlined,
                        titulo: AppStrings.abaServicoCampo,
                        onTap: () => _abrir(context, const ServicoCampoScreen()),
                      ),
                      ModuloCard(
                        icone: Icons.calendar_today_outlined,
                        titulo: AppStrings.abaEventos,
                        onTap: () => _abrir(context, const EventosScreen()),
                      ),
                      ModuloCard(
                        icone: Icons.groups_outlined,
                        titulo: AppStrings.abaDirigente,
                        onTap: () => _abrir(context, const DirigenteScreen()),
                      ),
                      ModuloCard(
                        icone: Icons.assignment_outlined,
                        titulo: AppStrings.abaS13,
                        onTap: () => _abrir(context, const S13Screen()),
                      ),
                      ModuloCard(
                        icone: Icons.settings_outlined,
                        titulo: AppStrings.abaAdmin,
                        onTap: () => _abrir(context, const AdminScreen()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Cabecalho extends StatelessWidget {
  const _Cabecalho({this.adminNome});
  final String? adminNome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 24),
            decoration: BoxDecoration(
              color: AppColors.azulProfundo,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.dourado, width: 1.5),
            ),
            child: const Text(
              AppStrings.appName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.douradoClaro,
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (adminNome != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.dourado,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.verified_user, size: 16, color: AppColors.azulProfundo),
                  const SizedBox(width: 6),
                  Text(
                    'Admin: $adminNome',
                    style: const TextStyle(
                      color: AppColors.azulProfundo,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.cremeCard,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.dourado.withValues(alpha: 0.5)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_outline, size: 16, color: AppColors.textoMedio),
                  SizedBox(width: 6),
                  Text(
                    'Publicador',
                    style: TextStyle(
                      color: AppColors.textoMedio,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class ModuloCard extends StatelessWidget {
  const ModuloCard({
    super.key,
    required this.icone,
    required this.titulo,
    required this.onTap,
  });
  final IconData icone;
  final String titulo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cremeCard,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.dourado, width: 1.5),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icone, size: 44, color: AppColors.azulMarinho),
              const SizedBox(height: 14),
              Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textoEscuro,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// TELA: TERRITÓRIOS
// ═══════════════════════════════════════════════════════════

class TerritoriosScreen extends ConsumerWidget {
  const TerritoriosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Territorio> territorios = ref.watch(territoriosProvider);
    return Scaffold(
      backgroundColor: AppColors.creme,
      appBar: AppBar(title: const Text(AppStrings.territoriosTitulo)),
      body: Column(
        children: [
          _ResumoTerritorios(territorios: territorios),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1.05,
              ),
              itemCount: territorios.length,
              itemBuilder: (BuildContext ctx, int index) {
                final Territorio t = territorios[index];
                return _TerritorioCard(
                  territorio: t,
                  onTap: () {
                    Navigator.of(ctx).push(
                      MaterialPageRoute<void>(
                        builder: (_) => TerritorioDetalheScreen(numero: t.numero),
                      ),
                    );
                  },
                  onEditar: () {
                    executarSeAdmin(ctx, ref, () {
                      abrirDialogRenomear(ctx, ref, t);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ResumoTerritorios extends StatelessWidget {
  const _ResumoTerritorios({required this.territorios});
  final List<Territorio> territorios;

  @override
  Widget build(BuildContext context) {
    final int total = territorios.length;
    final int livres = territorios.where((t) => t.status == StatusTerritorio.livre).length;
    final int designados = territorios.where((t) => t.status == StatusTerritorio.designado).length;
    return Container(
      width: double.infinity,
      color: AppColors.azulMarinho,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: [
          _ResumoItem(rotulo: 'Total', valor: '$total', cor: AppColors.creme),
          _ResumoItem(rotulo: 'Livres', valor: '$livres', cor: AppColors.verdeLivre),
          _ResumoItem(rotulo: 'Designados', valor: '$designados', cor: AppColors.azulDesignado),
        ],
      ),
    );
  }
}

class _ResumoItem extends StatelessWidget {
  const _ResumoItem({
    required this.rotulo,
    required this.valor,
    required this.cor,
  });
  final String rotulo;
  final String valor;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            valor,
            style: TextStyle(color: cor, fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 2),
          Text(
            rotulo,
            style: const TextStyle(
              color: AppColors.creme,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _TerritorioCard extends StatelessWidget {
  const _TerritorioCard({
    required this.territorio,
    required this.onTap,
    required this.onEditar,
  });
  final Territorio territorio;
  final VoidCallback onTap;
  final VoidCallback onEditar;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cremeCard,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        onLongPress: onEditar,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: territorio.status.cor.withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.verdeNumero,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${territorio.numero}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Spacer(),
                  _StatusBadge(status: territorio.status),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      territorio.nome,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textoEscuro,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: onEditar,
                    borderRadius: BorderRadius.circular(8),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.edit_outlined,
                        size: 18,
                        color: AppColors.azulMarinho,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  if (territorio.temFotoMapa) ...[
                    const Icon(Icons.image_outlined, size: 14, color: AppColors.verdeLivre),
                    const SizedBox(width: 4),
                  ],
                  if (territorio.designadoPara != null)
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Icons.person_outline, size: 14, color: AppColors.textoMedio),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              territorio.designadoPara!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.textoMedio,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});
  final StatusTerritorio status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.cor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: status.cor.withValues(alpha: 0.4)),
      ),
      child: Text(
        status.rotulo,
        style: TextStyle(color: status.cor, fontSize: 10, fontWeight: FontWeight.w700),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// TELA: DETALHE DO TERRITÓRIO
// ═══════════════════════════════════════════════════════════

class TerritorioDetalheScreen extends ConsumerWidget {
  const TerritorioDetalheScreen({super.key, required this.numero});
  final int numero;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Territorio? territorio = ref.watch(territorioPorNumeroProvider(numero));

    if (territorio == null) {
      return Scaffold(
        backgroundColor: AppColors.creme,
        appBar: AppBar(title: Text('Território $numero')),
        body: const Center(
          child: Text(
            'Território não encontrado.',
            style: TextStyle(color: AppColors.textoMedio),
          ),
        ),
      );
    }

    final bool admin = ref.watch(adminLogadoProvider) != null;

    return Scaffold(
      backgroundColor: AppColors.creme,
      appBar: AppBar(
        title: Text('Território ${territorio.numero}'),
        actions: [
          if (!admin)
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.lock_outline, color: AppColors.douradoClaro),
            ),
          IconButton(
            tooltip: AppStrings.renomearTitulo,
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              executarSeAdmin(context, ref, () {
                abrirDialogRenomear(context, ref, territorio);
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.verdeNumero,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${territorio.numero}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      territorio.nome,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.textoEscuro,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    tooltip: AppStrings.renomearTitulo,
                    icon: const Icon(Icons.edit_outlined, color: AppColors.azulMarinho),
                    onPressed: () {
                      executarSeAdmin(context, ref, () {
                        abrirDialogRenomear(context, ref, territorio);
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Center(child: _StatusBadge(status: territorio.status)),
            const SizedBox(height: 24),
            _FotoMapaSecao(territorio: territorio),
            const SizedBox(height: 24),

            // GRADES - Liberado para TODOS
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => GradesTerritorioScreen(numero: territorio.numero),
                    ),
                  );
                },
                icon: const Icon(Icons.grid_on_outlined),
                label: const Text(AppStrings.abrirGrades),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.azulMarinho,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Center(
              child: Text(
                AppStrings.publicadorPodeEditarGrades,
                style: TextStyle(
                  color: AppColors.verdeLivre,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 14),

            // INICIAR / CONCLUIR - somente admin
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {
                      executarSeAdmin(context, ref, () async {
                        final String nome = territorio.designadoPara ?? '';
                        if (nome.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Defina um designado antes de iniciar')),
                          );
                          return;
                        }
                        final String? data = await abrirDialogEditarTexto(
                          context: context,
                          titulo: 'Data inicial',
                          valorInicial: territorio.dataInicial,
                          label: 'Data (ex: 11/09/2026)',
                        );
                        if (data != null && data.trim().isNotEmpty) {
                          ref.read(territoriosProvider.notifier)
                            .iniciarTerritorio(territorio.numero, data.trim(), nome);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Território iniciado! S-13 atualizado.')),
                            );
                          }
                        }
                      });
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Iniciar'),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.verdeLivre,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {
                      executarSeAdmin(context, ref, () async {
                        final String? data = await abrirDialogEditarTexto(
                          context: context,
                          titulo: 'Data final',
                          valorInicial: territorio.dataFinal,
                          label: 'Data (ex: 30/09/2026)',
                        );
                        if (data != null && data.trim().isNotEmpty) {
                          ref.read(territoriosProvider.notifier)
                            .concluirTerritorio(territorio.numero, data.trim());
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Território concluído! S-13 atualizado.')),
                            );
                          }
                        }
                      });
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Concluir'),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.azulDesignado,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _InfoLinha(
              icone: Icons.person_outline,
              rotulo: 'Designado para',
              valor: territorio.designadoPara ?? 'Toque para designar',
              onTap: () {
                executarSeAdmin(context, ref, () async {
                  final String? nome = await abrirDialogEditarTexto(
                    context: context,
                    titulo: 'Designar dirigente',
                    valorInicial: territorio.designadoPara ?? '',
                    label: 'Nome do dirigente',
                  );
                  if (nome != null) {
                    ref.read(territoriosProvider.notifier)
                      .atualizarDesignado(territorio.numero, nome);
                  }
                });
              },
            ),
            _InfoLinha(
              icone: Icons.event_outlined,
              rotulo: 'Data inicial',
              valor: territorio.dataInicial.isEmpty ? '—' : territorio.dataInicial,
            ),
            _InfoLinha(
              icone: Icons.check_circle_outline,
              rotulo: 'Data final',
              valor: territorio.dataFinal.isEmpty ? '—' : territorio.dataFinal,
            ),
          ],
        ),
      ),
    );
  }
}

class _FotoMapaSecao extends ConsumerWidget {
  const _FotoMapaSecao({required this.territorio});
  final Territorio territorio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.map_outlined, size: 20, color: AppColors.azulMarinho),
            const SizedBox(width: 8),
            const Text(
              AppStrings.fotoMapaTitulo,
              style: TextStyle(
                color: AppColors.textoEscuro,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {
                executarSeAdmin(context, ref, () {
                  abrirDialogFotoMapa(context, ref, territorio);
                });
              },
              icon: Icon(
                territorio.temFotoMapa ? Icons.edit_outlined : Icons.add_photo_alternate_outlined,
                size: 18,
              ),
              label: Text(
                territorio.temFotoMapa ? AppStrings.trocarFoto : AppStrings.adicionarFoto,
              ),
              style: TextButton.styleFrom(foregroundColor: AppColors.azulMarinho),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.cremeCard,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.dourado.withValues(alpha: 0.5), width: 1.5),
          ),
          clipBehavior: Clip.antiAlias,
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: _PreviewFoto(territorio: territorio),
          ),
        ),
      ],
    );
  }
}

class _PreviewFoto extends StatelessWidget {
  const _PreviewFoto({required this.territorio});
  final Territorio territorio;

  @override
  Widget build(BuildContext context) {
    if (!territorio.temFotoMapa) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.image_not_supported_outlined,
              size: 44,
              color: AppColors.textoMedio.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 10),
            const Text(
              AppStrings.semFotoMapa,
              style: TextStyle(color: AppColors.textoMedio, fontSize: 13),
            ),
          ],
        ),
      );
    }
    return Image.network(
      territorio.fotoMapaUrl!,
      fit: BoxFit.cover,
      width: double.infinity,
      errorBuilder: (_, __, ___) {
        return Container(
          alignment: Alignment.center,
          color: AppColors.cremeCard,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.broken_image_outlined, size: 40, color: AppColors.erro),
              SizedBox(height: 8),
              Text(
                'Não foi possível carregar a imagem.',
                style: TextStyle(color: AppColors.textoMedio, fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _InfoLinha extends StatelessWidget {
  const _InfoLinha({
    required this.icone,
    required this.rotulo,
    required this.valor,
    this.onTap,
  });
  final IconData icone;
  final String rotulo;
  final String valor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.cremeCard,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.dourado.withValues(alpha: 0.4)),
              ),
              child: Icon(icone, size: 20, color: AppColors.azulMarinho),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rotulo,
                    style: const TextStyle(color: AppColors.textoMedio, fontSize: 12),
                  ),
                  Text(
                    valor,
                    style: const TextStyle(
                      color: AppColors.textoEscuro,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              const Icon(Icons.edit_outlined, size: 18, color: AppColors.azulMarinho),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// GRADES DO TERRITÓRIO - Liberado para TODOS
// ═══════════════════════════════════════════════════════════

class GradesTerritorioScreen extends ConsumerWidget {
  const GradesTerritorioScreen({super.key, required this.numero});
  final int numero;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Territorio? territorio = ref.watch(territorioPorNumeroProvider(numero));

    if (territorio == null) {
      return Scaffold(
        backgroundColor: AppColors.creme,
        appBar: AppBar(title: Text('Território $numero')),
        body: const Center(child: Text('Território não encontrado.')),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.creme,
        appBar: AppBar(
          title: Text('${AppStrings.gradesTitulo} — ${territorio.nome}'),
          bottom: const TabBar(
            indicatorColor: AppColors.dourado,
            labelColor: AppColors.creme,
            unselectedLabelColor: AppColors.douradoClaro,
            labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
            tabs: [
              Tab(text: AppStrings.abaGradeDirigente),
              Tab(text: AppStrings.abaGradeQuadras),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _GradeDirigente(territorio: territorio),
            _GradeQuadras(territorio: territorio),
          ],
        ),
      ),
    );
  }
}

class _GradeDirigente extends ConsumerWidget {
  const _GradeDirigente({required this.territorio});
  final Territorio territorio;
  static const double _larguraColuna = 105;
  static const double _alturaLinha = 54;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<List<String>> grade = territorio.gradeDirigente;
    if (grade.isEmpty) return const Center(child: Text('Grade vazia'));

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          color: AppColors.cremeCard,
          child: const Row(
            children: [
              Icon(Icons.touch_app_outlined, size: 16, color: AppColors.textoMedio),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  AppStrings.toqueParaEditar,
                  style: TextStyle(color: AppColors.textoMedio, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      for (int c = 0; c < GradeConfig.dirigenteColunas; c++)
                        _Celula(
                          largura: _larguraColuna,
                          altura: _alturaLinha,
                          texto: GradeConfig.dirigenteCabecalhos[c],
                          isHeader: true,
                        ),
                    ],
                  ),
                  for (int r = 0; r < grade.length; r++)
                    Row(
                      children: [
                        for (int c = 0; c < GradeConfig.dirigenteColunas; c++)
                          _Celula(
                            largura: _larguraColuna,
                            altura: _alturaLinha,
                            texto: grade[r][c],
                            isHeader: false,
                            onTap: () => abrirDialogEditarCelula(context, ref, territorio, r, c),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GradeQuadras extends ConsumerWidget {
  const _GradeQuadras({required this.territorio});
  final Territorio territorio;
  static const double _larguraColuna = 68;
  static const double _alturaLinha = 54;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<List<int>> grade = territorio.gradeQuadras;
    if (grade.isEmpty) return const Center(child: Text('Grade vazia'));

    int amarelas = 0;
    int verdes = 0;
    for (final List<int> linha in grade) {
      for (final int v in linha) {
        if (v == EstadoQuadra.amarelo) amarelas++;
        if (v == EstadoQuadra.verde) verdes++;
      }
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          color: AppColors.cremeCard,
          child: Row(
            children: [
              const Icon(Icons.touch_app_outlined, size: 16, color: AppColors.textoMedio),
              const SizedBox(width: 6),
              const Expanded(
                child: Text(
                  AppStrings.toqueParaMarcar,
                  style: TextStyle(color: AppColors.textoMedio, fontSize: 12),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                margin: const EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  color: AppColors.amareloPendente.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.amareloPendente.withValues(alpha: 0.5)),
                ),
                child: Text(
                  '$amarelas em andamento',
                  style: const TextStyle(
                    color: AppColors.amareloPendente,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.verdeLivre.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.verdeLivre.withValues(alpha: 0.4)),
                ),
                child: Text(
                  '$verdes concluídas',
                  style: const TextStyle(
                    color: AppColors.verdeLivre,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      for (final String cab in GradeConfig.quadrasCabecalhos)
                        _Celula(
                          largura: _larguraColuna,
                          altura: _alturaLinha,
                          texto: cab,
                          isHeader: true,
                        ),
                    ],
                  ),
                  for (int r = 0; r < grade.length; r++)
                    Row(
                      children: [
                        for (int c = 0; c < GradeConfig.quadrasColunas; c++)
                          _CelulaQuadra(
                            largura: _larguraColuna,
                            altura: _alturaLinha,
                            estado: grade[r][c],
                            onTap: () {
                              ref.read(territoriosProvider.notifier)
                                .ciclarCelulaQuadra(territorio.numero, r, c);
                            },
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Celula extends StatelessWidget {
  const _Celula({
    required this.largura,
    required this.altura,
    required this.texto,
    required this.isHeader,
    this.onTap,
  });
  final double largura;
  final double altura;
  final String texto;
  final bool isHeader;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largura,
      height: altura,
      child: Container(
        decoration: BoxDecoration(
          color: isHeader ? AppColors.azulMarinho : AppColors.cremeCard,
          border: Border.all(color: AppColors.dourado.withValues(alpha: 0.5), width: 0.8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  texto,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isHeader ? AppColors.creme : AppColors.textoEscuro,
                    fontSize: isHeader ? 13 : 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CelulaQuadra extends StatelessWidget {
  const _CelulaQuadra({
    required this.largura,
    required this.altura,
    required this.estado,
    required this.onTap,
  });
  final double largura;
  final double altura;
  final int estado;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color cor = EstadoQuadra.cor(estado);
    final IconData? icone = EstadoQuadra.icone(estado);
    final bool temCor = estado != EstadoQuadra.vazio;
    return SizedBox(
      width: largura,
      height: altura,
      child: Container(
        decoration: BoxDecoration(
          color: cor,
          border: Border.all(color: AppColors.dourado.withValues(alpha: 0.5), width: 0.8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: icone != null
                  ? Icon(
                      icone,
                      color: temCor ? Colors.white : AppColors.textoMedio,
                      size: 28,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SERVIÇO DE CAMPO - somente admin
// ═══════════════════════════════════════════════════════════

class ServicoCampoScreen extends ConsumerWidget {
  const ServicoCampoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MesSelecionado mesSel = ref.watch(mesSelecionadoProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(servicoCampoProvider.notifier).garantirMes(mesSel.ano, mesSel.mes);
    });
    final Map<String, List<LinhaServicoCampo>> todos = ref.watch(servicoCampoProvider);
    final String chave = chaveMes(mesSel.ano, mesSel.mes);
    final List<List<String>> dirigentes = ref.watch(dirigentesProvider);
    final List<LinhaServicoCampo> linhas = todos[chave] ?? gerarMesPadrao(mesSel.ano, mesSel.mes, dirigentes);
    final bool admin = ref.watch(adminLogadoProvider) != null;

    return Scaffold(
      backgroundColor: AppColors.creme,
      appBar: AppBar(
        title: const Text(AppStrings.servicoCampoTitulo),
        actions: [
          if (!admin)
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.lock_outline, color: AppColors.douradoClaro),
            ),
          IconButton(
            tooltip: AppStrings.redistribuirTooltip,
            icon: const Icon(Icons.refresh),
            onPressed: () {
              executarSeAdmin(context, ref, () {
                ref.read(servicoCampoProvider.notifier).redistribuirDirigentes(mesSel.ano, mesSel.mes);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(AppStrings.dirigentesRedistribuidos)),
                );
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _SeletorMes(mesSel: mesSel),
          if (!admin) const _BannerSomenteAdmin(),
          Expanded(
            child: _GradeServicoCampo(
              ano: mesSel.ano,
              mes: mesSel.mes,
              linhas: linhas,
            ),
          ),
        ],
      ),
    );
  }
}

class _BannerSomenteAdmin extends StatelessWidget {
  const _BannerSomenteAdmin();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: AppColors.amareloPendente.withValues(alpha: 0.15),
      child: const Row(
        children: [
          Icon(Icons.info_outline, size: 16, color: AppColors.douradoConcluido),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              AppStrings.modoLeitura,
              style: TextStyle(
                color: AppColors.douradoConcluido,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SeletorMes extends ConsumerWidget {
  const _SeletorMes({required this.mesSel});
  final MesSelecionado mesSel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: AppColors.azulMarinho,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          IconButton(
            onPressed: () => ref.read(mesSelecionadoProvider.notifier).anterior(),
            icon: const Icon(Icons.chevron_left),
            color: AppColors.creme,
            tooltip: 'Mês anterior',
          ),
          Expanded(
            child: Text(
              '${nomesMeses[mesSel.mes - 1]} ${mesSel.ano}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.creme,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          IconButton(
            onPressed: () => ref.read(mesSelecionadoProvider.notifier).proximo(),
            icon: const Icon(Icons.chevron_right),
            color: AppColors.creme,
            tooltip: 'Próximo mês',
          ),
        ],
      ),
    );
  }
}

class _GradeServicoCampo extends ConsumerWidget {
  const _GradeServicoCampo({
    required this.ano,
    required this.mes,
    required this.linhas,
  });
  final int ano;
  final int mes;
  final List<LinhaServicoCampo> linhas;

  static const double _larguraMes = 65;
  static const double _larguraSemana = 100;
  static const double _larguraLocal = 220;
  static const double _larguraHorario = 95;
  static const double _larguraDirigente = 220;
  static const double _alturaLinha = 50;

  Widget _linha(BuildContext context, WidgetRef ref, LinhaServicoCampo l) {
    final int diasNoMes = DateTime(ano, mes + 1, 0).day;
    final bool valida = l.dia <= diasNoMes;
    final String semana = valida ? nomeDiaSemana(DateTime(ano, mes, l.dia).weekday) : '—';

    return Row(
      children: [
        _CelulaServico(
          largura: _larguraMes,
          altura: _alturaLinha,
          texto: l.dia.toString().padLeft(2, '0'),
          isHeader: false,
          destaque: true,
        ),
        _CelulaServico(
          largura: _larguraSemana,
          altura: _alturaLinha,
          texto: semana,
          isHeader: false,
        ),
        _CelulaServico(
          largura: _larguraLocal,
          altura: _alturaLinha,
          texto: l.local.isEmpty ? '—' : l.local,
          isHeader: false,
          onTap: valida
              ? () {
                  executarSeAdmin(context, ref, () {
                    abrirDialogEditarServicoCampo(context, ref, ano, mes, l, 'local');
                  });
                }
              : null,
        ),
        _CelulaServico(
          largura: _larguraHorario,
          altura: _alturaLinha,
          texto: l.horario.isEmpty ? '—' : l.horario,
          isHeader: false,
          destaque: true,
          onTap: valida
              ? () {
                  executarSeAdmin(context, ref, () {
                    abrirDialogEditarServicoCampo(context, ref, ano, mes, l, 'horario');
                  });
                }
              : null,
        ),
        _CelulaServico(
          largura: _larguraDirigente,
          altura: _alturaLinha,
          texto: l.dirigente.isEmpty ? '—' : l.dirigente,
          isHeader: false,
          onTap: valida
              ? () {
                  executarSeAdmin(context, ref, () {
                    abrirDialogEditarServicoCampo(context, ref, ano, mes, l, 'dirigente');
                  });
                }
              : null,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          color: AppColors.cremeCard,
          child: const Row(
            children: [
              Icon(Icons.touch_app_outlined, size: 16, color: AppColors.textoMedio),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  AppStrings.toqueParaEditar,
                  style: TextStyle(color: AppColors.textoMedio, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      _CelulaServico(
                        largura: _larguraMes,
                        altura: _alturaLinha,
                        texto: AppStrings.colunaMes,
                        isHeader: true,
                      ),
                      _CelulaServico(
                        largura: _larguraSemana,
                        altura: _alturaLinha,
                        texto: AppStrings.colunaSemana,
                        isHeader: true,
                      ),
                      _CelulaServico(
                        largura: _larguraLocal,
                        altura: _alturaLinha,
                        texto: AppStrings.colunaLocal,
                        isHeader: true,
                      ),
                      _CelulaServico(
                        largura: _larguraHorario,
                        altura: _alturaLinha,
                        texto: AppStrings.colunaHorario,
                        isHeader: true,
                      ),
                      _CelulaServico(
                        largura: _larguraDirigente,
                        altura: _alturaLinha,
                        texto: AppStrings.colunaDirigente,
                        isHeader: true,
                      ),
                    ],
                  ),
                  for (final LinhaServicoCampo l in linhas) _linha(context, ref, l),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CelulaServico extends StatelessWidget {
  const _CelulaServico({
    required this.largura,
    required this.altura,
    required this.texto,
    required this.isHeader,
    this.onTap,
    this.destaque = false,
  });
  final double largura;
  final double altura;
  final String texto;
  final bool isHeader;
  final VoidCallback? onTap;
  final bool destaque;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largura,
      height: altura,
      child: Container(
        decoration: BoxDecoration(
          color: isHeader
              ? AppColors.azulMarinho
              : (destaque ? AppColors.cremeEscuro : AppColors.cremeCard),
          border: Border.all(color: AppColors.dourado.withValues(alpha: 0.5), width: 0.8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  texto,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isHeader ? AppColors.creme : AppColors.textoEscuro,
                    fontSize: isHeader ? 12 : 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// DIRIGENTE - somente admin
// ═══════════════════════════════════════════════════════════

class DirigenteScreen extends ConsumerWidget {
  const DirigenteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<List<String>> grade = ref.watch(dirigentesProvider);
    final bool admin = ref.watch(adminLogadoProvider) != null;

    return Scaffold(
      backgroundColor: AppColors.creme,
      appBar: AppBar(
        title: const Text(AppStrings.dirigenteGradeTitulo),
        actions: [
          if (!admin)
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.lock_outline, color: AppColors.douradoClaro),
            ),
          IconButton(
            tooltip: AppStrings.restaurarSimulacao,
            icon: const Icon(Icons.refresh),
            onPressed: () {
              executarSeAdmin(context, ref, () {
                ref.read(dirigentesProvider.notifier).restaurarSimulacao();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(AppStrings.nomesRestaurados)),
                );
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (!admin) const _BannerSomenteAdmin(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: AppColors.cremeCard,
            child: const Row(
              children: [
                Icon(Icons.touch_app_outlined, size: 16, color: AppColors.textoMedio),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    AppStrings.toqueParaEditar,
                    style: TextStyle(color: AppColors.textoMedio, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        for (final String cab in GradeConfig.dirigentesGradeCabecalhos)
                          _CelulaDirigente(
                            largura: 180,
                            altura: 54,
                            texto: cab,
                            isHeader: true,
                          ),
                      ],
                    ),
                    for (int r = 0; r < grade.length; r++)
                      Row(
                        children: [
                          for (int c = 0; c < GradeConfig.dirigentesGradeColunas; c++)
                            _CelulaDirigente(
                              largura: 180,
                              altura: 54,
                              texto: grade[r][c],
                              isHeader: false,
                              onTap: () {
                                executarSeAdmin(context, ref, () {
                                  abrirDialogEditarDirigente(context, ref, r, c);
                                });
                              },
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CelulaDirigente extends StatelessWidget {
  const _CelulaDirigente({
    required this.largura,
    required this.altura,
    required this.texto,
    required this.isHeader,
    this.onTap,
  });
  final double largura;
  final double altura;
  final String texto;
  final bool isHeader;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largura,
      height: altura,
      child: Container(
        decoration: BoxDecoration(
          color: isHeader ? AppColors.roxoDirigente : AppColors.cremeCard,
          border: Border.all(color: AppColors.dourado.withValues(alpha: 0.5), width: 0.8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  texto,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isHeader ? AppColors.creme : AppColors.textoEscuro,
                    fontSize: isHeader ? 13 : 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// EVENTOS - somente admin
// ═══════════════════════════════════════════════════════════

class EventosScreen extends ConsumerWidget {
  const EventosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<List<LinhaEvento>> grupos = ref.watch(eventosProvider);
    final bool admin = ref.watch(adminLogadoProvider) != null;

    return Scaffold(
      backgroundColor: AppColors.creme,
      appBar: AppBar(
        title: const Text(AppStrings.eventosTitulo),
        actions: [
          if (!admin)
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.lock_outline, color: AppColors.douradoClaro),
            ),
          IconButton(
            tooltip: 'Limpar tudo',
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              executarSeAdmin(context, ref, () async {
                final bool? confirmar = await showDialog<bool>(
                  context: context,
                  builder: (BuildContext ctx) {
                    return AlertDialog(
                      backgroundColor: AppColors.creme,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: AppColors.dourado, width: 1.5),
                      ),
                      title: const Text('Limpar grade de eventos?'),
                      content: const Text('Todos os dados preenchidos serão apagados.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(false),
                          child: const Text(AppStrings.cancelar),
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(backgroundColor: AppColors.erro),
                          onPressed: () => Navigator.of(ctx).pop(true),
                          child: const Text('Limpar'),
                        ),
                      ],
                    );
                  },
                );
                if (confirmar == true) {
                  ref.read(eventosProvider.notifier).limparTudo();
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (!admin) const _BannerSomenteAdmin(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            color: AppColors.cremeCard,
            child: const Row(
              children: [
                Icon(Icons.touch_app_outlined, size: 16, color: AppColors.textoMedio),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    AppStrings.eventoInstrucao,
                    style: TextStyle(color: AppColors.textoMedio, fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: _GradeEventos(grupos: grupos)),
        ],
      ),
    );
  }
}

class _GradeEventos extends ConsumerWidget {
  const _GradeEventos({required this.grupos});
  final List<List<LinhaEvento>> grupos;

  static const double wN = 50;
  static const double wNome = 190;
  static const double wDias = 130;
  static const double wPg = 60;
  static const double hHeader = 40;
  static const double hLinha = 56;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double larguraTotal =
        (wN + wNome + wDias + wPg) * GradeConfig.eventoGrupos;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: larguraTotal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                for (int g = 0; g < GradeConfig.eventoGrupos; g++) ...[
                  _CelulaHeaderEvento(largura: wN, altura: hHeader, texto: AppStrings.eventoColN),
                  _CelulaHeaderEvento(largura: wNome, altura: hHeader, texto: AppStrings.eventoColNome),
                  _CelulaHeaderEvento(largura: wDias, altura: hHeader, texto: AppStrings.eventoColDias),
                  _CelulaHeaderEvento(largura: wPg, altura: hHeader, texto: AppStrings.eventoColPg),
                ],
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int l = 0; l < GradeConfig.eventoLinhas; l++)
                      _linhaEvento(context, ref, l),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _linhaEvento(BuildContext context, WidgetRef ref, int linha) {
    return Row(
      children: [
        for (int g = 0; g < GradeConfig.eventoGrupos; g++) ...[
          SizedBox(
            width: wN,
            height: hLinha,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.cremeEscuro,
                border: Border.all(color: AppColors.dourado.withValues(alpha: 0.5), width: 0.8),
              ),
              child: Center(
                child: Text(
                  (g * GradeConfig.eventoLinhas + linha + 1).toString().padLeft(2, '0'),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textoEscuro,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: wNome,
            height: hLinha,
            child: _CelulaEventoEditavel(
              onTap: () {
                executarSeAdmin(context, ref, () async {
                  final String? v = await abrirDialogEditarTexto(
                    context: context,
                    titulo: 'Nome — Nº ${(g * GradeConfig.eventoLinhas + linha + 1).toString().padLeft(2, '0')}',
                    valorInicial: grupos[g][linha].nome,
                    label: 'Nome do irmão',
                  );
                  if (v != null) {
                    ref.read(eventosProvider.notifier).atualizarNome(g, linha, v.trim());
                  }
                });
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    grupos[g][linha].nome,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textoEscuro,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: wDias,
            height: hLinha,
            child: _CelulaDias(
              dias: grupos[g][linha].dias,
              onToggle: (int diaIdx) {
                executarSeAdmin(context, ref, () {
                  ref.read(eventosProvider.notifier).toggleDia(g, linha, diaIdx);
                });
              },
            ),
          ),
          SizedBox(
            width: wPg,
            height: hLinha,
            child: _CelulaPg(
              pg: grupos[g][linha].pg,
              onTap: () {
                executarSeAdmin(context, ref, () {
                  ref.read(eventosProvider.notifier).ciclarPg(g, linha);
                });
              },
            ),
          ),
        ],
      ],
    );
  }
}

class _CelulaHeaderEvento extends StatelessWidget {
  const _CelulaHeaderEvento({
    required this.largura,
    required this.altura,
    required this.texto,
  });
  final double largura;
  final double altura;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largura,
      height: altura,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.azulMarinho,
          border: Border.all(color: AppColors.dourado.withValues(alpha: 0.5), width: 0.8),
        ),
        child: Center(
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: AppColors.creme,
            ),
          ),
        ),
      ),
    );
  }
}

class _CelulaEventoEditavel extends StatelessWidget {
  const _CelulaEventoEditavel({required this.child, required this.onTap});
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.creme,
        border: Border.all(color: AppColors.dourado.withValues(alpha: 0.5), width: 0.8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(onTap: onTap, child: child),
      ),
    );
  }
}

class _CelulaDias extends StatelessWidget {
  const _CelulaDias({required this.dias, required this.onToggle});
  final List<bool> dias;
  final void Function(int) onToggle;

  static const List<String> rotulos = <String>['SEX', 'SÁB', 'DOM'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.creme,
        border: Border.all(color: AppColors.dourado.withValues(alpha: 0.5), width: 0.8),
      ),
      child: Row(
        children: [
          for (int d = 0; d < 3; d++)
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onToggle(d),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: dias[d] ? AppColors.eventoRoxo : AppColors.cremeCard,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: dias[d]
                            ? AppColors.eventoRoxo
                            : AppColors.dourado.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        rotulos[d],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: dias[d] ? Colors.white : AppColors.textoMedio,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _CelulaPg extends StatelessWidget {
  const _CelulaPg({required this.pg, required this.onTap});
  final int pg;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Color cor;
    IconData icone;
    if (pg == 1) {
      cor = AppColors.eventoVerde;
      icone = Icons.check;
    } else if (pg == 2) {
      cor = AppColors.eventoAmarelo;
      icone = Icons.close;
    } else {
      cor = AppColors.cremeCard;
      icone = Icons.circle_outlined;
    }
    final bool ativo = pg != 0;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.creme,
        border: Border.all(color: AppColors.dourado.withValues(alpha: 0.5), width: 0.8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                color: cor,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: ativo ? cor : AppColors.dourado.withValues(alpha: 0.4),
                ),
              ),
              child: Center(
                child: Icon(
                  icone,
                  size: 22,
                  color: ativo ? Colors.white : AppColors.textoMedio.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// S-13 - somente admin
// ═══════════════════════════════════════════════════════════

class S13Screen extends ConsumerWidget {
  const S13Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RegistroS13 registro = ref.watch(s13Provider);
    final bool admin = ref.watch(adminLogadoProvider) != null;

    return Scaffold(
      backgroundColor: AppColors.creme,
      appBar: AppBar(
        title: const Text(AppStrings.s13Titulo),
        actions: [
          if (!admin)
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.lock_outline, color: AppColors.douradoClaro),
            ),
          IconButton(
            tooltip: 'Limpar tudo',
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              executarSeAdmin(context, ref, () async {
                final bool? confirmar = await showDialog<bool>(
                  context: context,
                  builder: (BuildContext ctx) {
                    return AlertDialog(
                      backgroundColor: AppColors.creme,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: AppColors.dourado, width: 1.5),
                      ),
                      title: const Text('Limpar registro S-13?'),
                      content: const Text('Todos os dados preenchidos serão apagados.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(false),
                          child: const Text(AppStrings.cancelar),
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(backgroundColor: AppColors.erro),
                          onPressed: () => Navigator.of(ctx).pop(true),
                          child: const Text('Limpar'),
                        ),
                      ],
                    );
                  },
                );
                if (confirmar == true) {
                  ref.read(s13Provider.notifier).limparTudo();
                }
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!admin) const _BannerSomenteAdmin(),
            const Center(
              child: Text(
                AppStrings.s13Titulo,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.preto,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  AppStrings.s13Ano,
                  style: TextStyle(
                    color: AppColors.preto,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      executarSeAdmin(context, ref, () async {
                        final String? ano = await abrirDialogEditarTexto(
                          context: context,
                          titulo: AppStrings.s13Ano,
                          valorInicial: registro.anoServico,
                          label: AppStrings.s13AnoLabel,
                          teclado: TextInputType.number,
                        );
                        if (ano != null) {
                          ref.read(s13Provider.notifier).atualizarAno(ano);
                        }
                      });
                    },
                    child: Container(
                      height: 34,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColors.preto, width: 1.5),
                        ),
                      ),
                      child: Text(
                        registro.anoServico.isEmpty ? '____' : registro.anoServico,
                        style: const TextStyle(
                          color: AppColors.preto,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _TabelaS13(registro: registro),
            const SizedBox(height: 12),
            const Text(
              AppStrings.s13Rodape,
              style: TextStyle(
                color: AppColors.preto,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              AppStrings.s13Codigo,
              style: TextStyle(
                color: AppColors.preto,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabelaS13 extends ConsumerWidget {
  const _TabelaS13({required this.registro});
  final RegistroS13 registro;

  static const double wTerr = 55;
  static const double wDataConcl = 110;
  static const double wNome = 260;
  static const double wData = 110;
  static const double wAcoes = 60;
  static const double hHeader1 = 44;
  static const double hHeader2 = 44;
  static const double hNome = 32;
  static const double hData = 28;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double larguraTotal =
        wTerr + wDataConcl + (wNome * GradeConfig.s13Grupos) + wAcoes;

    return Container(
      decoration: BoxDecoration(border: Border.all(color: AppColors.preto, width: 1.5)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: larguraTotal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _CelulaS13Header(
                    largura: wTerr,
                    altura: hHeader1 + hHeader2,
                    texto: AppStrings.s13Terr,
                  ),
                  _CelulaS13Header(
                    largura: wDataConcl,
                    altura: hHeader1 + hHeader2,
                    texto: AppStrings.s13UltimaData,
                  ),
                  for (int g = 0; g < GradeConfig.s13Grupos; g++)
                    _CelulaS13Header(
                      largura: wNome,
                      altura: hHeader1,
                      texto: AppStrings.s13DesignadoPara,
                    ),
                  _CelulaS13Header(
                    largura: wAcoes,
                    altura: hHeader1 + hHeader2,
                    texto: 'Ações',
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: wTerr, height: hHeader2),
                  const SizedBox(width: wDataConcl, height: hHeader2),
                  for (int g = 0; g < GradeConfig.s13Grupos; g++) ...[
                    _CelulaS13Header(
                      largura: wData,
                      altura: hHeader2,
                      texto: AppStrings.s13DataDesig,
                    ),
                    _CelulaS13Header(
                      largura: wNome - wData,
                      altura: hHeader2,
                      texto: AppStrings.s13DataConcl,
                    ),
                  ],
                  const SizedBox(width: wAcoes, height: hHeader2),
                ],
              ),
              for (int i = 0; i < registro.territorios.length; i++)
                _BlocoS13(
                  index: i,
                  bloco: registro.territorios[i],
                  wTerr: wTerr,
                  wDataConcl: wDataConcl,
                  wNome: wNome,
                  wData: wData,
                  wAcoes: wAcoes,
                  hNome: hNome,
                  hData: hData,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlocoS13 extends ConsumerWidget {
  const _BlocoS13({
    required this.index,
    required this.bloco,
    required this.wTerr,
    required this.wDataConcl,
    required this.wNome,
    required this.wData,
    required this.wAcoes,
    required this.hNome,
    required this.hData,
  });
  final int index;
  final BlocoTerritorioS13 bloco;
  final double wTerr;
  final double wDataConcl;
  final double wNome;
  final double wData;
  final double wAcoes;
  final double hNome;
  final double hData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double alturaCelula = hNome + hData;
    final double alturaBloco = alturaCelula * GradeConfig.s13CelulasPorTerritorio;
    final bool completa = ref.watch(s13Provider.notifier).linhaCompleta(bloco.numero);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: wTerr,
          height: alturaBloco,
          child: _CelulaS13Editavel(
            onTap: () {
              executarSeAdmin(context, ref, () async {
                final String? v = await abrirDialogEditarTexto(
                  context: context,
                  titulo: 'Número do território',
                  valorInicial: bloco.numero,
                  label: 'Nº',
                );
                if (v != null) {
                  ref.read(s13Provider.notifier).atualizarNumero(index, v.trim());
                }
              });
            },
            child: Center(
              child: Text(
                bloco.numero,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppColors.preto,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: wDataConcl,
          height: alturaBloco,
          child: _CelulaS13Editavel(
            onTap: () {
              executarSeAdmin(context, ref, () async {
                final String? v = await abrirDialogEditarTexto(
                  context: context,
                  titulo: 'Data conclusão do território',
                  valorInicial: bloco.dataConclusao,
                  label: 'Data',
                );
                if (v != null) {
                  ref.read(s13Provider.notifier)
                    .atualizarDataConclusaoTerritorio(index, v.trim());
                }
              });
            },
            child: Center(
              child: Text(
                bloco.dataConclusao,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.preto,
                ),
              ),
            ),
          ),
        ),
        for (int g = 0; g < GradeConfig.s13Grupos; g++)
          Column(
            children: [
              for (int cel = 0; cel < GradeConfig.s13CelulasPorTerritorio; cel++)
                Column(
                  children: [
                    SizedBox(
                      width: wNome,
                      height: hNome,
                      child: _CelulaS13Editavel(
                        onTap: () {
                          executarSeAdmin(context, ref, () async {
                            final String? v = await abrirDialogEditarTexto(
                              context: context,
                              titulo: 'Nome — Terr. ${index + 1} · Célula ${cel + 1}',
                              valorInicial: bloco.grupos[g][cel].nome,
                              label: 'Nome do dirigente',
                            );
                            if (v != null) {
                              ref.read(s13Provider.notifier)
                                .atualizarNome(index, g, cel, v.trim());
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            bloco.grupos[g][cel].nome,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.preto,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: wData,
                          height: hData,
                          child: _CelulaS13Editavel(
                            onTap: () {
                              executarSeAdmin(context, ref, () async {
                                final String? v = await abrirDialogEditarTexto(
                                  context: context,
                                  titulo: 'Data da designação',
                                  valorInicial: bloco.grupos[g][cel].dataDesignacao,
                                  label: 'Data da designação',
                                );
                                if (v != null) {
                                  ref.read(s13Provider.notifier)
                                    .atualizarDataDesignacao(index, g, cel, v.trim());
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                bloco.grupos[g][cel].dataDesignacao,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.preto,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: wNome - wData,
                          height: hData,
                          child: _CelulaS13Editavel(
                            onTap: () {
                              executarSeAdmin(context, ref, () async {
                                final String? v = await abrirDialogEditarTexto(
                                  context: context,
                                  titulo: 'Data da conclusão',
                                  valorInicial: bloco.grupos[g][cel].dataConclusao,
                                  label: 'Data da conclusão',
                                );
                                if (v != null) {
                                  ref.read(s13Provider.notifier)
                                    .atualizarDataConclusao(index, g, cel, v.trim());
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                bloco.grupos[g][cel].dataConclusao,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.preto,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        SizedBox(
          width: wAcoes,
          height: alturaBloco,
          child: Center(
            child: IconButton(
              tooltip: completa ? 'Limpar linha' : 'Linha incompleta',
              icon: Icon(
                Icons.cleaning_services,
                color: completa
                    ? AppColors.erro
                    : AppColors.textoMedio.withValues(alpha: 0.3),
              ),
              onPressed: completa
                  ? () {
                      executarSeAdmin(context, ref, () async {
                        final bool? conf = await showDialog<bool>(
                          context: context,
                          builder: (BuildContext c) {
                            return AlertDialog(
                              backgroundColor: AppColors.creme,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: const BorderSide(color: AppColors.dourado, width: 1.5),
                              ),
                              title: const Text('Limpar linha do território?'),
                              content: Text('Os dados do território ${bloco.numero} no S-13 serão apagados.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(c).pop(false),
                                  child: const Text(AppStrings.cancelar),
                                ),
                                FilledButton(
                                  style: FilledButton.styleFrom(backgroundColor: AppColors.erro),
                                  onPressed: () => Navigator.of(c).pop(true),
                                  child: const Text('Limpar'),
                                ),
                              ],
                            );
                          },
                        );
                        if (conf == true) {
                          final int n = int.tryParse(bloco.numero) ?? -1;
                          if (n > 0) {
                            ref.read(s13Provider.notifier).limparLinha(n);
                          }
                        }
                      });
                    }
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

class _CelulaS13Header extends StatelessWidget {
  const _CelulaS13Header({
    required this.largura,
    required this.altura,
    required this.texto,
  });
  final double largura;
  final double altura;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largura,
      height: altura,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cinzaS13,
          border: Border.all(color: AppColors.preto, width: 1),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              texto,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: AppColors.preto,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CelulaS13Editavel extends StatelessWidget {
  const _CelulaS13Editavel({required this.child, required this.onTap});
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.creme,
        border: Border.all(color: AppColors.preto, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(onTap: onTap, child: child),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// ADMIN
// ═══════════════════════════════════════════════════════════

class AdminScreen extends ConsumerWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Administrador> admins = ref.watch(adminsProvider);
    final Administrador? logado = ref.watch(adminLogadoProvider);
    final bool temPrincipal = admins.any((Administrador a) => a.principal);

    if (logado != null) return _AdminPainelScreen(adminLogado: logado);
    if (!temPrincipal) return const _AdminSetupPrincipalScreen();
    return const _AdminLoginScreen();
  }
}

class _AdminSetupPrincipalScreen extends ConsumerStatefulWidget {
  const _AdminSetupPrincipalScreen();

  @override
  ConsumerState<_AdminSetupPrincipalScreen> createState() =>
      _AdminSetupPrincipalScreenState();
}

class _AdminSetupPrincipalScreenState
    extends ConsumerState<_AdminSetupPrincipalScreen> {
  final TextEditingController _nomeCtrl = TextEditingController();
  final TextEditingController _pinCtrl = TextEditingController();

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _pinCtrl.dispose();
    super.dispose();
  }

  void _criar() {
    final String nome = _nomeCtrl.text.trim();
    final String pin = _pinCtrl.text.trim();
    if (nome.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.adminNomeVazio)),
      );
      return;
    }
    if (pin.length != 4 || int.tryParse(pin) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.adminPinInvalido)),
      );
      return;
    }
    ref.read(adminsProvider.notifier).criarPrincipal(nome, pin);
    final Administrador novo = ref.read(adminsProvider).firstWhere(
          (Administrador a) => a.principal,
        );
    ref.read(adminLogadoProvider.notifier).entrar(novo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creme,
      appBar: AppBar(title: const Text(AppStrings.adminTitulo)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 90,
              height: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.azulMarinho,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.dourado, width: 2),
              ),
              child: const Icon(
                Icons.admin_panel_settings,
                size: 52,
                color: AppColors.dourado,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              AppStrings.adminCriarPrincipal,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textoEscuro,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'É a primeira vez que este app é configurado. Crie o Administrador Principal.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textoMedio, fontSize: 13),
            ),
            const SizedBox(height: 28),
            TextField(
              controller: _nomeCtrl,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: AppStrings.adminNome,
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _pinCtrl,
              keyboardType: TextInputType.number,
              maxLength: 4,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: AppStrings.adminPin,
                prefixIcon: Icon(Icons.lock_outline),
                border: OutlineInputBorder(),
                counterText: '',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _criar,
                icon: const Icon(Icons.check),
                label: const Text(AppStrings.adminCriar),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.azulMarinho,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminLoginScreen extends ConsumerStatefulWidget {
  const _AdminLoginScreen();

  @override
  ConsumerState<_AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends ConsumerState<_AdminLoginScreen> {
  final TextEditingController _nomeCtrl = TextEditingController();
  final TextEditingController _pinCtrl = TextEditingController();

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _pinCtrl.dispose();
    super.dispose();
  }

  void _entrar() {
    final String nome = _nomeCtrl.text.trim();
    final String pin = _pinCtrl.text.trim();
    final Administrador? a = ref.read(adminsProvider.notifier).autenticar(nome, pin);
    if (a == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.adminCredenciaisErradas)),
      );
      return;
    }
    ref.read(adminLogadoProvider.notifier).entrar(a);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creme,
      appBar: AppBar(title: const Text(AppStrings.adminTitulo)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 90,
              height: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.azulMarinho,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.dourado, width: 2),
              ),
              child: const Icon(Icons.lock_outline, size: 52, color: AppColors.dourado),
            ),
            const SizedBox(height: 24),
            const Text(
              AppStrings.adminLogin,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textoEscuro,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 28),
            TextField(
              controller: _nomeCtrl,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: AppStrings.adminNome,
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _pinCtrl,
              keyboardType: TextInputType.number,
              maxLength: 4,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: AppStrings.adminPin,
                prefixIcon: Icon(Icons.lock_outline),
                border: OutlineInputBorder(),
                counterText: '',
              ),
              onSubmitted: (_) => _entrar(),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _entrar,
                icon: const Icon(Icons.login),
                label: const Text(AppStrings.adminEntrar),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.azulMarinho,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminPainelScreen extends ConsumerWidget {
  const _AdminPainelScreen({required this.adminLogado});
  final Administrador adminLogado;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Administrador> admins = ref.watch(adminsProvider);
    final bool podeCriar = ref.read(adminsProvider.notifier).podeCriarAuxiliar;
    final int totalAuxiliares =
        admins.where((Administrador a) => !a.principal).length;

    return Scaffold(
      backgroundColor: AppColors.creme,
      appBar: AppBar(
        title: const Text(AppStrings.adminPainel),
        actions: [
          IconButton(
            tooltip: AppStrings.adminSair,
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(adminLogadoProvider.notifier).sair();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.azulMarinho,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.dourado, width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.dourado,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          adminLogado.principal ? Icons.verified_user : Icons.person,
                          color: AppColors.azulProfundo,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AppStrings.adminBemVindo}, ${adminLogado.nome}',
                              style: const TextStyle(
                                color: AppColors.creme,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: adminLogado.principal
                                    ? AppColors.dourado
                                    : AppColors.azulClaro,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                adminLogado.principal
                                    ? AppStrings.adminPrincipalLabel
                                    : AppStrings.adminAuxiliarLabel,
                                style: TextStyle(
                                  color: adminLogado.principal
                                      ? AppColors.azulProfundo
                                      : AppColors.creme,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    adminLogado.principal
                        ? AppStrings.adminInstrucaoPrincipal
                        : AppStrings.adminInstrucaoAuxiliar,
                    style: const TextStyle(
                      color: AppColors.creme,
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text(
                  'Administradores',
                  style: TextStyle(
                    color: AppColors.textoEscuro,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.cremeCard,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.dourado.withValues(alpha: 0.5)),
                  ),
                  child: Text(
                    '$totalAuxiliares / ${GradeConfig.maxAdminsAuxiliares}',
                    style: const TextStyle(
                      color: AppColors.textoEscuro,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            for (final Administrador a in admins)
              _AdminItem(
                admin: a,
                podeRemover: adminLogado.principal && !a.principal,
              ),
            const SizedBox(height: 20),
            if (adminLogado.principal)
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: podeCriar
                      ? () => _abrirDialogCriarAuxiliar(context, ref)
                      : null,
                  icon: const Icon(Icons.person_add),
                  label: Text(
                    podeCriar ? AppStrings.adminAdd : AppStrings.adminLimite,
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor:
                        podeCriar ? AppColors.azulMarinho : AppColors.textoMedio,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _abrirDialogCriarAuxiliar(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final TextEditingController nomeCtrl = TextEditingController();
    final TextEditingController pinCtrl = TextEditingController();

    final bool? confirmar = await showDialog<bool>(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          backgroundColor: AppColors.creme,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.dourado, width: 1.5),
          ),
          title: const Text(
            AppStrings.adminAdd,
            style: TextStyle(
              color: AppColors.textoEscuro,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nomeCtrl,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: AppStrings.adminNome,
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: pinCtrl,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: AppStrings.adminPin,
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),
                    counterText: '',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text(
                AppStrings.cancelar,
                style: TextStyle(color: AppColors.textoMedio),
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: AppColors.azulMarinho),
              onPressed: () {
                final String nome = nomeCtrl.text.trim();
                final String pin = pinCtrl.text.trim();
                if (nome.isEmpty) {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    const SnackBar(content: Text(AppStrings.adminNomeVazio)),
                  );
                  return;
                }
                if (pin.length != 4 || int.tryParse(pin) == null) {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    const SnackBar(content: Text(AppStrings.adminPinInvalido)),
                  );
                  return;
                }
                Navigator.of(ctx).pop(true);
              },
              child: const Text(AppStrings.salvar),
            ),
          ],
        );
      },
    );

    if (confirmar == true) {
      ref.read(adminsProvider.notifier).criarAuxiliar(
            nomeCtrl.text.trim(),
            pinCtrl.text.trim(),
          );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(AppStrings.adminCriarSucesso)),
        );
      }
    }
    nomeCtrl.dispose();
    pinCtrl.dispose();
  }
}

class _AdminItem extends ConsumerWidget {
  const _AdminItem({required this.admin, required this.podeRemover});
  final Administrador admin;
  final bool podeRemover;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cremeCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: admin.principal
              ? AppColors.dourado
              : AppColors.dourado.withValues(alpha: 0.3),
          width: admin.principal ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: admin.principal ? AppColors.dourado : AppColors.azulMarinho,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              admin.principal ? Icons.verified_user : Icons.person,
              color: admin.principal ? AppColors.azulProfundo : AppColors.creme,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  admin.nome,
                  style: const TextStyle(
                    color: AppColors.textoEscuro,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  admin.principal
                      ? AppStrings.adminPrincipalLabel
                      : AppStrings.adminAuxiliarLabel,
                  style: TextStyle(
                    color: admin.principal
                        ? AppColors.douradoConcluido
                        : AppColors.textoMedio,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (podeRemover)
            IconButton(
              tooltip: AppStrings.adminRemover,
              icon: const Icon(Icons.delete_outline, color: AppColors.erro, size: 20),
              onPressed: () async {
                final bool? conf = await showDialog<bool>(
                  context: context,
                  builder: (BuildContext c) {
                    return AlertDialog(
                      backgroundColor: AppColors.creme,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: AppColors.dourado, width: 1.5),
                      ),
                      title: const Text(AppStrings.adminRemoverConfirm),
                      content: Text('Remover "${admin.nome}"?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(c).pop(false),
                          child: const Text(AppStrings.cancelar),
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(backgroundColor: AppColors.erro),
                          onPressed: () => Navigator.of(c).pop(true),
                          child: const Text(AppStrings.adminRemover),
                        ),
                      ],
                    );
                  },
                );
                if (conf == true) {
                  ref.read(adminsProvider.notifier).remover(admin.id);
                }
              },
            ),
        ],
      ),
    );
  }
}
