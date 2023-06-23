//
//  AnimationComponent.swift
//  MC2
//
//  Created by Muhammad Rizki Ardyan on 15/06/23.
//

import SpriteKit
import GameplayKit

class AnimationComponent: GKComponent {
    
    var characterVisualComponent: CharacterVisualComponent
    
    init(characterVisualComponent: CharacterVisualComponent) {
        self.characterVisualComponent = characterVisualComponent
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate(for state: AnimationState, timePerFrame time: TimeInterval = 0.2, withKey key: String) {
        guard let textures = characterVisualComponent.textures[state], textures.count > 1 else {
            fatalError("Entity must have more than one texture to be animated")
        }
        let animationAction = SKAction.animate(with: textures, timePerFrame: time)
        let repeatedAnimation = SKAction.repeatForever(animationAction)
        characterVisualComponent.node.run(repeatedAnimation, withKey: key)
    }
    
    func removeAllAnimations() {
        characterVisualComponent.node.removeAllActions()
    }
}
