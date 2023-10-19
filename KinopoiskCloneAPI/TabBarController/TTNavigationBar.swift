//
//  TTNavigationBar.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 17.10.2023.
//

import UIKit

class TTNavigationBar: UINavigationBar {

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 55)
    }

}
