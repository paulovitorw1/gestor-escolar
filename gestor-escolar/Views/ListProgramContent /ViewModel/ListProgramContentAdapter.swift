import Foundation

struct ListProgramContentAdapter {
    static func adapt(answers: [ProgramContentModel]) -> [ProgramContentViewModel] {
        return answers.map { answer in
            return ProgramContentViewModel(recnum: answer.recnum,
                                               date: "\(answer.date) - \(answer.startTime) às \(answer.endTime)",
                                               text: answer.text)
        }
    }
}
