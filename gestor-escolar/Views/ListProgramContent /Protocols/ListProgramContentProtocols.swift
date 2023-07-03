import Foundation

import UIKit

protocol ListProgramContentViewProtocol: UIView {
    var didTappedClassroom: (() -> Void)? { get set }

    func show(with viewModel: [ClassroomsViewModel])
}

protocol ListProgramContentViewControllerProtocol: UIViewController {
    func show(with viewModel: [ClassroomsViewModel])
}

protocol ProgramContentDatesCollectionViewCellProtocol: UICollectionViewCell {
    func configure(with date: String)
}

protocol ListProgramContentPresenterProtocol: AnyObject {
    func fecthClassrooms(with viewModel: HomeConfigViewModel)
}

protocol ListProgramContentViewControllerDelegate: AnyObject {
    func didSeeStudyProgram()
}
