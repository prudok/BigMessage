//
//  MessageBlock.swift
//  BigMessage
//
//  Created by home on 22.05.2023.
//

import SwiftUI

struct MessageBlock: View {
    
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.recieved ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.recieved ? Color("Gray") : Color("Orange"))
                    .cornerRadius(20)
            }
            .frame(maxWidth: 300, alignment: message.recieved ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.recieved ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.recieved ? .leading : .trailing)
        .padding(message.recieved ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        MessageBlock(message: Message(id: "1", text: "None", recieved: false, timestamp: Date()))
    }
}
