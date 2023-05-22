//
//  TitleRow.swift
//  BigMessage
//
//  Created by home on 22.05.2023.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80")
    var name = "Sara Smith"
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                 ProgressView()
            }
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 27))
                    .fontWeight(.bold)
                Text("Online")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                
            }
            Spacer()
            Image(systemName: "phone.fill")
                .padding(.all, 10)
                .background(.white)
                .foregroundColor(.gray)
                .font(.system(size: 25))
                .cornerRadius(20)
                .padding(.trailing, 25)
                
        }
        .padding(.leading, 25)
        .padding(.vertical, 20)
        .background(Color("Orange"))
        
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            
    }
}
