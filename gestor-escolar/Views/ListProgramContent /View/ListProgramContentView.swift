import UIKit

final class ListProgramContentView: UIView {
    var didTappedClassroom: (() -> Void)?

    private let programContentColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.collectionViewLayout = layout
        collection.register(ProgramContentDatesCollectionViewCell.self,
                            forCellWithReuseIdentifier: ProgramContentDatesCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = DSColors.background

        programContentColletionView.backgroundColor = .none
        programContentColletionView.delegate = self
        programContentColletionView.dataSource = self
        stupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func stupUI() {
        buildHierarchy()
        applyConstraints()
    }

    private func buildHierarchy() {
        addSubview(programContentColletionView)
    }

    private func applyConstraints() {
        NSLayoutConstraint.activate([
            programContentColletionView.topAnchor.constraint(equalTo: topAnchor, constant: DSSpacing.large),
            programContentColletionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            programContentColletionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            programContentColletionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}

extension ListProgramContentView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgramContentDatesCollectionViewCell.identifier, for: indexPath) as? ProgramContentDatesCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(with: #function)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        didTappedClassroom?()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}

extension ListProgramContentView: ListProgramContentViewProtocol {
    func show(with viewModel: [ClassroomsViewModel]) {
        print(#function)
    }
}
