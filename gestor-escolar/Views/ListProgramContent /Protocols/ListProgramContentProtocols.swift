import UIKit

protocol ListProgramContentViewProtocol: UIView {
    var didTappedProgramContent: ((ProgramContentViewModel) -> Void)? { get set }

    func show(with viewModel: [ProgramContentViewModel])
}

protocol ListProgramContentViewControllerProtocol: UIViewController {
    func show(with viewModel: [ProgramContentViewModel])
}

protocol ProgramContentDatesCollectionViewCellProtocol: UICollectionViewCell {
    func configure(with date: String)
}

protocol ListProgramContentPresenterProtocol: AnyObject {
    func fecthProgramContents(with viewModel: ClassroomForProgramContentViewModel)
}

protocol ListProgramContentViewControllerDelegate: AnyObject {
    func didToProgramContent(with viewModel: ProgramContentViewModel)
}
