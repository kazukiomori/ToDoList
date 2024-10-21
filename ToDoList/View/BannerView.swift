//
//  BannerView.swift
//  ToDoList
//
//  Created by Kazuki Omori on 2023/02/26.
//

import SwiftUI
import UIKit
import GoogleMobileAds

struct AdMobBannerView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: GADAdSizeBanner)
        // 諸々の設定
        banner.adUnitID = "ca-app-pub-9554476195266174/3204342942"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
      // メソッドだけ用意
    }
}
