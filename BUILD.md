# 3-Way Speaker System with Front-Facing Transmission Line Build Guide

## Overview
This guide provides detailed instructions for building a complete 3-way speaker system featuring:
- 1× Tweeter (high frequencies)
- 1× Midrange driver
- 2× Tang Band W3-1876S subwoofers in front-facing transmission line
- 3D printed enclosure with plaster/PVA composite filling

## Design Goals
- **Tight Bass Response**: Q = 0.55 for critically damped performance
- **Minimal Room Interaction**: Front-facing design reduces boundary effects
- **Compact Form Factor**: Folded design fits in reasonable cabinet size
- **Easy Integration**: Works well in 3-way systems (20-200Hz range)

## Key Specifications

### Drivers
- **Model**: 2× Tang Band W3-1876S (3" subwoofers)
- **Wiring**: Parallel connection (2Ω total load)
- **Polarity**: REVERSED (critical for front-facing design)
- **Mounting**: Flush mount with gasket seal

### Transmission Line
- **Type**: Quarter-wave resonator
- **Length**: 1.56m (with 25% stuffing)
- **Tuning Frequency**: 55Hz (driver Fs)
- **Cross-section**: Tapered from 59.4 cm² to 94.5 cm²

### Cabinet Dimensions (External)
- **Width**: 24.4 cm
- **Height**: 53.6 cm  
- **Depth**: 42.6 cm
- **Volume**: 55.7 L

## Materials List

### 3D Printing
- **PLA/PETG Filament**: ~3-4kg depending on wall thickness
  - 3-4mm wall thickness recommended
  - 20-30% infill for structural sections
  - Support material as needed
- **Print bed size required**: 250×250mm minimum (print in sections)

### Composite Filling
- **Plaster of Paris**: 15-20 kg
- **PVA Glue**: 2-3 liters
- **Water**: For mixing (distilled preferred)
- **Mixing ratio**: 3:1:1 (plaster:PVA:water by volume)

### Acoustic Materials
- **Polyester Fill**: 0.5 kg (long-fiber type)
- **Acoustic Foam**: For midrange/tweeter chambers
- **Felt Strips**: 2m × 50mm (for edge treatment)
- **Dampening**: Built-in via plaster/PVA composite

### Hardware
- **3D Printer Adhesive**: For joining sections
- **Machine Screws**: M4×20mm (50 pcs) for assembly
- **Threaded inserts**: M4 heat-set (30 pcs)
- **Speaker Gaskets**: 
  - 2× 74mm (subwoofers)
  - 1× tweeter size
  - 1× midrange size
- **Binding Posts**: 2 sets (bi-amp capable)
- **Crossover Components**: For 3-way network
- **Internal Wiring**: 14-16 AWG

### Optional
- **Removable Access Panels**: For tuning adjustments
- **Foam Blocks**: Various sizes for length tuning
- **3D Printed Port Flare**: Custom exponential profile

## Construction Steps

### 1. 3D Printing the Enclosure

#### Print Settings
- **Layer Height**: 0.3mm (faster printing)
- **Wall Thickness**: 3-4mm minimum
- **Infill**: 20-30% gyroid or cubic
- **Support**: Tree supports for overhangs
- **Print Temperature**: Per filament specs

#### Enclosure Sections
1. **Main Cabinet Body** (may need splitting):
   - Front baffle section
   - Rear section
   - Top/bottom caps
2. **Internal Transmission Line Baffles**:
   - 4 separate baffles with mounting tabs
3. **Driver Mounting Rings**:
   - Precision fit for each driver
   - Integrated gasket channels
4. **Port Flare**:
   - Exponential profile
   - Smooth interior surface

### 2. Driver Layout (Top to Bottom)
1. **Tweeter**: 480mm from floor (ear level seated)
2. **Midrange**: 420mm from floor
3. **Subwoofer 1**: 350mm from floor  
4. **Subwoofer 2**: 200mm from floor
5. **Port Exit**: 100mm from floor

### 3. Assembly of 3D Printed Parts

1. **Test fit** all printed sections
2. **Install heat-set threaded inserts**:
   - Use soldering iron at 200°C
   - Press straight and slowly
   - Allow to cool before stress
3. **Join sections** with 3D printing adhesive:
   - Apply thin, even layer
   - Clamp for 24 hours
   - Sand joints smooth
4. **Install internal baffles**:
   - Secure with machine screws
   - Check alignment before tightening

### 4. Plaster/PVA Composite Application

#### Mixing Process
1. **Prepare small batches** (500ml at a time):
   - 3 parts plaster of paris
   - 1 part PVA glue
   - 1 part water
2. **Mix thoroughly** until smooth consistency
3. **Working time**: ~15-20 minutes per batch

#### Application Method
1. **Seal all 3D print seams** first
2. **Apply in thin layers** (5-10mm):
   - Start from bottom up
   - Work section by section
   - Avoid transmission line path
3. **Build up thickness**:
   - Target 15-20mm total
   - Multiple coats as needed
   - Allow drying between coats
4. **Critical areas**:
   - All corners and joints
   - Large flat panels
   - Around driver cutouts
   - NOT inside transmission line!

### 5. Detailed Transmission Line Design

#### Driver-to-Line Transition

**Optimized Design**: Direct funnel transition from drivers to transmission line - no coupling chamber needed. This provides the smoothest possible airflow and best acoustic performance.

1. **Driver Mounting Configuration**:
   - **Both drivers fire forward** (out of the cabinet)
   - **Rear of drivers** open directly into funnel
   - **No sealed box** - drivers directly coupled to TL
   - **Spacing**: 150mm center-to-center vertically

2. **Funnel Geometry**:
   - **Start**: Encompasses both driver openings
   - **Shape**: 3D compound curve (oval to rectangular)
   - **Length**: 80-100mm for smooth transition
   - **No parallel surfaces** - continuous taper

3. **Transition Profile**:
   ```
   REAR VIEW (looking at driver backs):
   
   ╭─────╮  Driver 1 (74mm diameter)
   │  ○  │
   ╰──┬──╯
      │    Smooth 3D funnel
   ╭──┴──╮ (no steps or chambers)
   │  ○  │
   ╰─────╯  Driver 2 (74mm diameter)
      ↓
   Merges to single rectangular opening
   ```

4. **Funnel Dimensions**:
   - **Entry**: Oval encompassing both drivers
     - Width: 90mm (clears both baskets)
     - Height: 225mm (spans both drivers)
     - Area: ~120 cm² at widest
   - **Exit**: 60 × 97mm rectangular (59.4 cm²)
   - **Profile**: Continuous 3D curve
   - **Length**: 80-100mm

5. **3D Printed Advantages**:
   ```
   TOP VIEW of funnel:
   
   Drivers side:  ○═══○  (two circles)
                    ╲ ╱
                     ╳    Smooth blend
                    ╱ ╲
   TL side:      [═════]  (rectangle)
   ```

6. **Why Direct Funnel is Better**:
   - **No turbulence**: Continuous smooth transition
   - **Better coupling**: Direct path minimizes reflections  
   - **Lower distortion**: No cavity resonances
   - **Easier to print**: Single smooth part
   - **More efficient**: Every mm³ guides airflow

#### Progressive Tapering Design
1. **Cross-Section Progression**:
   ```
   Position    | Area     | Width × Height | Corner Treatment
   ------------|----------|----------------|------------------
   0% (Entry)  | 59.4 cm² | 60 × 97 mm    | R10mm radius
   25%         | 68.3 cm² | 65 × 105 mm   | R10mm radius
   50%         | 79.1 cm² | 70 × 113 mm   | R12mm radius
   75%         | 88.5 cm² | 75 × 118 mm   | R15mm radius
   100% (Exit) | 94.5 cm² | 76 × 123 mm   | R15mm radius
   ```

2. **Taper Profile**:
   - **Type**: Parabolic (not linear)
   - **Expansion rate**: 1.59:1 total
   - **Smooth progression** - no sudden changes
   - **3D printed advantage**: Perfect curves possible

#### Corner and Edge Treatment
1. **All Internal Corners**:
   - **Minimum radius**: 10mm (smaller end)
   - **Maximum radius**: 15mm (port end)
   - **No 90° angles** anywhere in airflow path
   - **45° chamfers** as absolute minimum

2. **Fold Transitions**:
   ```
   Standard 90° Fold (BAD):     Optimized Fold (GOOD):
   ═══╗                         ═══╗
      ║                            ╲
      ║                             ╲R30mm
      ║                              ║
   ```
   - **Large radius**: 30-40mm at all 180° turns
   - **Smooth flow path** - no turbulence
   - **3D print with integrated curves**

3. **Edge Rounding Priority**:
   - **Critical**: All edges perpendicular to airflow
   - **Important**: Fold entrance/exit edges  
   - **Beneficial**: Parallel surface edges

#### Internal Structure with Rounded Transitions

##### Complete System Layout
```
FRONT VIEW:                    SIDE CUTAWAY VIEW:
                              
┌─────────────┐               ┌─────────────────────────┐
│      ○      │ Tweeter       │ [T] │ Sealed chamber    │
│─────────────│               │─────┼───────────────────│
│      ○      │ Midrange      │ [M] │ Sealed/ported     │
│─────────────│               │─────┼───────────────────│
│             │               │     │                   │
│      ○      │ Sub 1    ──>  │ [S1]│╲                 │
│             │               │     │ ╲ 3D Funnel      │
│      ○      │ Sub 2    ──>  │ [S2]│ ╱ Transition     │
│             │               │     │╱                 │
│─────────────│               │     ├──────────────────│
│  ┌───────┐  │ Port          │     │ Transmission Line │
│  │       │  │               │     │    (folded)       │
│  └───────┘  │               │     │                   │
└─────────────┘               └─────┴───────────────────┘
```

##### Driver-to-TL Funnel Detail
```
               3D FUNNEL TRANSITION (Multiple Views):
                 
   REAR VIEW:              SIDE SECTION:           TOP VIEW:
   
   ╭─────╮                Driver│ Funnel │TL       ○───────○
   │  ○  │ Driver 1         ═══╪════════╪═>        ╲     ╱
   ╰──┬──╯                     │╲      ╱│           ╲   ╱
      │                        │ ╲    ╱ │            ╲ ╱
      │ Smooth                 │  ╲  ╱  │             ╳
      │ funnel                 │   ╲╱   │            ╱ ╲
      │                        │   ╱╲   │           ╱   ╲
   ╭──┴──╮                     │  ╱  ╲  │          ╱     ╲
   │  ○  │ Driver 2         ═══╪╱      ╲╪═>       [═══════]
   ╰─────╯                Driver│ 100mm  │TL      Rectangle
   
   Total height: 225mm         No steps or         Smooth blend
   Width: 90mm                 chambers            from circles
                                                   to rectangle
```

##### Funnel Mathematics
```
Cross-sectional area progression through funnel:

Position    Area (cm²)    Shape Description
0mm         ~120          Oval encompassing both drivers
25mm        ~95           Transitioning oval
50mm        ~75           Becoming rectangular
75mm        ~65           Nearly rectangular
100mm       59.4          Perfect rectangle (60×97mm)
```

##### Optimized Folding Pattern with Funnel
```
[Driver 1] ══╗
             ║╲___    
             ║    ╲___  3D Funnel
             ║        ╲___ (100mm)
[Driver 2] ══╣           ╲___
             ║               ╲___
             ╚═══════════════════╲  Segment 1 (390mm)
                                  ╲
                               ___╱ R30mm turn
                           ___╱     
                       ___╱     Segment 2 (390mm)  
                   ___╱
               ___╱ R30mm turn
           ___╱
       ___╱     Segment 3 (390mm)
      ╱
     ╱___  R30mm turn
         ╲___
             ╲___  Segment 4 (390mm)
                 ╲___
                     ╲___╱ [Flared Port Exit]

Total line length: 1560mm (after funnel)
```

#### Stuffing Strategy

1. **Density Distribution**:
   ```
   Section          | Stuffing Density | Material Type
   -----------------|------------------|---------------
   Coupling Chamber | 5-10%           | Loose poly
   Segment 1 (0-25%)| 30-40%          | Medium density
   Segment 2 (25-50%)| 20-30%         | Medium density  
   Segment 3 (50-75%)| 10-15%         | Light density
   Segment 4 (75-100%)| 0-5%          | Minimal/none
   ```

2. **Stuffing Placement**:
   - **Away from walls**: Leave 20-30mm air gap
   - **Avoid corners**: Don't pack into radiused corners
   - **Progressive reduction**: More at driver end
   - **Secured properly**: Use mesh or grilles

3. **Material Specifications**:
   - **Type**: Long-fiber polyester (Acousta-Stuf)
   - **Density**: 0.5 lbs/ft³ base material
   - **Application**: Pulled apart, not compressed
   - **Avoid**: Fiberglass, rockwool (health hazards)

#### Front Port Design

1. **Internal Dimensions**:
   - **Rectangular**: 76 × 123 mm
   - **Area**: 94.5 cm²
   - **All corners**: R15mm minimum

2. **Flare Geometry**:
   ```
   Internal Port ────> Transition ────> Flared Exit
   76 × 123 mm         Exponential      90 × 145 mm
   (94.5 cm²)          100mm length     (130 cm²)
   ```

3. **Flare Profile Details**:
   - **Function**: Area = A₀ × e^(x/L)
   - **Expansion**: 1.38:1 ratio
   - **Length**: 100mm minimum
   - **Profile**: Exponential (not linear)

4. **3D Printing the Flare**:
   - **Layer orientation**: Perpendicular to airflow
   - **Surface finish**: 0.2mm layers or smoother
   - **Post-process**: Sand and seal interior
   - **Mount**: Flush with zero gap

#### Critical 3D Printing Features

1. **Wall Smoothness**:
   - **Interior finish**: < 0.5mm roughness
   - **Print orientation**: Minimize layer lines in airflow
   - **Post-processing**: Light sanding + primer

2. **Structural Integration**:
   - **Rounded corners**: Built into design
   - **No assembly seams**: In airflow path
   - **Reinforced turns**: Extra wall thickness

3. **Acoustic Considerations**:
   - **No whistles**: Check all transitions
   - **No resonances**: Vary wall thickness
   - **Smooth expansion**: Throughout length

#### Assembly and Tuning Access

1. **Removable Panels**:
   - **Location**: One per segment
   - **Size**: 100 × 100mm minimum
   - **Seal**: Gasket or o-ring groove
   - **Purpose**: Stuffing adjustment

2. **Measurement Ports**:
   - **Small holes**: For measurement mic
   - **Plugged**: During normal use
   - **Locations**: Start, middle, end of line

### 6. Separate Chambers

#### Tweeter Chamber
- **Volume**: 0.2-0.5L sealed
- **Filling**: Acoustic foam only
- **Isolation**: Complete from other drivers

#### Midrange Chamber  
- **Volume**: Per driver specs
- **Type**: Sealed or small ported
- **Damping**: Light foam lining
- **Isolation**: Critical for clean mids

#### Subwoofer Transmission Line
- **Shared by both woofers**
- **No plaster inside line path**
- **Polyester fill for tuning**

### 7. Line Cross-Section Progression

| Position | Width × Height | Area |
|----------|---------------|------|
| Driver End | 6.0 × 9.7 cm | 59.4 cm² |
| 25% Length | 6.5 × 10.5 cm | 68.3 cm² |
| 50% Length | 7.0 × 11.3 cm | 79.1 cm² |
| 75% Length | 7.5 × 11.8 cm | 88.5 cm² |
| Port End | 7.6 × 12.3 cm | 94.5 cm² |

### 8. Acoustic Treatment

#### Damping Application
1. **Plaster/PVA composite** provides primary damping
2. **Transmission line treatment**:
   - Felt strips on sharp edges only
   - No heavy damping needed (plaster does this)
   - Focus on airflow smoothness

2. **Add felt strips** to all sharp edges:
   - Internal baffle edges
   - Corner joints
   - Any protrusions into airflow

3. **Initial stuffing** (10-15%):
   - Loosely fill first 50% of line length
   - Keep density uniform
   - Leave last 50% unstuffed initially

### 9. Driver Installation

#### Subwoofer Wiring - CRITICAL REVERSE POLARITY

**Why Reverse Polarity?**
In a front-facing transmission line, the sound from the port emerges approximately 180° out of phase with the driver at the tuning frequency. To achieve proper phase alignment, the subwoofers MUST be wired in reverse polarity.

**How to Wire in Reverse Polarity:**

1. **Identify Driver Terminals**:
   - Look for + and - markings on driver terminals
   - Red terminal = Positive (+)
   - Black terminal = Negative (-)

2. **Connect REVERSED**:
   ```
   Amplifier/Crossover          Driver
   Positive (+) ─────────────> Negative (-)
   Negative (-) ─────────────> Positive (+)
   ```

3. **Both Subwoofers Same**:
   - Wire BOTH subwoofers reversed
   - Maintain parallel connection
   - Double-check before powering on

4. **Parallel Connection (Reversed)**:
   ```
   From Amp (+) ──┬── Driver 1 (-) 
                  └── Driver 2 (-)
                  
   From Amp (-) ──┬── Driver 1 (+)
                  └── Driver 2 (+)
   ```

5. **Color Coding Tip**:
   - Use red wire for amp positive to driver negative
   - Use black wire for amp negative to driver positive
   - This "wrong" color helps remember it's reversed

**Testing Phase Alignment:**
- Play a 50-60Hz test tone
- Listen at port and driver
- Should hear reinforcement, not cancellation
- If weak bass, check polarity again

#### Midrange and Tweeter Wiring

1. **Normal Polarity**:
   - Wire these conventionally
   - Positive to positive
   - Negative to negative

2. **Test fit** all drivers before final mounting
3. **Apply gasket** or foam tape to driver frames
4. **Secure with screws** - don't overtighten

### 10. Crossover Integration

#### Crossover Points
- **Sub to Mid**: 200-250Hz (24dB/oct)
- **Mid to Tweeter**: 2.5-3kHz (24dB/oct)

#### Mounting Options
1. **External**: On rear panel
2. **Internal**: In dedicated chamber
3. **Bi-amp ready**: Separate sub/mid-tweet sections

### 11. Port Construction (3D Printed)

#### Flared Exit (Recommended)
1. **Internal dimension**: 76 × 123mm rectangular
2. **Flare profile**: 
   - Start: 94.5 cm²
   - End: 142 cm² (50% expansion)
   - Length: 100mm
3. **Material options**:
   - Pre-made plastic horn flare
   - 3D printed custom profile
   - Layered MDF rings (labor intensive)
4. **Mount flush** with front baffle
5. **Round over** all edges (6mm radius minimum)

## Tuning Process

### Initial Setup
1. **Build line 5-10% longer** than calculated (1.64-1.72m)
2. **Install removable rear panel** for access
3. **Start with 10% stuffing density**
4. **Have tuning materials ready**:
   - Extra polyester fill
   - Foam blocks (various sizes)
   - Measurement equipment

### Tuning Steps

#### Step 1: Baseline Measurement
- Measure impedance curve
- Look for double peak (40-70Hz)
- Note peak frequencies and valley depth

#### Step 2: Progressive Stuffing
- Add stuffing in 5% increments
- Focus on first 50% of line
- Measure after each addition
- Target: Q = 0.55

#### Step 3: Length Adjustment
- Too loose/boomy: Add foam blocks to shorten
- Too tight/thin: Remove some stuffing
- Adjust in 5cm increments
- Re-measure after each change

#### Step 4: Final Damping
- Apply Dynamat to problem areas
- Add felt to eliminate whistles
- Check for panel resonances
- Secure all loose material

### Target Measurements
| Parameter | Target Value |
|-----------|-------------|
| System Q | 0.55 |
| F3 (-3dB) | 60 Hz |
| Group Delay @ 50Hz | < 12 ms |
| Group Delay @ 100Hz | < 6 ms |
| Impedance Min/Max | < 1.5:1 |

## Testing and Verification

### Objective Tests
1. **Impedance sweep** (20-200Hz)
2. **Frequency response** (near-field)
3. **Distortion** at various SPLs
4. **Group delay** measurement

### Subjective Tests
1. **Transient response**: Kick drums should be tight
2. **Pitch definition**: Bass notes clearly defined
3. **Integration**: Smooth blend with mids
4. **Room interaction**: Minimal boom or overhang

## Troubleshooting

### Problem: Loose, Boomy Bass
- Add more stuffing (5% increments)
- Shorten line with foam blocks
- Check for air leaks
- Verify driver polarity

### Problem: Thin, Weak Bass  
- Remove some stuffing
- Check line length calculations
- Verify no blockages in line
- Measure driver parameters

### Problem: Whistling or Chuffing
- Add flare to port exit
- Round over sharp edges
- Increase port area
- Reduce power level

### Problem: Panel Vibrations
- Add bracing to large panels
- Apply damping material
- Use thicker MDF (25mm)
- Tighten all joints

## 3D Printing Tips

### Design Considerations
- **Include wire channels** in print
- **Add mounting bosses** for crossover
- **Design removable panels** for access
- **Include alignment features** for assembly

### Strength Optimization  
- **Increase wall thickness** at stress points
- **Add internal ribs** where possible
- **Use higher infill** at mounting points
- **Orient layers** for maximum strength

### Post-Processing
1. **Sand mating surfaces** flat
2. **Seal with primer** before plaster
3. **Test fit everything** before final assembly
4. **Plan wire routing** in advance

## Plaster/PVA Composite Benefits

1. **Mass Loading**: Adds weight for reduced vibration
2. **Damping**: Excellent internal damping properties  
3. **Sealing**: Fills all 3D print imperfections
4. **Tunability**: Thickness can be varied
5. **Cost Effective**: Cheaper than commercial damping

This design prioritizes tight, controlled bass response ideal for music reproduction. The front-facing configuration minimizes room interaction while the progressive taper and tuning methodology ensure optimal transient response.