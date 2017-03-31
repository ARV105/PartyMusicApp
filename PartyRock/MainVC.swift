//
//  MainVC.swift
//  PartyRock
//
//  Created by Auriel on 3/6/17.
//  Copyright © 2017 Sphexis. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let partyrock1 = PartyRock(imageURL: "https://res.cloudinary.com/nylon/image/upload/w_640,f_auto,q_auto:best,cs_srgb,dpr_auto/featured_images/attachments/000/008/998/Claire_Presspic_1_by_ChristophSchaller_16-9_(1).jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UDNm9siDjWs\"frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Claire Broken Promised Land")
        
        let partyrock2 = PartyRock(imageURL: "http://streamd.hitparade.ch/cdimages/whigfield-saturday_night_s_2.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/8DNQRtmIMxk\"frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Whigfield-Saturday Night")
        
        let partyrock3 = PartyRock(imageURL: "https://images-na.ssl-images-amazon.com/images/I/81xjPeAkjvL._SL1423_.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CEXS4CAXFxE\"frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Donna Summer - I Feel Love (maxi drive mix)")
        
        let partyrock4 = PartyRock(imageURL: "http://www.billboard.com/files/styles/article_main_image/public/media/lmfao-party-rock-anthem-2011-billboard-650.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gZIqW92GaTQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock Commercial")
        
        let partyrock5 = PartyRock(imageURL: "http://direct-ns.rhap.com/imageserver/v2/albums/Alb.219913217/images/600x600.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")
        
        partyRocks.append(partyrock1)
        partyRocks.append(partyrock2)
        partyRocks.append(partyrock3)
        partyRocks.append(partyrock4)
        partyRocks.append(partyrock5)
        
        //let urlTest = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UDNm9siDjWs\"frameborder=\"0\" allowfullscreen></iframe>"
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updatedUI(partyRock: partyRock)
            
            return cell
            
        }else {
            return UITableViewCell()
        }

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }


}

