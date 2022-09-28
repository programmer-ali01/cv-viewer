//
//  SkillsViewController.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/19/22.
//

import UIKit

class SkillsViewController: UIViewController {
    
    var skillsData = [String]()
    
    let tableView = UITableView()
    let cellID = "cellID"
    
    let skillsManager: SkillsManageable = SkillsManager()
    var skills: Skills?
    
    let hvc = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
        tableViewSetup()
        fetchData()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Skills"
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
          tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
          tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
          tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }

    private func tableViewSetup() {
        tableView.register(SkillView.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    private func fetchData() {
        skillsManager.fetchSkills { result in
            switch result {
            case .success(let skills):
                self.skills = skills
                self.skillsData = skills.skills
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                self.hvc.displayError(error)
            }
        }
    }
}

extension SkillsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skillsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SkillView
            
        let skillCell = skillsData[indexPath.row]
        
        let vm = SkillsViewModel(skillLabel: skillCell)
        cell.populateLabel(viewModel: vm)
        return cell
    }
}

