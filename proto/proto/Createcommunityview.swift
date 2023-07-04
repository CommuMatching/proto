//
//  Createcommunityview.swift
//  proto
//
//  Created by 玉川悠真 on 2023/05/29.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth

struct Createcommunityview: View {
    enum Field {
        case CommunityName
        case Region
        case Contents
    }
    @State var comname: String = ""
    @State var region: String = "北海道"
    @State var contents: String = ""
    @State public var errorMessage = ""
    @FocusState private var focusedField: Field?
    @State private var err = false
    @State private var createcom = false
    
    let MaxChar = 200
    @State private var totalChars = 0
    @State private var notecount = ""
    
    var ref: DatabaseReference! = Database.database().reference()
    let user = Auth.auth().currentUser
    
    var body: some View {
        VStack(spacing: 50) {
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("コミュニティ名")
                        .foregroundColor(.TextColor)
                        .padding(.leading, 8)
                    TextFieldwithClearButton(placeholder: "〜クラブ", text: $comname)
                        .focused($focusedField, equals: .CommunityName)
                        .textfieldframe(linewid: (focusedField == .CommunityName) ? 4.0 : 2.0)
                }
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("活動地域")
                        .foregroundColor(.TextColor)
                        .padding(.leading, 8)
                    Picker("region", selection: $region, content: {
                                        ForEach(Pref, id:\.self) { value in
                                            Text("\(value)")
                                        }
                                    })
                    .tint(.TextColor)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                            .stroke(Color.blue, lineWidth: 2.0)
                    ).padding(8.0)
                }
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("活動内容")
                        .foregroundColor(.TextColor)
                        .padding(.leading, 8)
                    TextEditor(text: $contents)
                        .frame(height: 170)
                        .focused($focusedField, equals: .Contents)
                        .toolbar {
                            ToolbarItem(placement: .keyboard) {
                                HStack {
                                    Button("Close") {
                                        self.focusedField = nil
                                    }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            }
                        }
                        .textfieldframe(linewid: (focusedField == .Contents) ? 4.0 : 2.0)
                        .onChange(of: contents, perform: {notecount in totalChars = contents.count})
                        .onChange(of: contents, perform: { value in
                            if value.count > MaxChar {
                                contents.removeLast(contents.count - MaxChar)
                            }
                        })
                }
            }
            Button(
                action: {
                    self.focusedField = nil
                    if let user = self.user {
                        DispatchQueue.main.async {
                            createcom.toggle()
                        }
                        guard let key = ref.child("communities").childByAutoId().key else { return }
                        let sanitizedComname = comname.rplcingInvldFirebaseKeyChars()
                        let sanitizedContents = contents.rplcingInvldFirebaseKeyChars()
                        self.ref.updateChildValues([
                            "communities/\(key)": [
                                "name": sanitizedComname,
                                "region": self.region,
                                "contents": sanitizedContents
                            ],
                            "community-members/\(key)/\(user.uid)": true,
                            "users/\(user.uid)/communities/\(key)": true
                        ])
                    } else {
                        err.toggle()
                        errorMessage = "ログインしてください"
                    }
                }, label:{
                    Text("作  成")
                        .decisionbutton(isable: !(comname.isEmpty || contents.isEmpty))
                }).alert(isPresented: $err) {
                    Alert(title: Text(errorMessage), dismissButton: .destructive(Text("OK")))
                }.disabled(comname.isEmpty || contents.isEmpty)
                .navigationDestination(isPresented: $createcom, destination: {
                    ContentView()
                })
        }
    }
}

struct Createcommunityview_Previews: PreviewProvider {
    static var previews: some View {
        Createcommunityview()
    }
}

extension String {
    func rplcingInvldFirebaseKeyChars() -> String {
        return self
            .replacingOccurrences(of: "/", with: "-")
            .replacingOccurrences(of: ".", with: "-")
            .replacingOccurrences(of: "#", with: "-")
            .replacingOccurrences(of: "$", with: "-")
            .replacingOccurrences(of: "[", with: "-")
            .replacingOccurrences(of: "]", with: "-")
    }
}
