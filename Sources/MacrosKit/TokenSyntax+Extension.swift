//
//  TokenSyntax+Extension.swift
//
//
//  Created by Joe Maghzal on 08/06/2024.
//

import SwiftSyntax

public enum AccessLevel {
    public static var allCases: [TokenSyntax] {
        return [
            .keyword(.public),
            .keyword(.package),
            .keyword(.internal),
            .keyword(.private),
            .keyword(.fileprivate),
            .keyword(.open)
        ]
    }
}
