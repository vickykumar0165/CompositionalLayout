//
//  ViewController.swift
//  CompostionalLayoutBasic
//
//  Created by Vicky Kumar on 20/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mycollectionView: UICollectionView!
    var titlValue:String = "1"
    override func viewDidLoad() {
        super.viewDidLoad()

        mycollectionView.delegate = self
        mycollectionView.dataSource = self
        mycollectionView.register(UINib(nibName: "MyCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MyCollectionReusableView")
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 100, height: 100)
//        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        mycollectionView.collectionViewLayout = layout()
        self.navigationItem.title = titlValue
    }
    
    func layout()->UICollectionViewLayout{
        
        let layout = UICollectionViewCompositionalLayout{(indexSection:Int,environment:NSCollectionLayoutEnvironment)->NSCollectionLayoutSection? in
            
            if indexSection == 0{
                let itemsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .fractionalWidth(1/2))
                let item = NSCollectionLayoutItem(layoutSize: itemsize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/2))
                let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
                
                let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
                let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/2))
                let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: containerGroupSize, subitems: [group1,group2])
                let section = NSCollectionLayoutSection(group: containerGroup)
                section.orthogonalScrollingBehavior = .paging
                section.boundarySupplementaryItems =  [     NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]


                return section


            }else if indexSection == 1{
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(500)), subitem: item, count:10)
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems =  [     NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
                

                return section
            }else if indexSection == 8{
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalWidth(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: item,count: 1)
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 2)
                let item2Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .fractionalWidth(1/2))
                let item2 = NSCollectionLayoutItem(layoutSize: item2Size)
                item2.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 4, trailing: 0)
                let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)), subitem: item2, count: 2)
                let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalWidth(1/2))
                let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: containerGroupSize, subitem: group2, count: 2)
                containerGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 0)
                let mainGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)), subitems: [group,containerGroup])
                mainGroup.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
                let section = NSCollectionLayoutSection(group: mainGroup)
                section.orthogonalScrollingBehavior = .paging
                section.boundarySupplementaryItems =  [     NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
                return section
                
            }else if indexSection == 3{
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
//                let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalWidth(1)), subitems: [item])
//                let item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalWidth(1)))
//                let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/2)), subitems: [item2,item2])
//                let group3 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalWidth(1/2)), subitems: [group2,group2])
//                let container = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/2)), subitems: [group1,group3])
//                let section = NSCollectionLayoutSection(group: container)
//                section.orthogonalScrollingBehavior = .paging
//                let inset: CGFloat = 2.5
//
//                // Items
//                let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
//                let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
//                largeItem.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
//
//                let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
//                let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
//                smallItem.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
//
//                // Nested Group
//                let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1))
//                let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: nestedGroupSize, subitem: smallItem,count:2)
//
//                // Outer Group
//                let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
//                let outerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: outerGroupSize, subitems: [largeItem, nestedGroup, nestedGroup])
//
//                // Section
//                let section = NSCollectionLayoutSection(group: outerGroup)
//                section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
//                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
//
//                return section
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
                let groupItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
                let groupItem = NSCollectionLayoutGroup.horizontal(layoutSize: groupItemSize, subitem: item, count: 1)
                
                let smallitemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
                let smallitem = NSCollectionLayoutItem(layoutSize: smallitemSize)
                smallitem.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

                let smallItemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2))
                let smallItemGroup = NSCollectionLayoutGroup.horizontal(layoutSize: smallItemGroupSize, subitem: smallitem,count: 2)
                
                let biggerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
                let biggerGroup = NSCollectionLayoutGroup.vertical(layoutSize: biggerGroupSize, subitem: smallItemGroup,count: 2)
                
                let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/2))
                let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: containerGroupSize, subitems: [groupItem,biggerGroup])
                containerGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
                
                let section = NSCollectionLayoutSection(group: containerGroup)
                section.orthogonalScrollingBehavior = .paging
                return section
            }
            else{
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(500)), subitem: item, count:10)
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems =  [     NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
                

                return section
            }
            
        }
        return layout
        
    }
    

}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 16
        }else if section == 1{
            return 10
        }
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell else { return UICollectionViewCell() }
        if indexPath.section == 0{
            cell.mylbl.text = "\(indexPath.row + 1)"
            return cell
        }else{
            cell.mylbl.text = "hi \(indexPath.row + 1)"
            return cell
        }

            
        
        
    }
func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

    if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MyCollectionReusableView", for: indexPath) as? MyCollectionReusableView{
        header.myLbl.text = "title \(indexPath.section)"
        return header
    }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewcontroller = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController{
            valueForTitle+=1
            viewcontroller.titlValue = "\(valueForTitle)"
            self.navigationController?.pushViewController(viewcontroller, animated: true)
        }
    }
}

