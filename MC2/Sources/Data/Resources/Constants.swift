//
//  Constants.swift
//  MC2
//
//  Created by Muhammad Rizki Ardyan on 24/06/23.
//

import Foundation

struct Constants {
    // Configs
    static let fontName = "Scribble-Regular"
    
    // Game infos
    static let gameTitle = "Me...Mory...Me"
    static let mainCharacterName = "Mory"
    static let momName = "Mom"
    static let bartenderName = "Bartender"
    
    // Game scenes
    static let titleScene = "TitleScene"
    static let mainRoomScene = "MainRoomScene"
    static let officeRoomScene = "OfficeRoomScene"
    static let bedroomMessyScene = "BedroomMessyScene"
    static let bedroomTidyScene = "BedroomTidyScene"
    static let barScene = "BarScene"
    static let hospitalScene = "HospitalScene"
    static let inputPasswordScene = "InputPasswordScene"
    static let matchingNumberScene = "MatchingNumberScene"
    static let photoAlbumScene = "PhotoAlbumScene"
    static let photoAlbumSecondScene = "PhotoAlbumGameSecondScene"
    static let radioScene = "RadioScene"
    static let crashQTEScene = "CrashQTEScene"
    
    // Snapshots
    static let officeSnapshotsScene = "OfficeSnapshotsScene"
    static let bedroomSnapshotsScene = "BedroomSnapshots"
    static let barSnapshotsScene = "BarSnapshots"
    
    // Snapsht - Office
    static let acceptNode = "acceptNode"
    static let declineNode = "declineNode"
    
    // Default node names
    static let background = "background"
    static let overlayWrapper = "overlayWrapper"
    
    // Action keys
    static let walkingAction = "walking"
    static let idleAction = "idle"
    static let layAction = "lay"
}

extension String {
    static let emptyString = ""
    
    // Error text
    static let initCoderNotImplemented = "init(coder:) has not been implemented"
    static let errorNodeNotFound = "error: node not found"
    static let errorTextureNotFound = "error: texture not found"
    static let errorPhysicsBodyNotFound = "error: physics body not found"
    
    func splitIdentifer(with separator: String = "_") -> [String.SubSequence] {
        return self.split(separator: separator)
    }
}
