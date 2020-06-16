//
// Created by Настя on 08.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import SwiftUI
import Foundation

struct SearchBar: UIViewRepresentable{
    @Binding var text: String
    var onChangeFunction: (String) -> ()

    class Coordinator: NSObject, UISearchBarDelegate{
        @Binding var text: String
        var onChangeFunction: (String) -> ()

        init(text: Binding<String>, onChangeFunction: @escaping (String) -> ()){
            _text = text
            self.onChangeFunction = onChangeFunction
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
            text = searchText
            onChangeFunction(searchText);
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
         Coordinator(text: $text, onChangeFunction: onChangeFunction)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context:
            UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }

}
