/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL5kqZLQ.aml, Sun Sep 21 12:46:52 2025
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000054 (84)
 *     Revision         0x02
 *     Checksum         0xA2
 *     OEM ID           "ACDT"
 *     OEM Table ID     "UNC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200528 (538969384)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "UNC", 0x00000000)
{
    External (_SB_.UNC0, DeviceObj)
    External (PRBM, IntObj)

    Scope (_SB.UNC0)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            PRBM = Zero
        }
    }
}

