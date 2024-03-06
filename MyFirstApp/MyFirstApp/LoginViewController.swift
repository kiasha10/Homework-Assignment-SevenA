//
//  LoginViewController.swift
//  MyFirstApp
//
//  Created by Kiasha Rangasamy on 2024/03/05.
//

    
    import UIKit
    import CommonCrypto

    class LoginViewController: UIViewController {

        // ... your existing code ...

        @IBAction func loginButton(_ sender: UIButton) {
            // Gets username and password from text fields
            guard let username = usernameTextField.text, !username.isEmpty,
                  let password = passwordTextField.text, !password.isEmpty else {
                
                showAlert(message: "Please enter both username and password.")
                return
            }

            // Hash the password before comparing
            let hashedPassword = hashStringSHA256(password)

            // Replace the following line with your actual login logic
            if isValidCredentials(username: username, hashedPassword: hashedPassword) {
                // Successful login, navigate to the next screen
                navigateToNextScreen()
            } else {
                // Invalid credentials, show an alert
                showAlert(message: "Invalid username or password.")
            }
        }

        // Update the function signature to include hashedPassword
        func isValidCredentials(username: String, hashedPassword: String) -> Bool {
            // Compare with hashed credentials
            return username == "your_username" && hashedPassword == hashStringSHA256("your_password")
        }

        // ... your existing code ...

        // Function to hash a string using SHA-256
        func hashStringSHA256(_ string: String) -> String {
            if let data = string.data(using: String.Encoding.utf8) {
                var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
                _ = data.withUnsafeBytes {
                    CC_SHA256($0.baseAddress, CC_LONG(data.count), &digest)
                }
                return Data(digest).map { String(format: "%02hhx", $0) }.joined()
            }
            return ""
        }
    }



