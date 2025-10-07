/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLOwGEwS.aml, Sun Sep 21 12:46:41 2025
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000008E (142)
 *     Revision         0x02
 *     Checksum         0xD3
 *     OEM ID           "ASLAN"
 *     OEM Table ID     "SataFix"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "ASLAN", "SataFix", 0x00000000)
{
    External (_SB_.PCI0.SAT1, DeviceObj)
    External (_SB_.PCI0.SAT1.PRID, DeviceObj)
    External (_SB_.PCI0.SAT1.SECD, DeviceObj)

    Scope (_SB.PCI0.SAT1)
    {
        Scope (PRID)
        {
            Name (_STA, Zero)  // _STA: Status
        }

        Scope (SECD)
        {
            Name (_STA, Zero)  // _STA: Status
        }
    }
}

