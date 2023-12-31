import UIKit

protocol ClassroomsViewProtocol: UIView {
    var didTappedClassroom: ((String, String, String, String, String) -> Void)? { get set }
    
    func show(with viewModel: [ClassroomsViewModel])
}

protocol ClassroomsViewControllerProtocol: UIViewController {    
    func show(with viewModel: [ClassroomsViewModel])
}

protocol ClassroomCollectionViewCellProtocol: UICollectionViewCell {
    func configure(with viewModel: ClassroomsViewModel)
}

protocol ClassroomsPresenterProtocol: AnyObject {
    func fecthClassrooms(with viewModel: HomeConfigViewModel)
}

protocol ClassroomsViewControllerDelegate: AnyObject {
    func didToListContents(with viewModel: ClassroomForProgramContentViewModel)
}
