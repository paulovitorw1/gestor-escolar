import UIKit

final class HomeView: UIView {
    var didTappedMenu: ((HomeConfigViewModel?) -> Void)?
    private var listMenu: [HomeMenuViewModel] = []
    private var configUser: HomeConfigViewModel?

    private let headerView: HomeHeaderView = {
        let header = HomeHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    private let menuColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(MenuCollectionViewCell.self,
                            forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()


    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = DSColors.background
        stupUI()

        menuColletionView.backgroundColor = .none
        menuColletionView.delegate = self
        menuColletionView.dataSource = self
        menuColletionView.collectionViewLayout = createLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout {_,_ in
            let fraction: CGFloat = 1 / 3
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: DSSpacing.xSmall,
                                                         leading: DSSpacing.xSmall,
                                                         bottom: DSSpacing.xSmall,
                                                         trailing: DSSpacing.xSmall)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: DSSpacing.xSmall,
                                                            leading: DSSpacing.xSmall,
                                                            bottom: DSSpacing.xSmall,
                                                            trailing: DSSpacing.xSmall)
            return section
        }
    }

    private func stupUI() {
        buildHierarchy()
        applyConstraints()
    }

    private func buildHierarchy() {
        addSubview(headerView)
        addSubview(menuColletionView)
    }

    private func applyConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            menuColletionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: DSSpacing.large),
            menuColletionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            menuColletionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            menuColletionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}
extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listMenu.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as! MenuCollectionViewCell
        cell.configure(listMenu[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        didTappedMenu?(self.configUser ?? nil)
    }
}

extension HomeView: HomeViewProtocol {
    func show(_ viewModel: HomeViewModel) {
        listMenu = viewModel.menus
        DispatchQueue.main.async { [weak self] in
            self?.menuColletionView.reloadData()
        }
        configUser = viewModel.config
        headerView.show(viewModel.config)
    }
}
