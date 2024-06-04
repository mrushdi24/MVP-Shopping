
import UIKit



class HomeVC: UIViewController {

    var shoppingPresenter : ShoppingPresenter!
    
    lazy private var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:  5, left: 5 , bottom: 20, right: 5)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .mainLightGray
        collection.alpha = 0.0
        return collection
    }()
    
     let shoppingCellIdent = "shoppingCellIdent"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        confiqurenavigationBar()
        configureViews()
        addSubViews()
        setupLayoutConstraint()
        configureCollectionView()
        getdata()
    }
    func configureViews(){
        view.backgroundColor = .white
    }
    func addSubViews(){
        view.addSubview(collectionView)
    }
    func confiqurenavigationBar(){
        title = "Products"
      
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    func setupLayoutConstraint(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    func configureCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ShopCollectionCell.self, forCellWithReuseIdentifier: shoppingCellIdent)
    }
    func getdata(){
        shoppingPresenter = ShoppingPresenter(self)
        shoppingPresenter.featchData()
    }
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingPresenter.numberOfRowsInSection()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shoppingCellIdent, for: indexPath) as! ShopCollectionCell
        cell.isSelected = true
        shoppingPresenter.configureCell(cell, for: indexPath.item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemwidth:CGFloat = (view.frame.width - 10) / 2
        return CGSize(width: itemwidth , height:  itemwidth + 80)
    }
}

extension HomeVC : ViewProtocol{
    func fetchDataSucces() {
        collectionView.alpha = 1.0
        collectionView.reloadData()
    }
}
