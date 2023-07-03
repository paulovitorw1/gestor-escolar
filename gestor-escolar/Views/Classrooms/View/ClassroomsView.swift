import UIKit

final class ClassroomsView: UIView {
    var didTappedClassroom: (() -> Void)?
    private var listClassrooms: [ClassroomsViewModel] = []
    
    private let classroomColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ClassroomCollectionViewCell.self,
                            forCellWithReuseIdentifier: ClassroomCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()


    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = DSColors.background
        stupUI()

        classroomColletionView.backgroundColor = .none
        classroomColletionView.delegate = self
        classroomColletionView.dataSource = self
        classroomColletionView.collectionViewLayout = createLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout {_,_ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: DSSpacing.xSmall,
                                                         leading: DSSpacing.xSmall,
                                                         bottom: DSSpacing.xSmall,
                                                         trailing: DSSpacing.xSmall)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: DSSpacing.xSmall,
                                                            leading: DSSpacing.small,
                                                            bottom: DSSpacing.xSmall,
                                                            trailing: DSSpacing.small)
            return section
        }
    }
    
    private func stupUI() {
        buildHierarchy()
        applyConstraints()
    }

    private func buildHierarchy() {
        addSubview(classroomColletionView)
    }

    private func applyConstraints() {
        NSLayoutConstraint.activate([
            classroomColletionView.topAnchor.constraint(equalTo: topAnchor, constant: DSSpacing.large),
            classroomColletionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            classroomColletionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            classroomColletionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}

extension ClassroomsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listClassrooms.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClassroomCollectionViewCell.identifier, for: indexPath) as? ClassroomCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(with: listClassrooms[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        didTappedClassroom?()
    }
}

extension ClassroomsView: ClassroomsViewProtocol {
    func show(with viewModel: [ClassroomsViewModel]) {
        listClassrooms = viewModel
        DispatchQueue.main.async { [weak self] in
            self?.classroomColletionView.reloadData()
        }
    }
}
