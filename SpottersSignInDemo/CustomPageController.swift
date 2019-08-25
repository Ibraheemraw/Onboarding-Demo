import UIKit

class CustomPageController: UIPageViewController {
    //MARK: - Properties & Outlets
    private lazy var orderedViewControllers: [UIViewController] = {
        return [self.newPhaseController(onboardingPhase: "One"),
                self.newPhaseController(onboardingPhase: "Two"),
                self.newPhaseController(onboardingPhase: "Three"),
                self.newPhaseController(onboardingPhase: "Four"),
                self.newPhaseController(onboardingPhase: "Five")]
    }()
    var pageControl = UIPageControl()
    var startIndex: Int?
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }
    //MARK: - Methods and Actions
    private func newPhaseController(onboardingPhase phase: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Phase\(phase)Controller")
    }

    private func callMethods(){
        setupVCSettings()
    }

    private func setupVCSettings(){
        dataSource = self
        startIndex = 0
        guard let startIndex = startIndex else { return }
        setPageViewDirection(controllers: orderedViewControllers, index: startIndex)
    }

    private func setPageViewDirection(controllers: [UIViewController], index: Int){
        let firstViewController = controllers[index]
        setViewControllers([firstViewController],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }

    private func configPageControl(){
        pageControl = UIPageControl(frame: CGRect(x: 0, y: Int(UIScreen.main.bounds.maxY - 70), width: Int(UIScreen.main.bounds.width), height: 50))
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .clear
        self.view.addSubview(pageControl)
    }
}

extension CustomPageController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }

        guard orderedViewControllers.count > previousIndex else {
            return nil
        }

        return orderedViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let nextIndex = viewControllerIndex + 1

        let orderedViewControllersCount = orderedViewControllers.count

        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }

        guard orderedViewControllersCount > nextIndex else {
            return nil
        }

        return orderedViewControllers[nextIndex]
    }
}

extension CustomPageController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentVC = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentVC)!
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let startIndex = startIndex else {return 0}
        return startIndex
    }
}
