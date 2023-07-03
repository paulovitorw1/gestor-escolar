import Foundation

struct ClassroomModelAdapter {
    static func adapt(classrooms: [ClassroomsModel]) -> [ClassroomsViewModel] {
        return classrooms.map { classroom in
            return ClassroomsViewModel(title: "\(classroom.gradeDescription) - Turma: \(classroom.schoolClass)",
                                       discipline: classroom.discipline,
                                       classPeriod: self.classPeriod(with: classroom.shift),
                                       schoolCode: classroom.schoolCode,
                                       gradeLevel: classroom.gradeLevel,
                                       schoolClass: classroom.schoolClass,
                                       disciplineCode: classroom.disciplineCode)
        }
    }

    private static func  classPeriod(with period: String) -> String {
        switch period {
        case "M":
            return "Manhã"
        case "T":
            return "Tarde"
        default:
            return "-- --"
        }
    }
}
