//
//  DeclSyntaxProtocol+Extensions.swift
//
//
//  Created by Joe Maghzal on 29/06/2024.
//

import SwiftSyntax

extension DeclSyntaxProtocol {
    public var typeName: TokenSyntax? {
        if let declaration = self.as(StructDeclSyntax.self) {
            return declaration.name
        }
        if let declaration = self.as(ClassDeclSyntax.self) {
            return declaration.name
        }
        if let declaration = self.as(ActorDeclSyntax.self) {
            return declaration.name
        }
        if let declaration = self.as(EnumDeclSyntax.self) {
            return declaration.name
        }
        if let declaration = self.as(ProtocolDeclSyntax.self) {
            return declaration.name
        }
        
        return nil
    }
}
