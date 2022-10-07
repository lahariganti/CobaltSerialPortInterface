import ArgumentParser
import SwiftSerial
import Foundation

struct CobaltSPI: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "A Swift command-line tool to interact with a serial port", subcommands: [Read.self])
    init() { }
}

CobaltSPI.main()

struct Read: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Read input from serial port")

	@Argument
	private var portName: String

    func run() throws {
		let serialPort: SerialPort = SerialPort(path: self.portName)

		do {
			print("Attempting to open port: \(self.portName)")
    		try serialPort.openPort()
			print("Serial port \(portName) opened successfully.")

			// defer {
			// 	serialPort.closePort()
			// 	print("Port Closed")
			// }

			serialPort.setSettings(receiveRate: .baud9600, transmitRate: .baud9600, minimumBytesToRead: 1)

			let data = try serialPort.readData(ofLength: 100)
			print(data)
		} catch {
			print(error)
		}
    }
}
