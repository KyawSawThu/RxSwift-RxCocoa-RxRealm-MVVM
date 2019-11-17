//
//  ErrorResponse.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation

struct ErrorResponse: Codable {
    public let code: Int
    public let message: String
}
