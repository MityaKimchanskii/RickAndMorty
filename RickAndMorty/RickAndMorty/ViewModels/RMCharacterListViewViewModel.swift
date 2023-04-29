//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/27/23.
//

import UIKit

final class RMCharacterListViewViewModel: NSObject {
    
    func fetchCharacters() {
        RMService.shared.execute(.listCharacters, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                print(error)
                print(error.localizedDescription)
            }
        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.id, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
            return UICollectionViewCell()
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Dima", characterStatus: .alive, characterImageUrl: nil)
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width*1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

