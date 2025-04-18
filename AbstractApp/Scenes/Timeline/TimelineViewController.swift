import UIKit

class TimelineViewController: UIViewController, ErrorViewDelegate {

    private var interactor: TimelineInteractor?
    private var timelineView: TimelineView = TimelineView()
    private lazy var errorView: ErrorView = ErrorView()

    override func loadView() {
        self.view = timelineView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Timeline"
        initViper()
        timelineView.didSelectCell = { [weak self] post in
            guard let self = self else { return }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let postDetailVC = storyboard.instantiateViewController(identifier: "postDetail") as? PostDetailViewController {
                postDetailVC.post = post
                self.navigationController?.pushViewController(postDetailVC, animated: true)
            }
        }
        view.addSubview(errorView)
        errorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                errorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                errorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        errorView.isHidden = true
        errorView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.loadTimeline()
        // DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        //      self.displayError(message: "erro mocado")
        // }
    }

    private func initViper() {
        let service = TimelineService()
        let router = TimelineRouter(viewController: self)
        let presenter = TimelinePresenter(viewController: self, router: router)
        interactor = TimelineInteractor(service: service, presenter: presenter)
    }

}

extension TimelineViewController {

    func displayLoading() {
            errorView.isHidden = true
            timelineView.startLoading()
    }

    func displayTimeline(with posts: [Post]) {
        errorView.isHidden = true
        timelineView.showTimeline(posts)
    }

    func didTapRetryButton(in errorView: ErrorView) {
        interactor?.loadTimeline()
    }

    func displayError(message: String) {
        timelineView.hideLoading()
        timelineView.hideTimelineView()
        errorView.configure(message: message)
        errorView.isHidden = false
    }

}
