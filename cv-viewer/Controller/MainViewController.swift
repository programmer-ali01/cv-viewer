//
//  ViewController.swift
//  cv-viewer
//
//  Created by Alisena Mudaber on 9/17/22.
//

import UIKit

class MainViewController: UIViewController {
    
    enum MenuState {
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed
    
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    
    
    
    lazy var headerVC = HeadlineViewController()
    lazy var summaryVC = SummaryViewController()
    lazy var projectsVC = ProjectsViewController()
    lazy var skillsVC = SkillsViewController()
    lazy var educationVC = EducationViewController()
    lazy var experienceVC = ExperienceViewController()
    
    
    
    
    var navVC: UINavigationController?
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.backgroundColor = .red
        
        addChildViewControllers()
    }
    
    private func addChildViewControllers() {
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
    
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }


}

// MARK: - HomeViewControllerDelegate

extension MainViewController: HomeViewControllerDelegate {
    func didTapMenuButton() {
        toggleMenuButton(completion: nil)
        
    }
    
    func toggleMenuButton(completion: (() -> Void)?) {
        // animate
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut) {
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 110
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opened
                }
            }

        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut) {
                self.navVC?.view.frame.origin.x = 0
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
}

// MARK: - MenuViewControllerDelegate

extension MainViewController: MenuViewControllerDelegate {
    func didSelect(menuItem: MenuOptions) {
        toggleMenuButton(completion: nil)
        switch menuItem {
        case .home:
            self.resetToHome()
        case .header:
         
            addViewController(vc: headerVC)
        case .summary:
       
            addViewController(vc: summaryVC)
        case .projects:
       
            addViewController(vc: projectsVC)
        case .skills:
       
            addViewController(vc: skillsVC)
        case .education:
       
            addViewController(vc: educationVC)
        case .experience:
            addViewController(vc: experienceVC)
        }
    }
    
    // MARK: - Helper functions
    func resetToHome() {
        for view in homeVC.children {
            removeFromSuperviews(view: view)
        }
        homeVC.title = "Home"
    }
    
    func addViewController(vc: UIViewController) {
          let vc = vc
          homeVC.addChild(vc)
          homeVC.view.addSubview(vc.view)
          vc.view.frame = view.frame
          vc.didMove(toParent: self)
          homeVC.title = vc.title
    }

    func removeFromSuperviews(view: UIViewController) {
        view.view.removeFromSuperview()
        view.didMove(toParent: nil)
    }
    
}

