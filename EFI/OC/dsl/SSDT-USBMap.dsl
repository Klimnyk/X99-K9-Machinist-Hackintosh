/*
 * USB Port Mapping for X99 Machinist K9 via ACPI
 * Replaces USBPorts.kext with SSDT-based USB mapping
 * Compatible with macOS Monterey+ and OpenCore
 * 
 * USB Controllers:
 * - EHC1: 0x8d268086 (USB 2.0 legacy)
 * - EHC2: 0x8d2d8086 (USB 2.0 legacy)  
 * - XHCI: 0x8d318086 (USB 3.0/2.0 primary)
 */
DefinitionBlock ("", "SSDT", 2, "HACK", "USBMap", 0x00001000)
{
    External (_SB_.PCI0.XHCI, DeviceObj)
    External (_SB_.PCI0.EHC1, DeviceObj)
    External (_SB_.PCI0.EHC2, DeviceObj)

    // XHCI USB 3.0/2.0 Controller (Primary)
    If (CondRefOf(\_SB.PCI0.XHCI))
    {
        Scope (\_SB.PCI0.XHCI)
        {
            Method (_DSM, 4, NotSerialized)
            {
                If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
                {
                    Return (Package (0x04)
                    {
                        "port-count", 
                        Buffer (0x04) { 0x16, 0x00, 0x00, 0x00 },  // 22 ports
                        "ports", 
                        Package (0x20)  // 32 elements (16 ports × 2)
                        {
                            "HS01", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x01, 0x00, 0x00, 0x00 }
                            },
                            "HS02", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x02, 0x00, 0x00, 0x00 }
                            },
                            "HS03", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x03, 0x00, 0x00, 0x00 }
                            },
                            "HS04", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x04, 0x00, 0x00, 0x00 }
                            },
                            "HS05", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x05, 0x00, 0x00, 0x00 }
                            },
                            "HS06", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x06, 0x00, 0x00, 0x00 }
                            },
                            "HS07", Package (0x04)
                            {
                                "UsbConnector", 255,    // Internal
                                "port", Buffer (0x04) { 0x07, 0x00, 0x00, 0x00 }
                            },
                            "HS08", Package (0x04)
                            {
                                "UsbConnector", 255,    // Internal
                                "port", Buffer (0x04) { 0x08, 0x00, 0x00, 0x00 }
                            },
                            "HS09", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x09, 0x00, 0x00, 0x00 }
                            },
                            "HS10", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x0A, 0x00, 0x00, 0x00 }
                            },
                            "HS11", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x0B, 0x00, 0x00, 0x00 }
                            },
                            "HS12", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x0C, 0x00, 0x00, 0x00 }
                            },
                            "SS01", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x0D, 0x00, 0x00, 0x00 }
                            },
                            "SS02", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x0E, 0x00, 0x00, 0x00 }
                            },
                            "SS03", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x0F, 0x00, 0x00, 0x00 }
                            },
                            "SS04", Package (0x04)
                            {
                                "UsbConnector", 3,      // USB3 Type-A
                                "port", Buffer (0x04) { 0x10, 0x00, 0x00, 0x00 }
                            }
                        }
                    })
                }
                Return (Zero)
            }
        }
    }

    // EHC1 USB 2.0 Controller
    If (CondRefOf(\_SB.PCI0.EHC1))
    {
        Scope (\_SB.PCI0.EHC1)
        {
            Method (_DSM, 4, NotSerialized)
            {
                If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
                {
                    Return (Package (0x04)
                    {
                        "port-count", 
                        Buffer (0x04) { 0x02, 0x00, 0x00, 0x00 },  // 2 ports
                        "ports", 
                        Package (0x04)
                        {
                            "PR01", Package (0x04)
                            {
                                "UsbConnector", 0,      // Root Hub Port
                                "port", Buffer (0x04) { 0x01, 0x00, 0x00, 0x00 }
                            },
                            "PR11", Package (0x04)
                            {
                                "UsbConnector", 255,    // Internal
                                "port", Buffer (0x04) { 0x02, 0x00, 0x00, 0x00 }
                            }
                        }
                    })
                }
                Return (Zero)
            }
        }
    }

    // EHC2 USB 2.0 Controller
    If (CondRefOf(\_SB.PCI0.EHC2))
    {
        Scope (\_SB.PCI0.EHC2)
        {
            Method (_DSM, 4, NotSerialized)
            {
                If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
                {
                    Return (Package (0x04)
                    {
                        "port-count", 
                        Buffer (0x04) { 0x02, 0x00, 0x00, 0x00 },  // 2 ports
                        "ports", 
                        Package (0x04)
                        {
                            "PR01", Package (0x04)
                            {
                                "UsbConnector", 0,      // Root Hub Port
                                "port", Buffer (0x04) { 0x01, 0x00, 0x00, 0x00 }
                            },
                            "PR12", Package (0x04)
                            {
                                "UsbConnector", 255,    // Internal
                                "port", Buffer (0x04) { 0x02, 0x00, 0x00, 0x00 }
                            }
                        }
                    })
                }
                Return (Zero)
            }
        }
    }
}