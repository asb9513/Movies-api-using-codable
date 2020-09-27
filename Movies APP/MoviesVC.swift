//
//  MoviesVC.swift
//  Movies APP
//
//  Created by Ahmed Saeed on 9/5/20.

import UIKit

class MoviesVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var HomeTV: UICollectionView!
    
    var MoviesArray = [Result]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        HomeTV.delegate = self
        HomeTV.dataSource = self
        loadMovies()
    }
   
    
    func loadMovies(){
        NetworkApi.sendRequest(method: .get, url: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed", completion:
            
            {(err,response: Movies?) in
                
                if err == nil{
                    guard let data = response.self else{return}
                    self.MoviesArray = data.results;
                    self.HomeTV.reloadData()
                    
                }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MoviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.name.text = MoviesArray[indexPath.row].title
        DispatchQueue.main.async {
            cell.configure(movies: self.MoviesArray[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier:"show", sender: MoviesArray[indexPath.row])
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let des = segue.destination as? DetailsViewController
        {
            if let movie = sender as? Result{
                des.movie = movie
            }
            
        }
    }
    
    
}
