//
//  SearchViewController.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 09.10.2023.
//

import UIKit

class SearchViewController: UIViewController {
//UIScrollViewDelegate , SearchResultsViewControllerDelegate {
    
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Make and order", for: .normal)
        button.backgroundColor = .red
        button.tintColor = .systemBackground
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let sections = ModelDataSearch.shared.pageData
    
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .blue
        return contentView
    }()
    
    private let container: UIView = {
        let container = UIView()
        container.backgroundColor = .tertiarySystemGroupedBackground
        return container
    }()
    
    private let searchController: UISearchBar = {
        
        let controller = UISearchBar()
        controller.placeholder = "Search for a Movie or a Tv show"
//        controller.backgroundColor = .secondarySystemGroupedBackground
//        controller.tintColor = .secondarySystemGroupedBackground
//        controller.barTintColor = .secondarySystemGroupedBackground
        controller.searchBarStyle = .minimal
        return controller
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.tintColor = .secondarySystemGroupedBackground
        imageView.tintColor = .lightGray
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "slider.horizontal.3")
        return imageView
    }()
    
//    private lazy var  scrollView: UIScrollView = {
//           let scrollView = UIScrollView()
//           scrollView.contentSize = CGSize(width: view.bounds.width, height: 1500)
//           scrollView.backgroundColor = .systemBackground
//           return scrollView
//       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scrollView.delegate = self
        //view.addSubview(scrollView)
        
        navigationController?.navigationBar.isHidden = true
        self.view.addSubview(container)
        self.container.addSubview(searchController)
        self.container.addSubview(imageView)
        
        setupview()
        
        setupViews()
        setConstraints()
        setDelegate()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
       // title = "FoodShop"
        //view.addSubview(orderButton)
        view.addSubview(collectionView)
        
        collectionView.register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: "StoriesCollectionViewCell")
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "PopularCollectionViewCell")
        collectionView.register(ExampleCollectionViewCell.self, forCellWithReuseIdentifier: "ComingSoomCollectionViewCell")
        collectionView.register(HeaderSuplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    

    private func setupview() {
        
       
        searchController.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //scrollView.translatesAutoresizingMaskIntoConstraints = false
        //self.view.backgroundColor = .systemBackground
       
        NSLayoutConstraint.activate([
            
            self.container.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.container.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.container.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.container.heightAnchor.constraint(equalToConstant: 60),
            
            
            self.searchController.topAnchor.constraint(equalTo: self.container.topAnchor),
            self.searchController.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.searchController.trailingAnchor.constraint(equalTo: self.imageView.leadingAnchor),
            self.searchController.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            self.searchController.heightAnchor.constraint(equalToConstant: 60),
            //self.searchController.widthAnchor.constraint(equalToConstant: 330),
            
            
            self.imageView.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 15),
            self.imageView.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -15),
            //self.imageView.leadingAnchor.constraint(equalTo: self.searchController.trailingAnchor, constant: 10),
            self.imageView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -15),
            self.imageView.heightAnchor.constraint(equalToConstant: 30),
            self.imageView.widthAnchor.constraint(equalToConstant: 30),
            
//            self.scrollView.topAnchor.constraint(equalTo: container.topAnchor, constant: 30),
//            self.scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            self.scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            self.scrollView.heightAnchor.constraint(equalToConstant: 1500),
//            self.scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    
}

// MARK: - Create Layout
extension SearchViewController {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
                
            case .sales(_):
                return self.createSaleSection()
            case .category(_):
                return self.createCategorySection()
            case .example(_):
                return self.createExampleSection()
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
    
    
    
    private func createSaleSection() -> NSCollectionLayoutSection {
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
        section.contentInsets = .init(top: 10, leading: 10, bottom: 30, trailing: 0)
        return section
    }
    
    
    private func createCategorySection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.3),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.1)),
                                                                         subitems: [item])
        group.interItemSpacing = .flexible(10)
        let section = createLayoutsection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 10,
                                          supplementaryItem: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 10, leading: 20, bottom: 60, trailing: 10)
        return section
    }
    
    private func createExampleSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4),
                                                                         heightDimension: .fractionalHeight(0.4)),
                                                                         subitems: [item])
        // - [supplementaryHeaderItem()] -- title top section
        let section = createLayoutsection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 10,
                                          supplementaryItem: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 50, trailing: 0)
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
extension SearchViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .sales(let sale):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as? SaleCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(CategoryName: sale[indexPath.row].title, imageName: sale[indexPath.row].image)
            return cell
            
        case .category(let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(CategoryName: category[indexPath.row].title, imageName: category[indexPath.row].image)
            return cell
            
        case .example(let example):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComingSoomCollectionViewCell", for: indexPath) as? ExampleCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(CategoryName: example[indexPath.row].title, imageName: example[indexPath.row].image)
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

// MARK: - Set Constraints


// MARK: - ViewController
    extension SearchViewController {
        
        private func  setConstraints() {
            
            NSLayoutConstraint.activate([
                
//                orderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
//                orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//                orderButton.heightAnchor.constraint(equalToConstant: 40),
                
                
                // constraints задать от topAnchor
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80), // здесь
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                
            ])
        }
    }







































//
//
////        APICaller.shared.getMovie(with: titleName) { [weak self] result in
////            switch result {
////            case .success(let videoElement):
////                DispatchQueue.main.async {
////                    let vc = TitlePreviewViewController()
////                    vc.configure(with: TitlePreviewViewModel(title: titleName, youtubeView: videoElement, titleOverview: title.overview ?? ""))
////                    self?.navigationController?.pushViewController(vc, animated: true)
////                }
////                
////            case .failure(let error):
////                print(error.localizedDescription)
////            }
////            
////        }
//        
//   
//
//extension SearchViewController: UISearchResultsUpdating {
//    
//    func updateSearchResults(for searchController: UISearchController) {
//        let searchBar = searchController.searchBar
//        guard let query = searchBar.text,
//              !query.trimmingCharacters(in: .whitespaces).isEmpty,
//              query.trimmingCharacters(in: .whitespaces).count >= 3,
//              let resultsController = searchController.searchResultsController as? SearchResultsViewController else {
//            return
//        }
//        resultsController.delegate = self
////        APICaller.shared.search(with: query) { result in
////            DispatchQueue.main.async {
////                switch result {
////                case .success(let titles):
////                    resultsController.titles = titles
////                    resultsController.searchResultsCollectionView.reloadData()
////                case .failure(let error):
////                    print(error.localizedDescription)
////                }
////            }
////            
////        }
//    }
//    func searchResultsViewControllerDidTapItem(_ viewModel: TitlePreviewViewModel) {
//        DispatchQueue.main.async { [weak self] in
//            let vc = TitlePreviewViewController()
//            vc.configure(with: viewModel)
//            
//            self?.navigationController?.pushViewController(vc, animated: true)
//        }
//        
//        
//    }
//}
//
