class Alimento {
  final String? id;
  final String nomeAlimento;
  final String categoria;
  final String tipo;
  final String? fotoAlimento;

  const Alimento({
    this.id,
    required this.nomeAlimento,
    required this.categoria,
    required this.tipo,
    this.fotoAlimento,
  });
}
