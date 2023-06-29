//
//  DialogBoxNode.swift
//  MC2
//
//  Created by Muhammad Rizki Ardyan on 24/06/23.
//

import SpriteKit

class DialogBoxNode: SKShapeNode {
    
    var nameLabel: SKLabelNode?
    
    var promptLabel: SKLabelNode?
    
    var isShowing: Bool = false
    
    private var isTypingPrompt: Bool = false
    
    func start(dialog: Dialog, from scene: SKScene) {
        guard isShowing == false else { return }
        
        clearLabelText()
        removeAllActions()
        
        if self.scene == nil {
            scene.addChild(self)
        }
        
        let startDialog = SKAction.group([
            changeNameLabelAction(for: dialog),
            promptTypingAction(for: dialog)
        ])
        
        run(startDialog)
    }
    
    func startSequence(dialogs: [Dialog], from scene: SKScene, withInterval interval: TimeInterval = 1.0, completion: @escaping (() -> Void) = { }) {
        guard isShowing == false else { return }
        
        clearLabelText()
        removeAllActions()
        
        if self.scene == nil {
            scene.addChild(self)
        }
        
        let intervalAction = SKAction.wait(forDuration: interval)
        
        var actions = [SKAction]()
        
        for (index, dialog) in dialogs.enumerated() {
            let startDialog = SKAction.group([
                changeNameLabelAction(for: dialog),
                promptTypingAction(for: dialog)
            ])
            actions.append(contentsOf: [
                startDialog,
                intervalAction
            ])
            
            if index < dialogs.count - 1 {
                actions.append(contentsOf: [
                    clearNameLabelTextAction(),
                    clearPromptLabelTextAction()
                ])
            }
        }
        
        let completionAction = SKAction.run {
            completion()
            self.removeFromParent()
        }
        
        actions.append(completionAction)
        
        let sequenceAction = SKAction.sequence(actions)
        
        run(sequenceAction)
    }
    
    func changeNameLabelAction(for dialog: Dialog) -> SKAction {
        guard let nameLabel else { fatalError() }
        return SKAction.run {
            nameLabel.text = dialog.name ?? .emptyString
        }
    }
    
    func promptTypingAction(for dialog: Dialog) -> SKAction {
        guard let promptLabel else { fatalError() }
        
        let startTyping = SKAction.run {
            self.isTypingPrompt = true
        }
        
        let characters = Array(dialog.prompt)
        var characterIndex = 0
        let typingEachCharacter = SKAction.run {
            promptLabel.text?.append(characters[characterIndex])
            characterIndex += 1
        }
        let typingDelay = SKAction.wait(forDuration: 0.05)
        let typingPerCharacter = SKAction.sequence([typingEachCharacter, typingDelay])
        let repeatedTyping = SKAction.repeat(typingPerCharacter, count: characters.count)
        
        let endTyping = SKAction.run {
            self.isTypingPrompt = false
        }
        
        return SKAction.sequence([startTyping, repeatedTyping, endTyping])
    }
    
    func skipTyping() {
        guard isTypingPrompt == true else { return }
        // TODO: Create method to skip typing animation.
    }
    
    func hide() {
        guard isTypingPrompt == false else { return }
        removeFromParent()
        isShowing = false
        clearLabelText()
    }
    
    func handleTouch(on touchLocation: CGPoint) {
        if contains(touchLocation) == true {
            // Skip `dialogBox` typing animation if running.
            skipTyping()
        }
        hide()
    }
    
    private func clearLabelText() {
        nameLabel?.text = .emptyString
        promptLabel?.text = .emptyString
    }
    
    private func clearPromptLabelTextAction() -> SKAction {
        SKAction.run {
            self.promptLabel?.text = .emptyString
        }
    }
    
    private func clearNameLabelTextAction() -> SKAction {
        SKAction.run {
            self.nameLabel?.text = .emptyString
        }
    }
}
