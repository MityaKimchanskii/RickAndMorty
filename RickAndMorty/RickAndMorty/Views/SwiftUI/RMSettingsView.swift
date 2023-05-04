//
//  RMSettingsView.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 5/3/23.
//

import SwiftUI

struct RMSettingsView: View {
    
    let viewModel: RMSettingsViewViewModel
    
    init(viewModel: RMSettingsViewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.cellViewModels) { viewModel in
            HStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .renderingMode(.template)
                        .foregroundColor(Color(viewModel.iconContainerColor))
                        .colorMultiply(Color(viewModel.iconContainerColor))
                        .frame(width: 45, height: 45)
                }
                
                Text(viewModel.title)
                    .padding(.bottom, 3)
            }
        }
    }
}

struct RMSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        RMSettingsView(viewModel: .init(cellViewModels: RMSettingsOption.allCases.compactMap({
            return RMSettingsCellVeiwModel(type: $0)
        })))
    }
}
