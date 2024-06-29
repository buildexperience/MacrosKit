//
//  DeclSyntaxProtocol+Extensions.swift
//
//
//  Created by Joe Maghzal on 29/06/2024.
//

import SwiftSyntax

extension DeclSyntaxProtocol {
    public var declaration: DeclarationSyntax? {
        if let declaration = self.as(StructDeclSyntax.self) {
            return declaration
        }
        if let declaration = self.as(ClassDeclSyntax.self) {
            return declaration
        }
        if let declaration = self.as(ActorDeclSyntax.self) {
            return declaration
        }
        if let declaration = self.as(EnumDeclSyntax.self) {
            return declaration
        }
        if let declaration = self.as(ProtocolDeclSyntax.self) {
            return declaration
        }
        
        return nil
    }
    public var typeName: TokenSyntax? {
        guard let declaration = declaration as? DeclarationSyntax else {
            return nil
        }
        return declaration.name
    }
    
    public var accessLevel: AccessLevel? {
        guard let declaration = declaration as? DeclarationSyntax else {
            return nil
        }
        return declaration.accessLevel
    }
}
