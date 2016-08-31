//
//  DisconnectMessage.swift
//  Mixpanel
//
//  Created by Yarden Eitan on 8/26/16.
//  Copyright © 2016 Mixpanel. All rights reserved.
//

import Foundation

class DisconnectMessage: BaseWebSocketMessage {

    init() {
        super.init(type: "disconnect")
    }

    override func responseCommand(connection: WebSocketWrapper) -> Operation? {
        let operation = BlockOperation { [weak connection] in
            guard let connection = connection else {
                return
            }

            connection.connected = false
            connection.close()
        }
        return operation
    }

}