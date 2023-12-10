//
//  RacesController.swift
//  F1_pulse
//
//  Created by Dmitrii Tenshov on 28.11.2023.
//

import UIKit

class RacesController: UIViewController {
    
    var raceResults: [DriverResult] = []
    var racesResults: [RacesResults] = []
    
    var cellWidth: CGFloat = 0
    var cellHeight: CGFloat = 0
    var selectedCellIndexPath: IndexPath?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RaceCollectionViewCell.self, forCellWithReuseIdentifier: RaceCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RaceTableViewCell.self, forCellReuseIdentifier: RaceTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Races"
        setUpData()
        setUpCollectionView()
        setUpTableView()
        
        select(row: 0)
        updateTableView(with: 0)
    }
    
    private func setUpData() {
        for i in 0..<10 {
            
            var raceResult: [DriverResult] = []

            for j in 0..<20 {
                let result = DriverResult(position: j + 1, driver: "Driver \(i)", time: "1:30:00", points: j)
                raceResult.append(result)
            }

            let racesResult = RacesResults(name: "Race \(i)", race: raceResult)
            racesResults.append(racesResult)
        }
    }
}

extension RacesController {
    fileprivate func setUpCollectionView() {
        cellWidth = view.frame.width / 1.5
        cellHeight = 150
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
            collectionView.heightAnchor.constraint(equalToConstant: cellHeight),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    fileprivate func setUpTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Add column headers
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        
        let headerLabels = ["Position", "Driver", "Time", "Points"]
        var xOffset: CGFloat = 0
        
        for label in headerLabels {
            let labelWidth = view.frame.width / CGFloat(headerLabels.count)
            let headerLabel = UILabel(frame: CGRect(x: xOffset, y: 0, width: labelWidth, height: 50))
            headerLabel.text = label
            headerLabel.textAlignment = .center
            headerLabel.font = UIFont.boldSystemFont(ofSize: 16)
            headerView.addSubview(headerLabel)
            
            xOffset += labelWidth
        }
        
        tableView.tableHeaderView = headerView
    }
}


extension RacesController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return racesResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RaceCollectionViewCell.identifier,
            for: indexPath
        ) as! RaceCollectionViewCell
        
        cell.configure(with: racesResults[indexPath.row].name)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: cellWidth,
            height: cellHeight
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        select(row: indexPath.row)
        updateTableView(with: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = view.frame.width/2 - (cellWidth/2)
        return UIEdgeInsets(
            top: 0,
            left: inset,
            bottom: 0,
            right: inset
        )
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            scrollToCell()
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
         scrollToCell()
    }
}

extension RacesController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RaceTableViewCell.identifier, for: indexPath) as! RaceTableViewCell

        let result = raceResults[indexPath.row]
        cell.configure(with: "\(result.position)", with: result.driver, with: result.time, with: "\(result.points)")

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func updateTableView(with raceIndex: Int) {
        guard raceIndex >= 0, raceIndex < racesResults.count else {
            return
        }

        let raceResult = racesResults[raceIndex].race
        raceResults = raceResult
        tableView.reloadData()
    }

}

extension RacesController {
    /// Scrolls to selected cell
    /// - Parameters:
    ///   - row: Item index
    ///   - section: Row index
    ///   - animated: Animated boolean
    public func select(
        row: Int,
        in section: Int = 0,
        animated: Bool = true
    ) {
        // Ensures selected row isnt more then data count
        guard row < racesResults.count else { return }
        
        // removes any selected items
        cleanupSelection()
        
        // set new selected item
        let indexPath = IndexPath(row: row, section: section)
        selectedCellIndexPath = indexPath
        
        // Update selected cell
        let cell = collectionView.cellForItem(at: indexPath) as? RaceCollectionViewCell
        cell?.configure(
            with: racesResults[indexPath.row].name,
            isSelected: true
        )
        updateTableView(with: indexPath.row)
        
        collectionView.selectItem(
            at: indexPath,
            animated: animated,
            scrollPosition: .centeredHorizontally)
    }
    
    
    /// Cleans up prior highlighted selection
    private func cleanupSelection() {
        guard let indexPath = selectedCellIndexPath else { return }
        let cell = collectionView.cellForItem(at: indexPath) as? RaceCollectionViewCell
        cell?.configure(with: racesResults[indexPath.row].name)
        selectedCellIndexPath = nil
    }
    
    /// Scrolls to visible cell based on `scrollViewDidEndDragging` or `scrollViewDidEndDecelerating` delegate functions
    private func scrollToCell() {
        var indexPath = IndexPath()
        var visibleCells = collectionView.visibleCells
        
        /// Gets visible cells
        visibleCells = visibleCells.filter({ cell -> Bool in
            let cellRect = collectionView.convert(
                cell.frame,
                to: collectionView.superview
            )
            /// Calculate if at least 50% of the cell is in the boundaries we created
            let viewMidX = view.frame.midX
            let cellMidX = cellRect.midX
            let topBoundary = viewMidX + cellRect.width/2
            let bottomBoundary = viewMidX - cellRect.width/2
            
            /// A print state representating what the return is calculating
            return topBoundary > cellMidX  && cellMidX > bottomBoundary
        })
        
        /// Appends visible cell index to `cellIndexPath`
        visibleCells.forEach({
            if let selectedIndexPath = collectionView.indexPath(for: $0) {
                indexPath = selectedIndexPath
            }
        })
        
        let row = indexPath.row
        // Disables animation on the first and last cell
        if row == 0 || row == racesResults.count - 1 {
            self.select(row: row, animated: false)
            return
        }
        self.select(row: row)
        
    }
    
}



