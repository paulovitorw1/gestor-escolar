import Foundation

import UIKit

protocol ListProgramContentViewProtocol: UIView {
    var didTappedProgramContent: (() -> Void)? { get set }

    func show(with viewModel: [ListProgramContentViewModel])
}

protocol ListProgramContentViewControllerProtocol: UIViewController {
    func show(with viewModel: [ListProgramContentViewModel])
}

protocol ProgramContentDatesCollectionViewCellProtocol: UICollectionViewCell {
    func configure(with date: String)
}

protocol ListProgramContentPresenterProtocol: AnyObject {
    func fecthProgramContents()
}

protocol ListProgramContentViewControllerDelegate: AnyObject {
    func didToProgramContent()
}
