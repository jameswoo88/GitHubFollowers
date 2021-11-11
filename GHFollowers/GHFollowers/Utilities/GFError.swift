//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by James Chun on 11/11/21.
//

import Foundation

enum GFError: String, Error {
    case invalidBaseURL     = "The base URL created an invalid request. Please try again"
    case invalidUsername    = "This username created an invalid request. Please try again"
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
