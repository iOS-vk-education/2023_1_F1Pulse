import UIKit

class NewsItem {
    let title: String
    let description: String
    let image: UIImage
    
    init(title: String, description: String, image: UIImage) {
        self.title = title
        self.description = description
        self.image = image
    }
}

class NewsCollectionViewCell: UICollectionViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(photoImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            photoImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            photoImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with newsItem: NewsItem) {
        titleLabel.text = newsItem.title
        descriptionLabel.text = newsItem.description
        photoImageView.image = newsItem.image
    }
}

class NewsController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let newsItems: [NewsItem] = [
        NewsItem(title: "Заголовок новости 1", description: "Описание новости 1", image: UIImage(named: "12")!),
                     NewsItem(title: "Заголовок новости 2", description: "Описание новости 2", image: UIImage(named: "12")!),
                    NewsItem(title: "Заголовок новости 2", description: "Описание новости 2", image: UIImage(named: "12")!),
                    NewsItem(title: "Заголовок новости 2", description: "Описание новости 2", image: UIImage(named: "12")!),
                    NewsItem(title: "Заголовок новости 2", description: "Описание новости 2", image: UIImage(named: "12")!),
                    NewsItem(title: "Заголовок новости 2", description: "Описание новости 2", image: UIImage(named: "12")!),
                    NewsItem(title: "Заголовок новости 2", description: "Описание новости 2", image: UIImage(named: "12")!),
                    NewsItem(title: "Заголовок новости 2", description: "Описание новости 2", image: UIImage(named: "12")!),
                    NewsItem(title: "Заголовок новости 2", description: "Описание новости 2", image: UIImage(named: "12")!),
                    NewsItem(title: "Заголовок новости 2", description: "Описание новости 2", image: UIImage(named: "12")!),
                     NewsItem(title: "Заголовок новости 3", description: "Описание новости 3", image: UIImage(named: "12")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        let newsItem = newsItems[indexPath.item]
        cell.configure(with: newsItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 250)
    }
}

