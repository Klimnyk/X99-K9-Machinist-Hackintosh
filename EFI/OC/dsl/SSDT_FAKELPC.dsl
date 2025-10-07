/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * FIXED VERSION - Corrected device-id for X99/C612 chipset (8d47 instead of 9c43)
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000B8 (184)
 *     Revision         0x01
 *     Checksum         0x06
 *     OEM ID           "LPCB"
 *     OEM Table ID     "X99FIX"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 1, "LPCB", "X99FIX", 0x00001000)
{
    External (_SB_.PCI0.LPCB, DeviceObj)

    If (_OSI ("Darwin"))
    {
        Scope (\_SB.PCI0.LPCB)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x06)
                {
                    "device-id", 
                    Buffer (0x04)
                    {
                         0x47, 0x8D, 0x00, 0x00                           // G... (8D47 for C612)
                    }, 

                    "name", 
                    Buffer (0x0D)
                    {
                        "pci8086,8d47"
                    }, 

                    "compatible", 
                    Buffer (0x0D)
                    {
                        "pci8086,8d47"
                    }
                })
            }
        }
    }
}