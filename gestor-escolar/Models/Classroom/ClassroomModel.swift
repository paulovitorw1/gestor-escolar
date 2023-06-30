import Foundation

struct ClassroomModel: Codable {
    let classrooms: [ClassroomsModel]

    private enum CodingKeys: String, CodingKey {
        case classrooms = "turmas"
    }
}

struct ClassroomsModel: Codable {
    let schoolCode: String
    let gradeLevel: String
    let gradeDescription: String
    let seriesDescription: String
    let shift: String
    let schoolClass: String
    let disciplineCode: String
    let discipline: String

    private enum CodingKeys: String, CodingKey {
        case schoolCode = "codigo_escola"
        case gradeLevel = "grau_serie"
        case gradeDescription = "descricao_grau"
        case seriesDescription = "descricao_serie"
        case shift = "turno"
        case schoolClass = "turma"
        case disciplineCode = "cod_disciplina"
        case discipline = "disciplina"
    }
}

struct Etapa: Codable {
    let etapa: String
    let inicioEtapa: String
    let fimEtapa: String
}
