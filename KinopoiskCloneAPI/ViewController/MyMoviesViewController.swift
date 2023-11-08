//
//  MyMoviesViewController.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 11.10.2023.
//

import UIKit

class MyMoviesViewController: UIViewController {
 
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemBackground
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
    
    private let sections = ModelMyMovies.shared.pageData
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мое"
        view.backgroundColor = .systemBackground
        setupViews()
        setConstraints()
        setDelegate()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        
        collectionView.register(OneCollectionViewCell.self, forCellWithReuseIdentifier: "StoriesCollectionViewCell")
        collectionView.register(TwoCategoryCollectionViewCell.self, forCellWithReuseIdentifier: "PopularCollectionViewCell")
        collectionView.register(ThreeExampleCollectionViewCell.self, forCellWithReuseIdentifier: "ComingSoomCollectionViewCell")
        collectionView.register(HeaderSuplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

// MARK: - Create Layout
extension MyMoviesViewController {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
                
            case .sales2(_):
                return self.createSaleSection()
            case .category2(_):
                return self.createCategorySection()
            case .example2(_):
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
    
    
    // - 1111
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
        section.contentInsets = .init(top: 10, leading: 10, bottom: 30, trailing: 0)
        return section
    }
    
    
    
    // -- 22222
    private func createCategorySection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(0.8)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.4)),
                                                                         subitems: [item])
        group.interItemSpacing = .flexible(10)
        let section = createLayoutsection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 10,
                                          supplementaryItem: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
    
    // -- 33333
    private func createExampleSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(0.9)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.5),
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
extension MyMoviesViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension MyMoviesViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .sales2(let sale):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as? OneCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(CategoryName: sale[indexPath.row].title, imageName: sale[indexPath.row].image)
            return cell
            
        case .category2(let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as? TwoCategoryCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(CategoryName: category[indexPath.row].title, imageName: category[indexPath.row].image)
            return cell
            
        case .example2(let example):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComingSoomCollectionViewCell", for: indexPath) as? ThreeExampleCollectionViewCell
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
    extension MyMoviesViewController {
        
        private func  setConstraints() {
            
            NSLayoutConstraint.activate([
                
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10), // здесь
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                
            ])
        }
    }

