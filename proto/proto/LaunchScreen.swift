//
//  LaunchScreen.swift
//  proto
//
//  Created by 玉川悠真 on 2023/06/17.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct LaunchScreen: View {
    let user = Auth.auth().currentUser
    var ref: DatabaseReference! = Database.database().reference()
    
    @State public var errorMessage = ""
    @State private var err = false
    @State private var isLoading = true
    
    @ObservedObject var communitydata = Communitydata()
    @ObservedObject var usersdata = Usersdata()
    
    
    var body: some View {
        if isLoading {
            ZStack{
                Text("ComMatch")
            }.onAppear() {
                getalldata_onlyonce()
            }.alert(isPresented: $err) {
                Alert(title: Text(errorMessage), dismissButton: .destructive(Text("OK")))
            }
        } else {
            if Auth.auth().currentUser == nil {
                Loginview()
            }else{
                ContentView()
                    .environmentObject(communitydata)
                    .environmentObject(usersdata)
            }
        }
    }
    
    func getalldata_onlyonce() {
        if let user = self.user {
            self.ref.getData(completion: { error, snapshot in
                if error != nil {
                    err.toggle()
                    errorMessage = setErrorMessage(error)
                } else if let value = snapshot?.value as? NSDictionary {
                    usersdata.alldata = value["users"] as! [String : AnyObject]
                    usersdata.mydata = usersdata.alldata["\(user.uid)"] as! [String : AnyObject]
                    communitydata.alldata = value["communities"] as! [String : AnyObject]
                    for key in (usersdata.mydata["communities"] as! [String : AnyObject]).keys {
                        communitydata.belongdata[key] = communitydata.alldata[key]
                    }
                    if let firstKey = communitydata.belongdata.keys.sorted().first, communitydata.focus.isEmpty {
                        communitydata.focus = firstKey
                        withAnimation(){
                            isLoading = false
                        }
                    }
                } else {
                    errorMessage = "Could not parse the snapshot"
                    err.toggle()
                }
            })
        } else {
            errorMessage = "ログインしてください"
            err.toggle()
        }
    }
    
    func getdata() {
        if let user = self.user {
            self.ref.child("users/\(user.uid)/communities").getData(completion: { error, snapshot in
                if error != nil {
                    err.toggle()
                    errorMessage = setErrorMessage(error)
                } else if let value = snapshot?.value as? NSDictionary, let fltrdvalue = (value as? [String: Bool])?.filter({ $1 == true }) {
                    var count = 0
                    for key in fltrdvalue.keys {
                        self.ref.child("communities/\(key)").observe(.value) { snapshot in
                            if error != nil {
                                err.toggle()
                                errorMessage = setErrorMessage(error)
                            } else if let value = snapshot.value as? NSDictionary {
                                communitydata.belongdata[key] = value
                                count += 1
                                if let firstKey = communitydata.belongdata.keys.sorted().first, communitydata.focus.isEmpty && count == fltrdvalue.keys.count{
                                    communitydata.focus = firstKey
                                    isLoading = false
                                }
                            } else {
                                errorMessage = "Could not parse the snapshot"
                                    err.toggle()
                            }
                        }
                    }
                } else {
                    errorMessage = "Could not parse the snapshot"
                    err.toggle()
                }
            })
        } else {
            errorMessage = "ログインしてください"
            err.toggle()
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
