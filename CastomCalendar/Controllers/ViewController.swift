//
//  ViewController.swift
//  CastomCalendar
//
//  Created by Alexey Gaidykov on 24.11.2022.
//

import UIKit

class ViewController: UIViewController {
    private let prevWeakButton = CalendarMoveButton(imageName: "chevron.backward")
    private let nextWeakButton = CalendarMoveButton(imageName: "chevron.forward")
    private let prevMonthLabel = MonthLabel()
    private let nextMonthLabel = MonthLabel(alignment: .right)
    
    private let calendarMode = CalendarModel()
    
    private var centreData = Date()

    private let calendarCollectionView = CalendarCollectionView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        calendarCollectionView.scrollToItem(
            at: [0, 10],
            at: .centeredHorizontally,
            animated: false
        )
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrains()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white
        
        updateData(day: 0)
        calendarCollectionView.calendarDelegate = self
        view.addSubview(calendarCollectionView)
        
        prevWeakButton.addTarget(self, action: #selector(prevWeakButtonTapped), for: .touchUpInside)
        nextWeakButton.addTarget(self, action: #selector(nextWeakButtonTapped), for: .touchUpInside)
        view.addSubview(prevWeakButton)
        view.addSubview(nextWeakButton)
        
        view.addSubview(prevMonthLabel)
        view.addSubview(nextMonthLabel)
    }
    @objc private func prevWeakButtonTapped() {
        calendarCollectionView.scrollToItem(at: [0, 3], at: .centeredHorizontally, animated: true)
    }
    
    @objc private func nextWeakButtonTapped() {
        calendarCollectionView.scrollToItem(at: [0, 17], at: .centeredHorizontally, animated: true)
    }
    
    private func updateData(day offset: Int) {
        centreData = centreData.getDay(with: offset)
        let daysArray = calendarMode.getWeeksForCalendar(date: centreData)
        
        calendarCollectionView.setDaysArray(daysArray)
        calendarCollectionView.reloadData()
        calendarCollectionView.scrollToItem(at: [0, 10], at: .centeredHorizontally, animated: false)
        
        prevMonthLabel.text = daysArray[7].monthName.changeCharEnd()
        nextMonthLabel.text = daysArray[13].monthName.changeCharEnd()
    }
}
//MARK: - CalendarProtocol
extension ViewController: CalendarProtocol {
    func maxOffsetLeft() {
        updateData(day: -7)
    }
    
    func maxOffsetRight() {
        updateData(day: 7)
    }
}

//MARK: - Set Constrains
extension ViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            prevWeakButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            prevWeakButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            prevWeakButton.heightAnchor.constraint(equalToConstant: 60),
            prevWeakButton.widthAnchor.constraint(equalToConstant: 40),
            
            nextWeakButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nextWeakButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            nextWeakButton.heightAnchor.constraint(equalToConstant: 60),
            nextWeakButton.widthAnchor.constraint(equalToConstant: 40),
            
            calendarCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            calendarCollectionView.leadingAnchor.constraint(equalTo: prevWeakButton.trailingAnchor, constant: 5),
            calendarCollectionView.trailingAnchor.constraint(equalTo: nextWeakButton.trailingAnchor, constant: -5),
            calendarCollectionView.heightAnchor.constraint(equalToConstant: 60),
            
            
            prevMonthLabel.topAnchor.constraint(equalTo: nextWeakButton.bottomAnchor, constant: 5),
            prevMonthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            
            nextMonthLabel.topAnchor.constraint(equalTo: nextWeakButton.bottomAnchor, constant: 5),
            nextMonthLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
}
