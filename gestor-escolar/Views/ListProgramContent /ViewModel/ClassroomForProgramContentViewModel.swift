import Foundation

struct ClassroomForProgramContentViewModel {
    let classPeriod: String
    let schoolCode: String
    let gradeLevel: String
    let schoolClass: String
    let disciplineCode: String

    init(classPeriod: String, schoolCode: String, gradeLevel: String, schoolClass: String, disciplineCode: String) {
        if classPeriod.lowercased() == "manhã" {
            self.classPeriod = "M"
        } else if classPeriod.lowercased() == "tarde" {
            self.classPeriod = "T"
        } else {
            self.classPeriod = classPeriod
        }
        self.schoolCode = schoolCode
        self.gradeLevel = gradeLevel
        self.schoolClass = schoolClass
        self.disciplineCode = disciplineCode
    }
}
