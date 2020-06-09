//
// Created by Настя on 08.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import SwiftUI
import Foundation

struct SearchBar: UIViewRepresentable{
    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate{
        @Binding  var text: String

        init(text: Binding<String>){
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange
        searchText: String){
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) ->
            UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context:
            UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }

}
