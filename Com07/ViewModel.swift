//
//  ViewModel.swift
//  Com07
//
//  Created by cmStudent on 2022/07/02.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    
    
    @Published var leftanimate = false
    @Published var centeranimate = false
    @Published var rightanimate = false
    
    
    @Published var lebaname = "rebab"
    
    var lebaabool = false
    var lebacount = 0
    
  
    
    
    func lebachenge() {
        self.lebaname = "rebaa"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation {
                self.lebaname = "rebab"
            }
    }
    }
    
    public func leftroll() {
        withAnimation(Animation.default.repeatForever()) {
            self.leftanimate.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
                self.leftanimate.toggle()
            }
        }
        return
    }
    
    public func centerroll() {
        withAnimation(Animation.default.repeatForever()) {
            self.centeranimate.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
                self.centeranimate.toggle()
            }
        }
        return
    }
    
    public func rightroll() {
        withAnimation(Animation.default.repeatForever()) {
            self.rightanimate.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
                self.rightanimate.toggle()
            }
        }
        return
    }
    
    
    
    
}

