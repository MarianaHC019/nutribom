class Paciente {
  final String? id;
  final String nome;
  final String dataNascimento;
  final String? fotoPaciente;

  const Paciente({
    this.id,
    required this.nome,
    required this.dataNascimento,
    this.fotoPaciente,
  });
}
