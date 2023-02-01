
import UIKit
import SafariServices
import Combine

class FrameworkDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
//    @Published var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "")
    
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    var subsciptions = Set<AnyCancellable>()
    let framework = CurrentValueSubject<AppleFramework, Never>(AppleFramework(name: "기존 데이터", imageName: "", urlString: "", description: ""))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        updateUI()
        
        bind()
    }
    
    private func bind() {
        // input : Button 클릭
        // framework -> url -> present
        
        buttonTapped // publisher
            .receive(on: RunLoop.main)
            .compactMap { URL(string: $0.urlString)}
            .sink { [unowned self] url in
                let safari = SFSafariViewController(url: url)
                present(safari, animated: true)
            }.store(in: &subsciptions)
        
        
        // output : Data 세팅 될때 UI 업데이트
        framework
            .receive(on: RunLoop.main)
            .sink { framework in
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
            }.store(in: &subsciptions)
        
    }
    
//    func updateUI() {
//        imageView.image = UIImage(named: framework.imageName)
//        titleLabel.text = framework.name
//        descriptionLabel.text = framework.description
//    }
    
    
    @IBAction func learnMoreTapped(_ sender: Any) {
        
        buttonTapped.send(framework.value)
        
//        guard let url = URL(string: framework.urlString) else {
//            return
//        }
//
//        let safari = SFSafariViewController(url: url)
//
//        present(safari, animated: true)
    }
}
