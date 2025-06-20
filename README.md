# 3D Printed Speaker System with Plaster/PVA Composite Construction

A comprehensive speaker design project featuring a 3-way active system with DSP processing, 3D printed enclosures, and external plaster/PVA composite damping.

## 🎯 Project Highlights

- **Unique Construction**: 3D printed shell with 15-20mm external plaster/PVA coating
- **Front-Facing Transmission Line**: Tight, controlled bass response (Q=0.55)
- **Monolithic Design**: All drivers integrated in single enclosure
- **Digital Processing**: ADAU1701 DSP for crossovers and room correction
- **High-Quality Drivers**: Danish Scan-Speak tweeter + Tang Band mid/subs

## System Overview

This project implements a high-quality 3-way active speaker system using:

- **2× Tang Band W3-1876S** - 3" Subwoofers (front-facing transmission line)
- **1× Tang Band W3-871SC** - 3" Midrange (sealed enclosure) 
- **1× Scan-Speak D2608/913000** - 1" Tweeter (sealed enclosure)
- **ADAU1701 DSP Board** - Digital signal processing and crossovers
- **XH-M180 Amplifier** - 4-channel, 50W per channel
- **3D Printed Enclosure** - With external plaster/PVA composite coating

## Key Features

- **Active Design**: Each driver powered by dedicated amplifier channel
- **DSP Processing**: Digital crossovers, EQ, time alignment, and protection
- **3D Printed Enclosures**: Custom-designed for optimal acoustic performance
- **Plaster/PVA Composite**: External coating for extreme rigidity and damping
- **Front-Facing Transmission Line**: Tight, controlled bass response
- **Monolithic Construction**: All chambers integrated in single 3D print

## Project Structure

```
Speaker-Design/
├── BUILD.md              # Comprehensive build instructions for TL system
├── specs.MD              # Detailed driver and component specifications
├── calculations/         # Jupyter notebooks for acoustic calculations
│   ├── subwoofer_transmission_line.ipynb  # Front-facing TL design
│   ├── midrange_calculations.ipynb        # Sealed box calculations
│   └── tweeter_calculations.ipynb         # Minimal sealed chamber
├── 3d-models/            # STL files and CAD models
├── dsp-config/           # SigmaStudio DSP configuration files
├── docs/                 # Additional documentation
└── tests/                # Measurement and testing data
```

## Getting Started

### Prerequisites

- Python 3.8+
- Make (for automated setup)
- Jupyter Notebook (installed via make setup)

### Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd Speaker-Design
   ```

2. Set up the development environment:
   ```bash
   make setup
   ```

3. Start Jupyter notebook server:
   ```bash
   make notebook
   ```

### Available Make Commands

- `make help` - Show available commands
- `make setup` - Create virtual environment and install dependencies
- `make notebook` - Start Jupyter notebook server
- `make clean` - Remove virtual environment
- `make requirements` - Generate requirements.txt

## Design Specifications

### Crossover Design
- **Sub → Mid**: 200 Hz (24 dB/octave, Linkwitz-Riley)
- **Mid → Tweet**: 2750 Hz (24 dB/octave, Linkwitz-Riley)
- **System Rating**: Good (3/6 points)
- **Crossover Smoothness**: 1.56 dB std deviation
- **Sensitivity Range**: 9.3 dB (requires DSP level matching)

### Enclosure Design
- **Dual Subwoofers**: Front-facing transmission line (1.56m folded, Q=0.55)
- **Midrange**: 0.2L sealed enclosure
- **Tweeter**: 0.05L minimal sealed chamber
- **Construction**: 3D printed shell + external plaster/PVA composite

### Power Distribution & Sensitivity
| Channel | Driver | Power (Avail/Req) | Sensitivity | DSP Gain |
|---------|--------|-------------------|-------------|----------|
| Ch 1 | Tweeter | 25W/8W @ 8Ω | 91.3 dB | -9 dB |
| Ch 2 | Midrange | 25W/12W @ 8Ω | 87.0 dB | -5 dB |
| Ch 3 | Dual Subs | 50W/30W @ 2Ω | 82.0 dB | 0 dB (ref) |
| Ch 4 | (Reserved) | - | - | - |

**Frequency Coverage**:
- Subwoofers: 20-200 Hz (3.3 octaves)
- Midrange: 200-2,750 Hz (3.8 octaves)  
- Tweeter: 2,750-20,000 Hz (2.9 octaves)

## 3D Printing & Construction

### 3D Printing Settings
- **Material**: PLA/PETG/ABS (PETG recommended)
- **Wall Thickness**: 3-4mm for shell
- **Infill**: 20-30% (structural areas only)
- **Layer Height**: 0.2-0.3mm
- **Support**: Tree supports for overhangs
- **Print bed**: 250×250mm minimum (print in sections)

### Plaster/PVA Composite
- **Mix Ratio**: 3:1:1 (plaster:PVA:water by volume)
- **Application**: EXTERNAL surfaces only
- **Thickness**: 15-20mm target
- **Purpose**: Mass loading and vibration damping
- **Cure Time**: 24-48 hours

### Critical Dimensions
- **Subwoofer Cutout**: 74.4mm diameter
- **Midrange Cutout**: 71.5mm diameter
- **Tweeter Cutout**: 31mm diameter
- **Cabinet**: 244W × 536H × 426D mm

## Acoustic Design Features

### Transmission Line (Subwoofers)
- **Type**: Front-facing quarter-wave resonator
- **Length**: 1.56m (folded into 4 segments)
- **Taper**: Progressive from 59.4 to 94.5 cm²
- **Stuffing**: 25% density, progressive distribution
- **Port**: Exponential flare, 100mm length
- **Wiring**: REVERSED POLARITY (critical for phase alignment)

### Internal Treatment
- **TL Stuffing**: Long-fiber polyester, 30-40% at driver end
- **Midrange**: Light foam lining
- **Tweeter**: Minimal or no fill
- **NO plaster inside**: All chambers remain hollow

## DSP Configuration

The ADAU1701 handles:
- **Input Stage**: Stereo to mono summing, gain control
- **Crossover Filters**: 24 dB/octave Linkwitz-Riley at 200/2750 Hz
- **Level Matching**: -9dB tweeter, -5dB midrange (to match subs)
- **Time Alignment**: 0.1-0.5ms tweeter delay typical
- **Room Correction**: Parametric EQ (5-10 bands)
- **Protection**: Limiters on each output channel

### Signal Flow
```
Stereo Input → Input Gain → L+R Mix → Room EQ → 3-Way Crossover
    ↓
├─ High-Pass 2750Hz → Delay → -9dB → Limiter → Ch1 (Tweeter)
├─ Band-Pass 200-2750Hz → -5dB → Limiter → Ch2 (Midrange)  
├─ Low-Pass 200Hz → Limiter → Ch3 (Subwoofer 1)
└─ Low-Pass 200Hz → Limiter → Ch4 (Subwoofer 2)
```

## Performance Summary

### System Analysis (from crossover_design.ipynb)
- **Overall Rating**: Good (3/6 points)
- **Power Matching**: ✅ Excellent (83-100% utilization)
- **Sensitivity Matching**: ⚠️ 9.3 dB range (requires DSP compensation)
- **Crossover Integration**: ✅ 1.56 dB deviation (acceptable)
- **Frequency Response**: 20 Hz - 20 kHz ±3 dB (estimated)

### Key Performance Metrics
- **Maximum SPL**: ~105 dB @ 1m (calculated)
- **Bass Extension**: -3dB @ 60 Hz (tight, controlled)
- **Dispersion**: Excellent above 2.75 kHz (1" dome)
- **Power Handling**: Conservative with 1.67x headroom

## Documentation

- **BUILD.md** - Complete construction guide with transmission line details
- **specs.MD** - Detailed component specifications
- **calculations/** - Jupyter notebooks for acoustic modeling:
  - `subwoofer_transmission_line.ipynb` - Front-facing TL design
  - `midrange_calculations.ipynb` - Sealed box optimization
  - `tweeter_calculations.ipynb` - Minimal chamber design
  - `crossover_design.ipynb` - System integration analysis
- **dsp-config/** - SigmaStudio configuration files

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is open source. See LICENSE file for details.

## Acknowledgments

- Tang Band for excellent driver specifications
- Scan-Speak for premium tweeter design
- Analog Devices for ADAU1701 DSP capabilities