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


    private let calendarCollectionView = CalendarCollectionView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrains()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(calendarCollectionView)
        view.addSubview(prevWeakButton)
        view.addSubview(nextWeakButton)
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
            calendarCollectionView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
