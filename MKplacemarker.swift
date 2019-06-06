//
//  MKplacemarker.swift
//  ticketInPocket
//
//  Created by Parth Patel on 6/6/19.
//  Copyright © 2019 Parth Patel. All rights reserved.
//

import Foundation
import MapKit
import Contacts

extension MKPlacemark {
    var formattedAddress: String? {
        guard let postalAddress = postalAddress else { return nil }
        return CNPostalAddressFormatter.string(from: postalAddress, style: .mailingAddress).replacingOccurrences(of: "\n", with: " ")
    }
}
