//
//  UIActivityController.swift
//  CodeAddict
//
//  Created by Mikolaj Zelichowski on 11/12/2020.
//

import UIKit

struct ActivityController {
    static func share(title: String, message: String, url: URL) -> UIActivityViewController {
        let formattedMessage = "\n\(message)"
        let objectToShare = [title, formattedMessage, url] as [Any]
        let activityController = UIActivityViewController(activityItems: objectToShare, applicationActivities: nil)
        activityController.setValue(title, forKey: "Subject")
        return activityController
        }
    }
