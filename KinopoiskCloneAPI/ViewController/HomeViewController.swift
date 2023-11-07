//
//  ViewController.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 09.10.2023.
//

import UIKit

enum Sections: Int {
    
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Uncoming = 3
}


class HomeViewController: UIViewController, UICollectionViewDelegate {

    var cells = [ModelBabyNew]()
    
    private var randomTrendingMovie: Title?
    private var headerView: HeroHeaderUIView?
    
    //MARK: Заголовки разделов массив
    let sectionTitles: [String] = ["Trending Movies", "Trending Tv", "Popular", "Uncoming Movies"]
    
    
    private lazy var layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: "StoryCellID")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCellID")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    
    

    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
     
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .systemBackground
        navigationController?.navigationBar.isTranslucent = false
        //title = "Главное"
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        self.setupview()
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
//configureNavBar()
        
        headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: -50, width: view.bounds.width, height: 600))
        homeFeedTable.tableHeaderView = headerView
        
     
        configureHeroHeaderView()
    }
    
   
    private func setupview() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.collectionView)

        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),

            self.collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),

            self.collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),

            self.collectionView.heightAnchor.constraint(equalToConstant: 60),

        ])
    }
    
    private func configureHeroHeaderView() {
        
//        APICaller.shared.getTrendingMovies { [weak self] result in
//            switch result {
//            case .success(let titles):
//                let selectedTitle = titles.randomElement()
//                
//                self?.randomTrendingMovie = selectedTitle
//                self?.headerView?.configure(with: TitleViewModel(titleName: selectedTitle?.original_title ?? "", posterURL: selectedTitle?.poster_path ?? ""))
//                
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    
    
    private func configureNavBar() {
        var image = UIImage(named: "kinopoisk")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       
      
        homeFeedTable.frame = view.bounds
    }
       
    func set(cells: [ModelBabyNew]) {
        self.cells = cells
    }
    
    }


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // добавляет загрузку контента в секции
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        
        
//        switch indexPath.section {
//        case Sections.TrendingMovies.rawValue:
            
//            APICaller.shared.getTrendingMovies { result in
//                switch result {
//                case .success(let titles):
//                    cell.configure(with: titles)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
          //  }
            
            
       // case Sections.TrendingTv.rawValue:
            
//            APICaller.shared.getTrendingTvs { result in
//                switch result {
//                case .success(let titles):
//                    cell.configure(with: titles)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
       //     }
            
//        case Sections.Popular.rawValue:
//            
//            APICaller.shared.getPopular { result in
//                switch result {
//                case .success(let titles):
//                    cell.configure(with: titles)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
            
//        case Sections.Uncoming.rawValue:
//            
//            APICaller.shared.getUpcomingMovies { result in
//                switch result {
//                case .success(let titles):
//                    cell.configure(with: titles)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//            
//        case Sections.TopRated.rawValue:
//            
//            APICaller.shared.getTopRated { result in
//                switch result {
//                case .success(let titles):
//                    cell.configure(with: titles)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//            
//        default:
//            return UITableViewCell()
//        }
//        
        return cell
    }
    // height sections
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // расстояние между секциями
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    //MARK: добавляется шрифт, размер и цвет надписям к заголовкам
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(
            x: header.bounds.origin.x + 20,
            y: header.bounds.origin.y,
            width: 100,
            height: header.bounds.height)
        header.textLabel?.textColor = .white

        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    //MARK: добавили секции с массива к каждому заголовку
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    //MARK: Скрытие верхней панели
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultoffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultoffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
}

extension HomeViewController: CollectionViewTableViewCellDelegate {
    
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel) {
        DispatchQueue.main.async { [weak self] in
            let vc = TitlePreviewViewController()
            vc.configure(with: viewModel)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}




extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
       // cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCellID", for: indexPath) as? StoryCell
                
        else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCellID", for: indexPath)
            //cell.nameLabel.text = cells[indexPath.row].babyTextLabel2
        }
            //cell.setup()
            return cell
        }
    }

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 80, height: 40)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

}



