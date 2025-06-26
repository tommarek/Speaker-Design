# Speaker Design Calculations Guidelines

This document provides guidelines for creating calculation notebooks that serve as the source of truth for speaker designs. These notebooks should generate design parameters from measurements and first principles, not validate existing specifications.

## Core Principles

1. **Calculations Drive Design**: The notebook calculates optimal parameters from measured data. Any external documentation (README, build guides) should reference these calculations, not the other way around.

2. **Measurement-Based**: Start with real driver measurements (impedance, frequency response) when available. Use manufacturer specs only as fallback.

3. **Show Your Work**: Display the mathematical reasoning behind each design choice. Users should understand why each parameter was selected.

4. **Compare Alternatives**: Present multiple design options with different optimization goals (e.g., maximum extension vs. maximum control).

5. **Practical Warnings**: Clearly indicate when user preferences conflict with optimal calculations, and explain the risks.

## Notebook Structure

### 1. Driver Parameter Analysis
```python
# Load and analyze measurement data
# Extract T/S parameters from impedance curves
# Compare measured vs. specified values
# Flag any significant discrepancies
```

**Key outputs:**
- Measured Fs, Re, Qts
- Driver excursion limits
- Power handling capabilities
- Usable frequency range

### 2. Enclosure Design Calculations
```python
# Calculate optimal enclosure parameters based on driver measurements
# Show the math for each calculation
# Present multiple tuning options with tradeoffs
```

**For Transmission Lines:**
- Calculate optimal Fb (typically 0.7-0.85 × Fs)
- Determine line length: L = c / (4 × Fb)
- Calculate taper dimensions based on driver Sd
- Specify damping requirements

**For Sealed/Ported:**
- Calculate optimal volume for target Qtc or tuning
- Determine port dimensions if applicable
- Specify damping materials

### 3. Crossover Design
```python
# Calculate crossover frequencies based on driver capabilities
# Consider beaming, excursion limits, and distortion
# Specify filter types and slopes
```

**Key considerations:**
- Crossover should be 3-4× Fs for small drivers
- Account for driver directivity
- Ensure adequate excursion headroom

### 4. DSP Requirements
```python
# Calculate equalization needs
# Determine protection settings
# Specify gain structure
```

**Include:**
- Boost requirements to achieve target response
- High-pass filter for driver protection
- Limiter thresholds based on excursion limits

### 5. Performance Analysis
```python
# Model expected frequency response
# Calculate power handling and SPL capabilities
# Analyze excursion at different frequencies
```

**Show:**
- Predicted frequency response curves
- Maximum SPL before excursion limits
- Power compression estimates

### 6. Design Alternatives
```python
# Present different optimization targets
# Compare calculated optimal vs. user preferences
# Clearly show tradeoffs
```

**Example comparisons:**
- Maximum extension vs. maximum control
- Compact size vs. optimal performance
- User target vs. calculated optimal

### 7. Final Summary
```python
# Summarize all calculated parameters
# Provide clear implementation guidelines
# Include warnings for non-optimal choices
```

## Best Practices

### DO:
- Start every calculation from measured data
- Show mathematical derivations
- Provide multiple design options
- Include safety margins
- Warn about risky design choices
- Export key parameters for use in other documents

### DON'T:
- Reference external specs as gospel
- Hide calculations in black boxes
- Assume user knows the risks
- Include manufacturing details (3D printing, woodworking)
- Make the notebook dependent on external files

## Example Code Structure

```python
# 1. Load measurements
impedance_data = pd.read_csv('impedance.csv')
measured_fs = find_resonance_peak(impedance_data)

# 2. Calculate optimal parameters
optimal_fb = 0.75 * measured_fs  # Traditional ratio
print(f"Calculated optimal tuning: {optimal_fb:.1f} Hz")

# 3. Show alternatives
tuning_options = {
    'Conservative': 0.85 * measured_fs,
    'Optimal': 0.75 * measured_fs,
    'Extended': 0.70 * measured_fs
}

# 4. Compare with user preference
user_target = 42  # Hz
if user_target / measured_fs < 0.7:
    print("WARNING: Target tuning is aggressive!")
    
# 5. Export results
calculated_params = {
    'fb': optimal_fb,
    'length': 343 / (4 * optimal_fb),
    # ... other parameters
}
```

## Output Format

All key parameters should be clearly displayed and easily extractable:

```
CALCULATED OPTIMAL DESIGN:
========================
Tuning frequency (Fb): 45.3 Hz
Line length: 1.89 m
Throat area: 40 cm²
Exit area: 20 cm²
Crossover: 220 Hz
DSP gain: +7 dB
```

## Integration with Other Documents

The calculation notebook should export a parameter dictionary or JSON file that other documents can reference. This ensures consistency and makes the notebook the single source of truth.

```python
# Export for use in other documents
import json
with open('calculated_parameters.json', 'w') as f:
    json.dump(calculated_params, f, indent=2)
```

## Version Control

Track changes to calculations carefully. When driver measurements are updated, re-run the entire notebook and document what changed and why.

---

Remember: The notebook tells you what the speaker SHOULD be, not what someone wishes it could be. Let the physics guide the design.