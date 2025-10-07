# Hackintosh Build - X99 Machinist K9 + E5-2660v4 + RX580

🎯 **Optimized Hackintosh configuration for X99 Machinist K9 motherboard**

## 📋 System Specifications

| Component | Details |
|-----------|---------|
| **Motherboard** | X99 Machinist K9 |
| **CPU** | Intel Xeon E5-2660v4  |
| **Chipset** | Intel C612 |
| **RAM** | 64GB DDR4 ECC REG |
| **GPU** | AMD Radeon RX 580 8GB |
| **Audio** | Realtek ALC (onboard) + HDMI/DP (RX580) |
| **Network** | Realtek RTL8111 (onboard) |
| **WiFi/Bluetooth** | Fenvi T919 (may require OCLP patches) |
| **Storage** | NVMe SSD |

## 🚀 macOS Compatibility

- ✅ **macOS Big Sur** (11.x)
- ✅ **macOS Monterey** (12.x)  
- ✅ **macOS Ventura** (13.x)
- ✅ **macOS Sonoma** (14.x)
- ✅ **macOS Sequoia** (15.x)
- 🔄 **macOS Tahoe** (16.x) - See audio notes below

## 🪟 Dual-Boot Support

✅ **Windows & macOS Dual-Boot Fully Working**
- Seamless dual-boot setup with OpenCore
- Windows 10/11 compatibility maintained
- No conflicts between operating systems
- Easy OS selection via OpenCore boot menu
- All hardware features work in both systems

## 🎵 Audio Configuration

### ⚠️ **Important Audio Notes:**

#### **Onboard Audio (Realtek ALC):**
- ❌ **Does NOT work in macOS Tahoe (16.x)**
- ✅ **Works in previous macOS versions** with AppleALC.kext
- 🔧 **Workaround for Tahoe:** Use VoodooHDA.kext instead of AppleALC.kext

#### **HDMI/DisplayPort Audio (RX580):**
- ✅ **Works perfectly in ALL macOS versions** including Tahoe
- 🎯 **Recommended solution** for audio compatibility

### Audio Kext Options:
```
Option 1 (macOS ≤15.x): AppleALC.kext (for onboard audio)
Option 2 (macOS 16.x):  VoodooHDA.kext (for onboard audio)  
Option 3 (All macOS):   HDMI/DisplayPort audio via RX580 (recommended)
```

## 🛠️ OpenCore Configuration

### **Version:** OpenCore 1.0.x+
### **SMBIOS:** MacPro7,1

### **ACPI Files:**
| File | Purpose |
|------|---------|
| `SSDT-EC-DESKTOP.aml` | Embedded Controller fix for desktop |
| `SSDT-USBMap.aml` | ACPI-based USB port mapping |
| `SSDT-RTC0-RANGE-HEDT.aml` | RTC fix for X99 HEDT platform |
| `SSDT_FAKELPC.aml` | LPC device-id fix for C612 chipset |
| `SSDT-HPET-NEW.aml` | HPET optimizations |
| `SSDT-MCHC.aml` | Memory Controller Host Bridge |
| `SSDT-PLUG-DRTNIA.aml` | CPU Power Management |
| `SSDT-UNC0.aml` | UNC device fix for macOS Big Sur+ |
| `SSDT-USBX.aml` | USB power management |
| `SSDT-USBW.aml` | USB wake support |
| `SSDT-SAT1.aml` | SATA controller fix |

### **Essential Kexts:**
| Kext | Version | Purpose |
|------|---------|---------|
| `Lilu.kext` | Latest | Patching framework |
| `VirtualSMC.kext` | Latest | SMC emulation |
| `WhateverGreen.kext` | v1.7.0 | GPU support |
| `AppleALC.kext` | Latest | Audio (macOS ≤15.x) |
| `RealtekRTL8111.kext` | Latest | Ethernet |
| `CpuTscSync.kext` | Latest | CPU synchronization |
| `NVMeFix.kext` | Latest | NVMe optimizations |
| `RadeonSensor.kext` | v0.3.3 | GPU temperature monitoring |
| `SMCRadeonGPU.kext` | v0.3.3 | GPU sensors for VirtualSMC |
| `SMCProcessor.kext` | Latest | CPU temperature monitoring |
| `SMCSuperIO.kext` | Latest | Motherboard sensors |
| `XHCI-unsupported.kext` | Latest | USB 3.0 support for X99 |
| `IOSkywalkFamily.kext` | Latest | Network support (Ventura+) |
| `AMFIPass.kext` | Latest | AMFI bypass |
| `RestrictEvents.kext` | Latest | Blocks unwanted updates |
| `FeatureUnlock.kext` | Latest | Unlocks macOS features |

## 🔧 Installation Instructions

### 1. **BIOS Setup:**
- Flash `Bios_x99_k9_2023.zip` if needed (compatible BIOS version)

**Required Settings:**
- ✅ **UEFI Boot Mode** - Enabled
- ✅ **Above 4G Decoding** - Enabled
- ✅ **XHCI Hand-off** - Enabled
- ✅ **SATA Mode** - AHCI
- ❌ **Secure Boot** - Disabled
- ❌ **CSM (Compatibility Support Module)** - Disabled
- ❌ **Fast Boot** - Disabled

**Optional (Recommended):**
- **VT-d** - Disabled (or keep `DisableIoMapper=true` in config.plist)
- **CFG Lock** - Disabled (if unlockable, otherwise keep `AppleCpuPmCfgLock=true`)

> **Note:** Above 4G Decoding is essential for X99 systems with modern GPUs like RX 580. Without it, PCI device enumeration may fail.

### 2. **Pre-Installation:**
- Copy the EFI folder to EFI partition
### 3. **Audio Setup (for macOS Tahoe):**
If using macOS Tahoe (16.x), replace AppleALC.kext with VoodooHDA.kext:

**Alternative:** Use HDMI/DisplayPort audio from RX580 (works natively)

## ⚡ Performance Optimizations

### **CPU Features:**
- ✅ Native CPU Power Management
- ✅ All cores recognized
- ✅ Turbo Boost support
- ✅ Proper temperature monitoring

### **GPU Features:**
- ✅ Hardware acceleration
- ✅ Metal 2 support
- ✅ 4K/5K display support
- ✅ Temperature monitoring
- ✅ Fan control

### **USB Features:**
- ✅ ACPI-based USB mapping
- ✅ USB 3.0/2.0 full speed
- ✅ All ports working
- ✅ Proper power management

### **Network & Connectivity:**
- ✅ **Ethernet** - Realtek RTL8111 (onboard)
- ✅ **WiFi** - Fenvi T919 (BCM94360CD) - Native Support
- ✅ **Bluetooth** - Fenvi T919 - Native Support
- ⚠️ **Note:** Fenvi T919 may require OCLP (OpenCore Legacy Patcher) patches for newer macOS versions
- ✅ **AirDrop/Handoff** - Works natively with T919
- ✅ **Continuity Features** - All Apple services work

## 🧪 What Works

- ✅ **Boot/Install/Update** - All macOS versions
- ✅ **Graphics** - RX580 full acceleration
- ✅ **Audio** - HDMI/DP (RX580) all macOS / Onboard (except Tahoe)
- ✅ **Network** - Ethernet (RTL8111) + WiFi (Fenvi T919)
- ✅ **Bluetooth** - Fenvi T919 (Native support)
- ✅ **AirDrop/Handoff** - Full Apple ecosystem integration
- ✅ **USB** - All ports at full speed
- ✅ **Sleep/Wake** - Working properly
- ✅ **CPU Power Management** - Native support
- ✅ **Temperature Monitoring** - CPU and GPU
- ✅ **NVMe** - Full speed with optimizations
- ✅ **iServices** - iMessage, FaceTime, etc.

## ❌ What Doesn't Work

- ⚠️ **Onboard Audio in macOS Tahoe** - Use VoodooHDA or PCIe card

## 🔍 Troubleshooting

### **Boot Issues:**
- Check OpenCore version compatibility
- Verify ACPI files are compiled correctly
- Clear NVRAM

### **Audio Issues in macOS Tahoe:**
- Replace AppleALC.kext with VoodooHDA.kext for onboard audio
- OR use HDMI/DisplayPort audio from RX580 for native support

### **USB Issues:**
- Verify SSDT-USBMap.aml is loaded
- Check USB port mapping in ACPI

### **GPU Issues:**
- Update WhateverGreen.kext to v1.7.0+
- Check device-id spoofing if needed

### **WiFi/Bluetooth Issues (Fenvi T919):**
- For newer macOS versions (Sonoma 14.x+), may require OCLP (OpenCore Legacy Patcher) patches
- BCM94360CD chipset natively supported in older macOS versions
- Download OCLP from: [OpenCore Legacy Patcher](https://github.com/dortania/OpenCore-Legacy-Patcher)
- Apply WiFi/Bluetooth patches as needed for your macOS version

## 📁 Repository Structure

```
├── EFI/
│   ├── BOOT/
│   │   └── BOOTx64.efi
│   └── OC/
│       ├── ACPI/           # Compiled SSDT files
│       ├── Drivers/        # OpenCore drivers
│       ├── Kexts/          # Kernel extensions
│       ├── Resources/      # OpenCore resources
│       ├── Tools/          # Debugging tools
│       ├── config.plist    # Main configuration
│       └── dsl/            # Source SSDT files
├── Bios_x99_k9_2023.zip   # BIOS firmware for X99 K9 motherboard
└── README.md              # This documentation
```


## 📝 Credits & Sources

- **Base Configuration:** [Andrej-Antipov/X99-K9-Machinist-Hackintosh](https://github.com/Andrej-Antipov/X99-K9-Machinist-Hackintosh)
- **OpenCore Team** - OpenCore bootloader
- **Acidanthera** - Most kexts and tools
- **Dortania** - OpenCore guides and best practices
- **aluveitie** - RadeonSensor.kext
- **X99 Community** - Platform-specific optimizations

## ⚠️ Disclaimer

This configuration is specifically optimized for:
- **X99 Machinist K9** motherboard
- **Intel Xeon E5-2660v4** CPU
- **AMD RX580** GPU

Results may vary with different hardware configurations. Always backup your working EFI before making changes.

## Support

For support and updates, check:
- [OpenCore Documentation](https://dortania.github.io/OpenCore-Install-Guide/)
- [X99 Hackintosh Communities](https://www.reddit.com/r/hackintosh/)

---

**OpenCore Version:** 1.0.x+  
**macOS Tested:** Big Sur through Tahoe (11.x - 16.x)