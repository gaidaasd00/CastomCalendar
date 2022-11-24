//
//  CalendarCollectionViewCell.swift
//  CastomCalendar
//
//  Created by Alexey Gaidykov on 24.11.2022.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    private let dayOfWeekLabel: UILabel = {
        let label = UILabel()
        label.text = "ЧТ"
        label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfDayLabel: UILabel = {
        let label = UILabel()
        label.text = "10"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let idCalendarCell = "idCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layer.cornerRadius = 10
        backgroundColor = .red
        
        addSubview(dayOfWeekLabel)
        addSubview(numberOfDayLabel)
    }
}

//MARK: - Set constrains CalendarCollectionViewCell
extension CalendarCollectionViewCell {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            numberOfDayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            numberOfDayLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
