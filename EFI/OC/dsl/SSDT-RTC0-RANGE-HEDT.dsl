/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLUXQPxK.aml, Sun Sep 21 12:46:30 2025
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000C20 (3104)
 *     Revision         0x02
 *     Checksum         0x40
 *     OEM ID           "DRTNIA"
 *     OEM Table ID     "RtcRange"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200528 (538969384)
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "RtcRange", 0x00001000)
{
    External (_SB_.PC00, DeviceObj)
    External (_SB_.PC00.LPC0.RTC0, DeviceObj)
    External (_SB_.PC00.LPC0.RTC_, DeviceObj)
    External (_SB_.PC00.LPC_.RTC0, DeviceObj)
    External (_SB_.PC00.LPC_.RTC_, DeviceObj)
    External (_SB_.PC00.LPCB.RTC0, DeviceObj)
    External (_SB_.PC00.LPCB.RTC_, DeviceObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.LPC0.RTC0, DeviceObj)
    External (_SB_.PCI0.LPC0.RTC_, DeviceObj)
    External (_SB_.PCI0.LPC_.RTC0, DeviceObj)
    External (_SB_.PCI0.LPC_.RTC_, DeviceObj)
    External (_SB_.PCI0.LPCB.RTC0, DeviceObj)
    External (_SB_.PCI0.LPCB.RTC_, DeviceObj)
    External (_SB_.PCI0.SBRG.RTC0, DeviceObj)
    External (_SB_.PCI0.SBRG.RTC_, DeviceObj)
    External (_SB_.PCI0.LPC0.RTC._STA, MethodObj)
    External (_SB_.PCI0.LPC0.RTC0._STA, MethodObj)
    External (_SB_.PCI0.LPC_.RTC._STA, MethodObj)
    External (_SB_.PCI0.LPC_.RTC0._STA, MethodObj)
    External (_SB_.PCI0.LPCB.RTC._STA, MethodObj)
    External (_SB_.PCI0.LPCB.RTC0._STA, MethodObj)
    External (_SB_.PCI0.SBRG.RTC._STA, MethodObj)
    External (_SB_.PCI0.SBRG.RTC0._STA, MethodObj)
    External (_SB_.PC00.LPC0.RTC._STA, MethodObj)
    External (_SB_.PC00.LPC0.RTC0._STA, MethodObj)
    External (_SB_.PC00.LPC_.RTC._STA, MethodObj)
    External (_SB_.PC00.LPC_.RTC0._STA, MethodObj)
    External (_SB_.PC00.LPCB.RTC._STA, MethodObj)
    External (_SB_.PC00.LPCB.RTC0._STA, MethodObj)

    If (CondRefOf (\_SB.PCI0.LPC0.RTC))
    {
        Device (\_SB.PCI0.LPC0.RTC1)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PCI0.LPC0.RTC._STA))
        {
            Scope (\_SB.PCI0.LPC0.RTC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.LPC0.RTC0))
    {
        Device (\_SB.PCI0.LPC0.RTC2)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PCI0.LPC0.RTC0._STA))
        {
            Scope (\_SB.PCI0.LPC0.RTC0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.LPC.RTC))
    {
        Device (\_SB.PCI0.LPC.RTC1)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PCI0.LPC.RTC._STA))
        {
            Scope (\_SB.PCI0.LPC.RTC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.LPC.RTC0))
    {
        Device (\_SB.PCI0.LPC.RTC2)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PCI0.LPC.RTC0._STA))
        {
            Scope (\_SB.PCI0.LPC.RTC0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.LPCB.RTC))
    {
        Device (\_SB.PCI0.LPCB.RTC1)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PCI0.LPCB.RTC._STA))
        {
            Scope (\_SB.PCI0.LPCB.RTC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.LPCB.RTC0))
    {
        Device (\_SB.PCI0.LPCB.RTC2)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PCI0.LPCB.RTC0._STA))
        {
            Scope (\_SB.PCI0.LPCB.RTC0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.SBRG.RTC))
    {
        Device (\_SB.PCI0.SBRG.RTC1)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PCI0.SBRG.RTC._STA))
        {
            Scope (\_SB.PCI0.SBRG.RTC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.SBRG.RTC0))
    {
        Device (\_SB.PCI0.SBRG.RTC2)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PCI0.SBRG.RTC0._STA))
        {
            Scope (\_SB.PCI0.SBRG.RTC0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PC00.LPC0.RTC))
    {
        Device (\_SB.PC00.LPC0.RTC3)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PC00.LPC0.RTC._STA))
        {
            Scope (\_SB.PC00.LPC0.RTC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PC00.LPC0.RTC0))
    {
        Device (\_SB.PC00.LPC0.RTC4)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PC00.LPC0.RTC0._STA))
        {
            Scope (\_SB.PC00.LPC0.RTC0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PC00.LPC.RTC))
    {
        Device (\_SB.PC00.LPC.RTC3)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PC00.LPC.RTC._STA))
        {
            Scope (\_SB.PC00.LPC.RTC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PC00.LPC.RTC0))
    {
        Device (\_SB.PC00.LPC.RTC4)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PC00.LPC.RTC0._STA))
        {
            Scope (\_SB.PC00.LPC.RTC0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PC00.LPCB.RTC))
    {
        Device (\_SB.PC00.LPCB.RTC3)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PC00.LPCB.RTC._STA))
        {
            Scope (\_SB.PC00.LPCB.RTC)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    If (CondRefOf (\_SB.PC00.LPCB.RTC0))
    {
        Device (\_SB.PC00.LPCB.RTC4)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,             // Range Minimum
                    0x0070,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IO (Decode16,
                    0x0074,             // Range Minimum
                    0x0074,             // Range Maximum
                    0x01,               // Alignment
                    0x04,               // Length
                    )
                IRQNoFlags ()
                    {8}
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        If (!CondRefOf (\_SB.PC00.LPCB.RTC0._STA))
        {
            Scope (\_SB.PC00.LPCB.RTC0)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }
}

