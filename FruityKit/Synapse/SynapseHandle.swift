//
//  Synapse.swift
//  FruityKit
//

/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA
 *
 * Should you need to contact me, the author, you can do so by
 * e-mail - Eduardo Almeida <hello [_at_] edr [_dot_] io>
 */

import Foundation

/// A protocol that driver handles can conform to.
public protocol SynapseHandle {
    
    associatedtype SynapseMode
    
    /// The USB identifier of the device.
    var usbId: Int32 { get }
    
    /// The connection status of the device.
    var connected: Bool { get }
    
    /// Reads data from the device.
    func read()
    
    /// Writes data to the device.
    ///
    /// - Parameters:
    ///     - mode: The mode to be written to the device.
    func write(mode: SynapseMode) -> Bool
}

extension SynapseHandle {
    
    public var connected: Bool {
        dq_check_device_connected(Int32(usbId))
    }
}
