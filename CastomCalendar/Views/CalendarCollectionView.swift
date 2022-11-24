//
//  CalendarCollectionView.swift
//  CastomCalendar
//
//  Created by Alexey Gaidykov on 24.11.2022.
//

import UIKit

class CalendarCollectionView: UICollectionView {
    private let collectionLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super .init(frame: frame, collectionViewLayout: collectionLayout)
        
        setupLayout()
        configure()
        setDelegate()
        register(
            CalendarCollectionViewCell.self,
            forCellWithReuseIdentifier: CalendarCollectionViewCell.idCalendarCell
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLayout() {
        collectionLayout.minimumLineSpacing = 3
        collectionLayout.scrollDirection = .horizontal
    }
    private func configure() {
        backgroundColor = .none
        bounces = false
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func setDelegate() {
        delegate = self
        dataSource = self
    }
}

//MARK: Extension - UICollectionViewDataSource
extension CalendarCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CalendarCollectionViewCell.idCalendarCell,
            for: indexPath
        ) as? CalendarCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension CalendarCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tap cell")
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension CalendarCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/7.5, height: collectionView.frame.height)
    }
}
