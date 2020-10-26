//
//  ContentView.swift
//  SwiftUI-Fetch-Post-Learn
//
//  Created by Subhrajyoti Chakraborty on 26/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var posts: [Post] = []
    
    func loadPosts() {
        print("load post called!!")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let decodedData = try? JSONDecoder().decode([Post].self, from: data) {
                    DispatchQueue.main.async {
                        self.posts = decodedData
                    }
                }
                return
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(posts, id: \.id) { post in
                    NavigationLink(
                        destination: PostView(postBody: post.body, postTitle: post.title),
                        label: {
                            Text("\(post.title)")
                        })
                }}
                .navigationBarTitle(Text("Posts"))
                .onAppear(perform: {
                    loadPosts()
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
