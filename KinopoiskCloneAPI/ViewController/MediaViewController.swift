//
//  MediaViewController.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 11.10.2023.
//

import UIKit

class MediaViewController: UIViewController {
    
    private let sections = ModelDataMedia.shared.pageData
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    //private var titles: [Title] = [Title]()

//    private let upcomingTable: UITableView = {
//        let table = UITableView()
//        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
//        return table
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Медиа"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        navigationItem.title = "Медиа"
        setupViews()
        setConstraints()
        setDelegate()
        
//        view.addSubview(upcomingTable)
//        upcomingTable.delegate = self
//        upcomingTable.dataSource = self
        
//        fetchUpcoming()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //upcomingTable.frame = view.bounds
    }
    
    private func fetchUpcoming() {
//        APICaller.shared.getUpcomingMovies { [weak self] result in
//            switch result {
//            case .success(let titles):
//                self?.titles = titles
//                DispatchQueue.main.async {
//                    self?.upcomingTable.reloadData()
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    


private func setupViews() {
    view.backgroundColor = .systemBackground
  
    title = "Медиа"
    view.addSubview(collectionView)
    
    collectionView.register(SalessCollectionViewCell.self, forCellWithReuseIdentifier: "SalessCollectionViewCell")
    collectionView.register(MediaCollectionViewCell.self, forCellWithReuseIdentifier: "MediaCollectionViewCell")
    collectionView.register(ExclusiveCollectionViewCell.self, forCellWithReuseIdentifier: "ExclusiveCollectionViewCell")
    
    collectionView.register(CreateGraphikSectionCollectionView.self, forCellWithReuseIdentifier: "CreateGraphikSectionCollectionView")
    
    collectionView.register(TrailerCollectionView.self, forCellWithReuseIdentifier: "TrailerCollectionView")
    
    collectionView.register(HeaderSuplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
    collectionView.collectionViewLayout = createLayout()
}

private func setDelegate() {
    collectionView.delegate = self
    collectionView.dataSource = self
}

}

// MARK: - Create Layout
extension MediaViewController {

private func createLayout() -> UICollectionViewCompositionalLayout {
    
    UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
        guard let self = self else { return nil }
        let section = self.sections[sectionIndex]
        switch section {
            
        case .saless(_):
            return self.createSaleSection()
        case .categorya(_):
            return self.createCategorySection()
        case .example(_):
            return self.createExampleSection()
        case .graphic(_):
            return self.createGraphikSection()
        case.trailer(_):
            return self.createTrailerSection()
        }
    }
    
}

private func createLayoutsection(group: NSCollectionLayoutGroup,
                                 behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                 interGroupSpacing: CGFloat,
                                 supplementaryItem: [NSCollectionLayoutBoundarySupplementaryItem],
                                 contentInsets: Bool) -> NSCollectionLayoutSection {
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = behavior
    section.interGroupSpacing = interGroupSpacing
    section.boundarySupplementaryItems = supplementaryItem
    section.supplementariesFollowContentInsets = contentInsets
    return section
}


// -- 111
    private func createSaleSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(0.9)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4),
                                                                         heightDimension: .fractionalHeight(0.5)),
                                                                         subitems: [item])
        // - [supplementaryHeaderItem()] -- title top section
        let section = createLayoutsection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 10,
                                          supplementaryItem: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 0)
        return section
    }
    
    // -- 222
    private func createCategorySection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5),
                                                            heightDimension: .fractionalHeight(0.9)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.15)),
                                                                         subitems: [item])
        group.interItemSpacing = .flexible(10)
        let section = createLayoutsection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 10,
                                          supplementaryItem: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
    // -- 333
    private func createExampleSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.3)),
                                                                         subitems: [item])
        // - [supplementaryHeaderItem()] -- title top section
        let section = createLayoutsection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 10,
                                          supplementaryItem: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 20, trailing: 10)
        return section
    }
    
    // -- 4444
    private func createGraphikSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(0.9)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4),
                                                                         heightDimension: .fractionalHeight(0.4)),
                                                                         subitems: [item])
        // - [supplementaryHeaderItem()] -- title top section
        let section = createLayoutsection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 10,
                                          supplementaryItem: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 0)
        return section
    }
    
    // -- 55555
    private func createTrailerSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8),
                                                                         heightDimension: .fractionalHeight(0.4)),
                                                                         subitems: [item])
        // - [supplementaryHeaderItem()] -- title top section
        let section = createLayoutsection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 10,
                                          supplementaryItem: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 50, trailing: 10)
        return section
    }
    
    // add title top serctions
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
    
}


// MARK: - UICollectionViewDelegate
extension MediaViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension MediaViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .saless(let sale):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SalessCollectionViewCell", for: indexPath) as? SalessCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(CategoryName: sale[indexPath.row].title, imageName: sale[indexPath.row].image)
            return cell
            
        case .categorya(let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediaCollectionViewCell", for: indexPath) as? MediaCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(CategoryName: category[indexPath.row].title, imageName: category[indexPath.row].image)
            return cell
            
        case .example(let example):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExclusiveCollectionViewCell", for: indexPath) as? ExclusiveCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(CategoryName: example[indexPath.row].title, imageName: example[indexPath.row].image)
            return cell
            
        case .graphic(let graphik):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateGraphikSectionCollectionView", for: indexPath) as? CreateGraphikSectionCollectionView
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(CategoryName: graphik[indexPath.row].title, imageName: graphik[indexPath.row].image)
            return cell
            
        case .trailer(let trailer):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrailerCollectionView", for: indexPath) as? TrailerCollectionView
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(CategoryName: trailer[indexPath.row].title, imageName: trailer[indexPath.row].image)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "HeaderSupplementaryView",
                                                                         for: indexPath) as! HeaderSuplementaryView
            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - ViewController
    extension MediaViewController {
        
        private func  setConstraints() {
            
            NSLayoutConstraint.activate([
                
                // constraints задать от topAnchor
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20), // здесь
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                
            ])
        }
    }





//extension MediaViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return titles.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
//            return UITableViewCell()
//        }
//        
//        let title = titles[indexPath.row]
//        cell.configure(with: TitleViewModel(titleName: (title.original_title ?? title.original_name) ?? "Uncnown title name", posterURL: title.poster_path ?? ""))
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        let title = titles[indexPath.row]
        
        //guard let titleName = title.original_title ?? title.original_name else {
        //    return
       // }
        
//        APICaller.shared.getMovie(with: titleName) { [weak self] result in
//            switch result {
//            case .success(let videoElement):
//                DispatchQueue.main.async {
//                    let vc = TitlePreviewViewController()
//                    vc.configure(with: TitlePreviewViewModel(title: titleName, youtubeView: videoElement, titleOverview: title.overview ?? ""))
//                    self?.navigationController?.pushViewController(vc, animated: true)
//                }
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//
//        }
        
  //  }
    
//}

