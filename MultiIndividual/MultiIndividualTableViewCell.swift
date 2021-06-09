//
//  MultiIndividualTableViewCell.swift
//  MultiIndividual
//
//  Created by Anas AbuZaitoun on 09/06/2021.
//

import UIKit

class MultiIndividualTableViewCell: UITableViewCell {

    @IBOutlet weak var container: UIView!
    var done: Bool!
    let width = UIScreen.main.bounds.width * (50/370)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with urls: [String]) {
        var local = urls
        while !local.isEmpty {
            var fours = Array(local.prefix(4))
            local = Array(local.dropFirst(4))
            done = local.isEmpty
            buildContainers(urls: fours)
            
        }
    }
    
    func buildContainers(urls: [String]) -> UIView {
        let view = UIView()
        
        var previous: UIView?
        for (index, url) in urls.enumerated() {
            let label = makeView()
            
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            if let prev = previous {
                prev.rightAnchor.constraint(equalTo: label.leftAnchor).isActive = true
                label.leftAnchor.constraint(equalTo: prev.rightAnchor).isActive = true
            } else {
                label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            }
            if index == urls.count - 1 {
                label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            }
            previous = label
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        if container.subviews.isEmpty {
            container.addSubview(view)
            view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
            
        }
        else {
            container.addSubview(view)
            container.subviews.first!.bottomAnchor.constraint(equalTo: view.topAnchor).isActive = true
            view.topAnchor.constraint(equalTo: container.subviews.first!.bottomAnchor).isActive = true
//            view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
            
        }
        
        view.rightAnchor.constraint(greaterThanOrEqualTo: container.rightAnchor, constant: 8).isActive = true
        view.leftAnchor.constraint(greaterThanOrEqualTo: container.leftAnchor, constant: 8).isActive = true
        view.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        view.backgroundColor = .red
        view.widthAnchor.constraint(equalToConstant: width*CGFloat(urls.count)).isActive = true
        view.heightAnchor.constraint(equalToConstant: width).isActive = true
        return view
    }
    func makeView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.heightAnchor.constraint(equalToConstant: width).isActive = true
        view.widthAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        view.layer.cornerRadius = width/2
        view.backgroundColor = .white
        
        return view
    }
}
