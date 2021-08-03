//
//  MainMenuView.swift
//  NewMainMenu
//
//  Created by Ильгам Ахматдинов on 02.08.2021.
//

import Foundation
import UIKit

class MainMenuView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionCategoryView.dataSource = self
        collectionCategoryView.delegate = self
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: SUB VIEWS
    
    private let mainView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let whiteTopSpace: UIView = {
        let space = UIView()
        space.backgroundColor = .white
        space.translatesAutoresizingMaskIntoConstraints = false
        return space
    }()
    
    private let topBarView: UIView = {
        let top = UIView()
        top.backgroundColor = .white
        top.translatesAutoresizingMaskIntoConstraints = false
        return top
    }()
    
    private let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Поиск франшизы"
        bar.searchTextField.backgroundColor = .white
        bar.layer.borderWidth = 1
        bar.layer.borderColor = UIColor.white.cgColor
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    private let menuButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "menuList"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let chooseCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите категорию"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let selfInvestmentLabel: UILabel = {
        let label = UILabel()
        label.text = "Или свои инвестиции"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let collectionCategoryView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 80, height: 122)
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//        view.backgroundColor = UIColor(named: "backgroungColor")
        view.backgroundColor = .white
        
        
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   // MARK: FUNCTIONS
    private func setupViews() {
        self.addSubview(mainView)
        mainView.addSubview(whiteTopSpace)
        mainView.addSubview(topBarView)
        mainView.addSubview(chooseCategoryLabel)
        topBarView.addSubview(searchBar)
        topBarView.addSubview(menuButton)
        mainView.addSubview(collectionCategoryView)
        mainView.addSubview(selfInvestmentLabel)
        
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            whiteTopSpace.topAnchor.constraint(equalTo: mainView.topAnchor),
            whiteTopSpace.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor),
            whiteTopSpace.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            whiteTopSpace.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            topBarView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor),
            topBarView.heightAnchor.constraint(equalToConstant: 56),
            topBarView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            topBarView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            menuButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            menuButton.leadingAnchor.constraint(equalTo: topBarView.leadingAnchor, constant: 19),
            menuButton.heightAnchor.constraint(equalToConstant: 14),
            menuButton.widthAnchor.constraint(equalToConstant: 18),
        ])
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topBarView.topAnchor),
            searchBar.bottomAnchor.constraint(equalTo: topBarView.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: menuButton.trailingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: topBarView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            chooseCategoryLabel.topAnchor.constraint(equalTo: topBarView.bottomAnchor, constant: 16),
            chooseCategoryLabel.heightAnchor.constraint(equalToConstant: 22),
            chooseCategoryLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            chooseCategoryLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            collectionCategoryView.topAnchor.constraint(equalTo: chooseCategoryLabel.bottomAnchor, constant: 8),
            collectionCategoryView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            collectionCategoryView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            collectionCategoryView.heightAnchor.constraint(equalToConstant: 139)
        ])
        NSLayoutConstraint.activate([
            selfInvestmentLabel.topAnchor.constraint(equalTo: collectionCategoryView.bottomAnchor, constant: 16.5),
            selfInvestmentLabel.heightAnchor.constraint(equalToConstant: 22),
            selfInvestmentLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            selfInvestmentLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16)
        ])
    }
    
}

extension MainMenuView: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped on item \(indexPath.row)")
    }
}