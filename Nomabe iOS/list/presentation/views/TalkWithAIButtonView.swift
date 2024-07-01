//
//  TalkWithAIView.swift
//  Nomabe iOS
//
//  Created by Piton on 01/07/24.
//

import SwiftUI

struct TalkWithAIButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(systemName: "message.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
    }
}

#Preview {
    TalkWithAIButtonView{
        print("Talk with AI pressed")
    }
}
