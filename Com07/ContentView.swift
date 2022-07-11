//
//  ContentView.swift
//  Com07
//
//  Created by cmStudent on 2022/07/02.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var lebamodel = ViewModel()
    
    @State private var leftnumber:Int = Int.random(in: 1...5)
    @State private var centernumber:Int = Int.random(in: 1...5)
    @State private var rightnumber:Int = Int.random(in: 1...5)
    
    @State private var sssxVal: CGFloat = 0.0
    @State private var sssyVal: CGFloat = 0.0
    @State private var rellxVal: CGFloat = 0.0
    @State private var rellyVal: CGFloat = 0.0
    @State private var rebaxVal: CGFloat = 0.0
    @State private var rebayVal: CGFloat = 0.0
    @State private var lvxVal: CGFloat = 0.0
    @State private var lvyVal: CGFloat = 0.0
    @State private var cvxVal: CGFloat = 0.0
    @State private var cvyVal: CGFloat = 0.0
    @State private var rvxVal: CGFloat = 0.0
    @State private var rvyVal: CGFloat = 0.0
    
    

    // (1)
    var leftrequester = PassthroughSubject<Void,Never>()
    var centerrequester = PassthroughSubject<Void,Never>()
    var rightrequester = PassthroughSubject<Void,Never>()
    var body: some View {
        ZStack {
           
            
        
        ZStack {
            
            
            Image("sss")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400, height: 190)
                .offset(x: sssxVal, y: sssyVal - 250)
            
            Image("rell")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 150)
                .offset(x: rellxVal - 20, y: rellyVal)
            
            Image(lebamodel.lebaname)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 150)
                .offset(x: rebaxVal + 185, y: rebayVal - 30)
            
            
           
            
            
                
        VStack {
            HStack {
                // (2)
                LeftView($leftnumber, leftrequester.eraseToAnyPublisher())
                    .offset(x: lvxVal - 39 , y: lvyVal + 103)
                
                CenterView($centernumber, centerrequester.eraseToAnyPublisher())
                    .offset(x: cvxVal - 22 , y: cvyVal + 103)
                
                rightView($rightnumber, rightrequester.eraseToAnyPublisher())
                    .offset(x: rvxVal - 2 , y: rvyVal + 103)
            }
            
     
           
            
            Button(action: {
                
                lebamodel.lebachenge()
                
                self.leftrequester.send()
                self.centerrequester.send()
                self.rightrequester.send()
                
                
               

            }, label: {
                Image("lebab")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 200)
                    .offset(x: rebaxVal + 190, y: rebayVal - 280)
            }).offset(x: rebaxVal + 190, y: rebayVal - 100)
        }
        } // ZStackの終わり
        }
    }//終点
}

struct LeftView: View {
    let leftsrott = Srott()
    @ObservedObject var leftmodel = ViewModel()
    @Binding var leftnumber:Int
    let publisher:AnyPublisher<Void,Never>
    
    init(_ leftnumber:Binding<Int>, _ requester:AnyPublisher<Void,Never>) {
        self._leftnumber = leftnumber
        self.publisher = requester
    }
    
    var body: some View {
        VStack {
            Image("\(leftnumber)")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
           
        }
        // (3)
        .onReceive(publisher) { () in
            self.roll()
        }
    }
    public func roll() {
        leftmodel.leftroll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation {
                self.leftnumber = Int.random(in: 1...5)
                leftsrott.shortPlay()
            }
        }
        return
    }
}

struct CenterView: View {
    let centersrott = Srott()
    @ObservedObject var centermodel = ViewModel()
    @Binding var centernumber:Int
    let publisherr:AnyPublisher<Void,Never>
    
    
    init(_ centernumber:Binding<Int>, _ requesterr:AnyPublisher<Void,Never>) {
        self._centernumber = centernumber
        self.publisherr = requesterr
    }
    
    var body: some View {
        VStack {
            Image("\(centernumber)")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
        }
        // (3)
        .onReceive(publisherr) { () in
            self.roll()
        }
    }
    public func roll() {
        centermodel.centerroll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation {
                self.centernumber = Int.random(in: 1...5)
                centersrott.shortPlay()
            }
        }
        return
    }
}

struct rightView: View {
    let rightsrott = Srott()
    @ObservedObject var rightmodel = ViewModel()
    @Binding var rightnumber:Int
    let publisherrr:AnyPublisher<Void,Never>
    
    
    init(_ rightnumber:Binding<Int>, _ requesterrr:AnyPublisher<Void,Never>) {
        self._rightnumber = rightnumber
        self.publisherrr = requesterrr
    }
    
    var body: some View {
        VStack {
            Image("\(rightnumber)")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            
        }
        // (3)
        .onReceive(publisherrr) { () in
            self.roll()
        }
    }
    public func roll() {
        rightsrott.longPlay()
        rightmodel.rightroll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
                self.rightnumber = Int.random(in: 1...5)
                rightsrott.longStop()
                rightsrott.shortPlay()
            }
        }
        return
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

