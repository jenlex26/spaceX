//
//  socialNetworksCell.swift
//  Buro parlamentario
//
//  Created by Javier Hernandez on 25/03/21.
//

import UIKit

class socialNetworksCell: UITableViewCell {

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    var dataShips : LaunchPastQuery.Data.LaunchesPast?
    var animator: (LayoutAttributesAnimator, Bool, Int, Int)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView?.isPagingEnabled = true
        let layout = AnimatedCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.animator = ParallaxAttributesAnimator()
        collectionView.collectionViewLayout = layout
    }
    
    func reloadCollection(){
        collectionView.reloadData()
    }
}

extension socialNetworksCell:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataShips?.ships?.count ?? 0
   }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: socialNetworksCollectionCell.identifier, for: indexPath) as! socialNetworksCollectionCell
                cell.socialNetworkImg.imageFromServerURL(urlString: dataShips?.ships?[indexPath.row]?.image ?? "")
                cell.nameShips.text = dataShips?.ships?[indexPath.row]?.name
                return cell
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 400, height: 250)
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return .zero
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 0
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 0
   }
}
