# Copilot Instructions - X99 Hackintosh Project

## Project Overview
This is a **Hackintosh configuration repository** for the **X99 Machinist K9** motherboard with **Intel Xeon E5-2660v4** CPU and **AMD RX580 GPU**. The project provides a complete OpenCore EFI setup for running macOS on this specific hardware configuration.

## Primary Reference Sources (CRITICAL)

### Official Documentation Priority
**ALWAYS consult these sources FIRST** when configuring or troubleshooting:

1. **Primary Guide**: [Dortania OpenCore Install Guide](https://dortania.github.io/getting-started/)
   - **Use for**: Initial setup, platform-specific configurations, troubleshooting
   - **Coverage**: Complete installation workflow, hardware compatibility, common issues
   - **Priority**: Primary reference for all configuration decisions

2. **OpenCore Configuration Reference**: Version-specific Configuration.pdf
   - **Current Version**: [OpenCore 1.0.5 Configuration.pdf](https://github.com/acidanthera/OpenCorePkg/blob/1.0.5/Docs/Configuration.pdf)
   - **Use for**: Detailed config.plist parameter explanations, quirks documentation
   - **Version Matching**: Always use the PDF that matches your OpenCore version
   - **Priority**: Authoritative source for all config.plist settings

### Reference Workflow
1. **First**: Check Dortania guide for general approach and X99-specific guidance
2. **Second**: Validate speci        fic config.plist settings against OpenCore Configuration.pdf
3. **Third**: Apply hardware-specific customizations documented in this repository
4. **Last**: Use community sources only for edge cases not covered in official docs

### Version Compatibility Rule
- **OpenCore Updates**: Always download the matching Configuration.pdf for your OpenCore version
- **Guide Updates**: Dortania guide reflects latest best practices - prefer current recommendations
- **Legacy Compatibility**: Use archived documentation only when running older OpenCore versions

## Architecture & Structure

### Core Components
- **`EFI/OC/`**: OpenCore bootloader configuration (v1.0.x+)
- **`config.plist`**: Main OpenCore configuration (SMBIOS: MacPro7,1)
- **`ACPI/`**: Compiled SSDT patches for X99/C612 chipset compatibility
- **`Kexts/`**: Kernel extensions for hardware support
- **`dsl/`**: Source ACPI DSL files for SSDT development
- **`Utilities/`**: OpenCore 1.0.5 utilities (ocvalidate, macserial, macrecovery)
- **`Docs/`**: OpenCore 1.0.5 documentation and ACPI samples

### Critical SSDT Files
When modifying ACPI patches, understand these X99-specific requirements:
- **`SSDT-USBMap.aml`**: ACPI-based USB port mapping (replaces USBPorts.kext)
- **`SSDT_FAKELPC.aml`**: C612 chipset LPC device-id fix
- **`SSDT-RTC0-RANGE-HEDT.aml`**: X99 HEDT platform RTC fix for macOS Big Sur+
- **`SSDT-UNC0.aml`**: UNC device fix for macOS Big Sur+
- **`SSDT-PLUG-DRTNIA.aml`**: CPU power management for Xeon processors

### Hardware-Specific Patterns

#### Audio Configuration Strategy
```
macOS ≤15.x: AppleALC.kext (onboard Realtek ALC)
macOS 16.x+:  VoodooHDA.kext OR HDMI/DP audio via RX580
```

#### Kext Dependencies
- **Base Framework**: `Lilu.kext` → `VirtualSMC.kext` → sensor kexts
- **GPU Support**: `WhateverGreen.kext` (v1.7.0+) for RX580
- **Network**: `RealtekRTL8111.kext` + `IOSkywalkFamily.kext` (Ventura+)
- **X99 Specific**: `CpuTscSync.kext` + `XHCI-unsupported.kext`

## Development Workflows

### SSDT Modification Process
1. Edit source file in `EFI/OC/dsl/`
2. Compile with: `iasl -ve -tc SSDT-filename.dsl`
3. Move compiled `.aml` to `EFI/OC/ACPI/`
4. Update `config.plist` ACPI→Add section if new file

### Testing macOS Version Compatibility
- **Audio**: Test onboard vs GPU audio for each macOS version
- **USB**: Verify all 22 mapped ports via `SSDT-USBMap.aml`
- **Power Management**: Check CPU states with IORegistryExplorer

### Configuration Validation
- **SMBIOS**: Always use `MacPro7,1` for Xeon E5-2660v4
- **Platform Info**: Generate new serials for clean iServices
- **Quirks**: X99 requires specific memory/PCI quirks in config.plist

### OpenCore Utilities Usage
- **Config Validation**: `Utilities/ocvalidate/ocvalidate config.plist` before each boot test
- **Serial Generation**: `Utilities/macserial/macserial -m MacPro7,1` for new SMBIOS
- **Recovery Creation**: `Utilities/macrecovery/macrecovery.py` for macOS installers
- **ACPI Reference**: Use `Docs/AcpiSamples/` for official SSDT examples
- **Template Configs**: Start from `Docs/Sample.plist` for new configurations

## Hardware Integration Points

### USB Port Mapping (Critical)
- Uses **ACPI-based mapping** via `SSDT-USBMap.dsl`
- Supports 22 ports across EHC1, EHC2, XHCI controllers
- Port types: USB2 (connector 0), USB3 Type-A (connector 3), Internal (connector 255)

### GPU Configuration
- **RX580**: Native AMD drivers, no additional patches needed
- **HDMI/DP Audio**: Works across all macOS versions (recommended audio solution)
- **Temperature Monitoring**: `RadeonSensor.kext` → `SMCRadeonGPU.kext`

### Network Setup
- **Ethernet**: Realtek RTL8111 via `RealtekRTL8111.kext`
- **WiFi/BT**: Fenvi T919 (BCM94360CD) - native support, no kexts needed

## Version-Specific Considerations

### macOS Tahoe (16.x) Changes
- **Breaking**: AppleALC.kext incompatible with onboard audio
- **Workaround**: Replace with VoodooHDA.kext or use GPU audio
- **Testing**: Always verify audio functionality when updating

### OpenCore Updates
- **Config Migration**: Use OpenCore Configurator for version updates
- **Kext Updates**: Update Lilu framework first, then dependent kexts
- **NVRAM Reset**: Clear after major OpenCore version changes


## Critical Don'ts
- **Never modify**: Boot order in BIOS after working setup
- **Don't update**: Individual kexts without testing full boot
- **Avoid**: USBPorts.kext - use SSDT-USBMap.aml instead
- **Don't change**: SMBIOS from MacPro7,1 without CPU compatibility check

## External Dependencies

### Required Files & Tools
- **BIOS**: `Bios_x99_k9_2023.zip` - specific version required
- **Tools**: OpenCore Configurator, IORegistryExplorer, MaciASL for SSDT editing
- **Utilities**: `Utilities/` - OpenCore 1.0.5 official tools
  - `ocvalidate` - Config validation
  - `macserial` - SMBIOS serial generation
  - `macrecovery` - macOS recovery download
- **Docs**: `Docs/` - OpenCore 1.0.5 documentation
  - `Configuration.pdf` - Complete parameter reference
  - `AcpiSamples/` - Official SSDT examples
  - `Sample.plist` and `SampleCustom.plist` - Configuration templates

### Official Documentation (Primary References)
- **[Dortania OpenCore Install Guide](https://dortania.github.io/getting-started/)** - Primary configuration source
- **[OpenCore Configuration.pdf](https://github.com/acidanthera/OpenCorePkg/blob/1.0.5/Docs/Configuration.pdf)** - Version-specific parameter reference
- **X99 Platform Specifics**: Follow Dortania's X99/HEDT platform guidance

### Community Resources (Secondary)
- OpenCore community forums for edge cases
- Hardware-specific user reports for compatibility verification