//
//  PostView.swift
//  SwiftUI-Fetch-Post-Learn
//
//  Created by Subhrajyoti Chakraborty on 26/10/20.
//

import SwiftUI

struct PostView: View {
    var postBody: String
    var postTitle: String
    
    var body: some View {
        Section {
            Text("\(postBody)")
        }
        .navigationBarTitle(Text("\(postTitle)"), displayMode: .inline)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(postBody: "dksd", postTitle: "sad")
    }
}
