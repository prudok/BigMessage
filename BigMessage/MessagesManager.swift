//
//  MessagesManager.swift
//  BigMessage
//
//  Created by home on 22.05.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error: couldn't get documents \(String(describing: error))")
                return
            }
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error: \(error)")
                    return nil
                }
                
            }
            self.messages.sort { $0.timestamp < $1.timestamp }
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    func sendMessage(text: String) {
        if text.isEmpty {
            return
        }
        
        do {
           let newMessage = Message(id: "\(UUID())", text: text, recieved: false, timestamp: Date())
            try db.collection("messages").document().setData(from: newMessage)
            
        } catch {
            print("Error: \(error)")
        }
    }
    
}
