//
//  Recycle.swift
//  SmartRecycle
//
//  Created by Crystal Chan on 9/1/2024.
//

//MARK: Source Code follow to Youtube "Simple CardView Screen Design in SwiftUI" https://www.youtube.com/watch?v=af1KHNuSCUA&list=WL&index=13

import Foundation

struct Recycle: Hashable{
    let image: String
    let title: String
    let stitle: String
    let desc: String
}

let recycles = [
    Recycle(image: "Metal", title: "Metal", stitle: "Cleaning Recycling", desc: "Remove non-metal parts. Empty and rinse metal containers."),
    Recycle(image: "Paper", title: "Paper", stitle: "Cleaning Recycling", desc: "Tear off plastic tape, remove non-paper materials and keep dry. Tear off plastic coated pages of books and magazine."),
    Recycle(image: "Plastic", title: "Plastic", stitle: "Cleaning Recycling", desc: "Bottles: Rinse before recycling. Other Plastics: Keep clean and dry."),
    Recycle(image: "GlassBottles", title: "Glass Bottles", stitle: "Cleaning Recycling", desc: "1. remove cap  2.empty content  3.rinse briskly 4. place in the recycling bin gently"),
    Recycle(image: "RechargeableBattery", title: "Rechargeable Battery", stitle: "How to Recycle", desc: "Remove the rechargeable battery from the equipment. For safety reason, cover the battery terminal with masking tape to prevent contact between terminals or other metal surfaces during storage and transport. Do not put damaged rechargeable batteries into the collection boxes. For batteries that are vulnerable to damage, put them in plastic bag (e.g. reuse the packaging of new batteries) and seal them with adhesive tape before deposit. Bring the battery to a Collection Point for recycling. For operational considerations, the collection box may not be able to be placed in a prominent location of a Collection Point. Please approach the front-line staff or the manager of the respective Collection Point for details."),
    Recycle(image: "SmallElectricalAppliances", title: "Small Electrical Appliances", stitle: "How to Recycle", desc: "If the unwanted small electrical appliances are still in good working condition, donate them together with accessories such as remote controls or chargers to a charity organisation or transfer them to others at online platforms. For communication devices, you are strongly advised to remove all the personal information stored within the devices first."),
    Recycle(image: "RegulatedElectricalEquipment", title: "Small Electrical Appliances", stitle: "How to Recycle", desc: "If the unwanted regulated electrical equipment (REE) is still working, donate the REE together with accessories such as remote controls to a charity organisation or transfer them to others at online platforms. Before Recycling of Waste REE (regulated WEEE): Remove all belongings inside refrigerators and washing machines. The regulated WEEE must stand alone, free from any installations, connections or obstructions to facilitate removal. Keep the regulated WEEE clean and tidy. For computers, you are strongly advised to remove all the personal information stored within the devices first."),
    Recycle(image: "FluorescentLampsandTubes", title: "Fluorescent Lamps and Tubes", stitle: "How to Recycle", desc: "Place the used lamps in a packaging (e.g. reuse the packaging of new lamps); For broken lamps, put them in a plastic bag and seal them with adhesive tape before deposit; Remember to protect yourself with disposable rubber gloves and take precautions when cleaning up broken lamps; Bring the properly wrapped lamps to a Collection Point for recycling.")
    
    
    
    
    
    
            
]
