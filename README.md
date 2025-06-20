# 3D Printed Speaker System Design

A comprehensive speaker design project featuring a 3-way active system with DSP processing and 3D printed enclosures.

## System Overview

This project implements a high-quality 3-way active speaker system using:

- **2× Tang Band W3-1876S** - 3" Woofers (transmission line/ported enclosure)
- **1× Tang Band W3-871SC** - 3" Midrange (sealed enclosure) 
- **1× Scan-Speak D2608/913000** - 1" Tweeter (sealed enclosure)
- **ADAU1701 DSP Board** - Digital signal processing and crossovers
- **XH-M180 Amplifier** - 4-channel, 50W per channel

## Key Features

- **Active Design**: Each driver powered by dedicated amplifier channel
- **DSP Processing**: Digital crossovers, EQ, time alignment, and protection
- **3D Printed Enclosures**: Custom-designed for optimal acoustic performance
- **Modular Construction**: Separate enclosures for easy assembly and tuning

## Project Structure

```
Speaker-Design/
├── specs.MD              # Detailed driver and component specifications
├── calculations/          # Jupyter notebooks for acoustic calculations
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

### Crossover Points
- **Woofer → Mid**: 150-200 Hz (24 dB/octave, Linkwitz-Riley)
- **Mid → Tweet**: 2500-3000 Hz (24 dB/octave, Linkwitz-Riley)

### Enclosure Volumes
- **Dual Woofers**: 1.7-2.0L total (transmission line tuned @ 55 Hz)
- **Midrange**: 0.5-0.8L (sealed)
- **Tweeter**: Minimal sealed chamber

### Power Distribution
| Channel | Driver | Available Power | Required Power |
|---------|--------|----------------|----------------|
| Ch 1 | Tweeter L | ~25W @ 8Ω | <10W |
| Ch 2 | Tweeter R | ~25W @ 8Ω | <10W |
| Ch 3 | Midrange | ~25W @ 8Ω | 12W |
| Ch 4 | Dual Woofers | 50W @ 2Ω | 30W total |

## 3D Printing Guidelines

### Recommended Settings
- **Material**: PETG, ABS, or ASA
- **Wall Thickness**: 3-4mm minimum
- **Infill**: 30-50% for rigidity
- **Layer Height**: 0.2-0.3mm
- **Support**: Required for driver mounting holes

### Critical Dimensions
- **Woofer Cutout**: 74.4mm diameter
- **Midrange Cutout**: 71.5mm diameter
- **Tweeter Cutout**: ~26mm diameter (verify specific model)

## Acoustic Treatment

- **Internal Damping**: Polyfill or acoustic foam
- **Bracing**: Every 150-200mm for large panels
- **Gaskets**: Foam tape for driver mounting
- **Port Tuning**: Smooth interior surface critical

## DSP Configuration

The ADAU1701 handles:
- Input gain control
- Room correction EQ
- Digital crossover filters
- Time alignment compensation
- Dynamic range limiting/protection

Signal flow: Stereo Input → Processing → 4-channel output (L/R tweeters, mono mid, mono woofer)

## Documentation

- See `specs.MD` for complete component specifications
- Jupyter notebooks in `calculations/` for acoustic modeling
- DSP configuration files for SigmaStudio setup

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