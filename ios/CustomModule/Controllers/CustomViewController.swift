import UIKit
import Alamofire

public class CustomViewController: UIViewController {

    // Create a label to display the response
    private let responseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // Allow multiple lines for response text
        return label
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Add the responseLabel to the view
        view.addSubview(responseLabel)

        // Layout the responseLabel
        NSLayoutConstraint.activate([
            responseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            responseLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        // Example Alamofire request
        AF.request("https://api.example.com/data").responseJSON { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let data):
                // Update the responseLabel text with the response data
                DispatchQueue.main.async {
                    self.responseLabel.text = "Response: \(data)"
                }
            case .failure(let error):
                // Update the responseLabel text with the error message
                DispatchQueue.main.async {
                    self.responseLabel.text = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}

