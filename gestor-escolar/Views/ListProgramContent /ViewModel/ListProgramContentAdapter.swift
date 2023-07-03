import Foundation

struct ListProgramContentAdapter {
    static func adapt(answers: [ProgramContentModel]) -> [ListProgramContentViewModel] {
        return answers.map { answer in
            return ListProgramContentViewModel(recnum: answer.recnum,
                                               date: "\(answer.date) - \(answer.startTime) as \(answer.endTime)",
                                               text: answer.text)
        }
    }
}
