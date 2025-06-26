
# Transmission-Line Monitor — 

## Table of Contents

1. [Overview & Terminology](#1)  
2. [Quarter-Wave Acoustics](#2)  
3. [Dimensioning Procedure](#3)  
4. [Stuffing & Flow-Resistivity](#4)  
5. [Panel & Seal Control](#5)  
6. [DSP Crossover & Time Alignment](#6)  
7. [Measurement Workflow](#7)  
8. [Room Integration](#8)  
9. [Glossary](#9)  
10. [Core Equations](#10)  
11. [Worked Example — W3-1876S Pair](#11)  
12. [Checklist](#12)  
13. [References](#13)

---

<a id="1"></a>

## 1  Overview & Terminology

A **quarter-wave transmission-line (TL)** loudspeaker is a **resonant 4th-order high-pass alignment** whose fundamental λ⁄4 mode reinforces bass output. The classical descriptor *“non-resonant”* (Bailey 1965) referred to the heavy damping of *harmonic* modes, not removal of the primary resonance.

> **Historical note:** Bailey’s prototype employed **graduated stuffing density**—light near the driver, progressively heavier toward the line midpoint, and a thin high-density lining at the terminus. Uniform stuffing was *not* part of the original design.

### Design goals

* **F₋3dB** ≈ 0.7–0.85 × driver F<sub>s</sub>.  
* **Bass ripple** ≤ ±1.5 dB (20–200 Hz).  
* **Linkwitz-Riley 4th order (LR4)** acoustic crossover with verified time delays.  

---

<a id="2"></a>

## 2  Quarter-Wave Acoustics (recap)

* **Acoustic length** L<sub>ac</sub> = c ⁄ (4 F<sub>b</sub>) (Eq 1)  
* **Ideal input impedance** Z<sub>in</sub> = Z<sub>c</sub> cot(βL) — conceptual only; tapered/damped lines require simulation.  
* **Harmonic control**: taper (TR), stuffing (σ), driver offset (~ L<sub>ac</sub>⁄3) suppress 3 F<sub>b</sub>, 5 F<sub>b</sub>… peaks.  
* **Taper ratio** TR = S<sub>L</sub> ⁄ S<sub>0</sub>.  

  * TR ≈ 0.5 (2 : 1) → balanced efficiency/ripple.  
  * TR ≈ 0.25 (4 : 1) → lowest ripple, −1 dB sensitivity, higher vent Mach.  

> **All SPL formulas (Section 10) assume half-space radiation** (loudspeaker on an infinite baffle or floor), hence 2πr in Eq 5.  

---

<a id="3"></a>

## 3  Dimensioning Procedure (all SI)

This sequence yields first-pass geometry—refine in Hornresp or other simulators for ripple, SPL, Mach.

| # | Task | Equation / Guideline | Notes |
|---|------|----------------------|-------|
| 1 | Collect driver data | F<sub>s</sub>, Q<sub>ts</sub>, S<sub>d</sub>, X<sub>max</sub>, V<sub>as</sub> | Sum S<sub>d</sub> & V<sub>as</sub> for multiple woofers. |
| 2 | Select tuning | F<sub>b</sub> = k<sub>f</sub> F<sub>s</sub>  (k<sub>f</sub> ≈ 0.7–0.85) | Pick via simulation for flat alignment. |
| 3 | Compute acoustic length | L<sub>ac</sub> = c ⁄ (4 F<sub>b</sub>) | c ≈ 343 m s⁻¹ @ 20 °C. |
| 4 | Choose taper TR | e.g. 0.5 or 0.25 | Efficiency/ripple trade-off. |
| 5 | Get **Resistance Factor DR** | See Table 3-1 | From King’s alignment tables. |
| 6 | Physical length | L<sub>phys</sub> = DR × L<sub>ac</sub> | Stuffing-induced velocity reduction handled in simulation. |
| 7 | Throat area | S<sub>0</sub> = k<sub>s</sub> ΣS<sub>d</sub>  (k<sub>s</sub> ≈ 0.9–1.3) | 1.0 default. |
| 8 | Vent area | S<sub>L</sub> = TR × S<sub>0</sub> | Slot/round as convenient. |
| 9 | Vent Mach | U<sub>pk</sub> = 2π f X<sub>pk</sub> ΣS<sub>d</sub>;<br>V<sub>vent</sub> = U<sub>pk</sub> ⁄ S<sub>L</sub> | X<sub>pk</sub> ≤ X<sub>max</sub>⁄√2. Require V<sub>vent</sub> < 0.05 c. |
| 10 | Excursion-SPL | p<sub>pk</sub> = ρcU<sub>pk</sub> ⁄ (2πr);<br>p<sub>rms</sub> = p<sub>pk</sub>/√2;<br>SPL = 20 log₁₀(p<sub>rms</sub>/20 µPa) | Half-space, r = 1 m. |
| 11 | Volume sanity | V<sub>TL</sub> = L<sub>phys</sub>(S<sub>0</sub>+S<sub>L</sub>)/2;<br>check V<sub>TL</sub> ≥ 1.5 ΣV<sub>as</sub> | 2–4 ΣV<sub>as</sub> often preferred for low-Q drivers. |

### Table 3-1 Resistance Factors (DR) for Tapered Lines

| TR (S<sub>L</sub>/S<sub>0</sub>) | DR |
|----------------------------------|----|
| 0.10 (10 : 1) | 0.62 |
| 0.25 (4 : 1)  | 0.75 |
| 0.50 (2 : 1)  | 0.87 |
| 1.00 (1 : 1)  | 1.00 |
| 2.00 (1 : 2)  | 1.14 |
| 4.00 (1 : 4)  | 1.28 |

> **Software note:** Martin J. King’s MathCAD worksheets were **discontinued from public distribution in 2018**. Modern alternatives include:  
> • **HornResp** (free) with TL modules  
> • **Andrea Rubino’s SpicyTL**  
> • DIY Excel/LibreOffice workbooks based on King’s published equations  

---

<a id="4"></a>

## 4  Stuffing & Flow-Resistivity (σ)

Stuffing sets resistive loss (damping) and modestly lowers effective sound speed—model this in simulation.

### 4.1  Typical σ Ranges (ISO 9053)

| Material | σ (Rayl m⁻¹) | Notes |
|----------|--------------|-------|
| Long-fibre wool (10–15 kg m⁻³) | 3 000–6 000 | Lower density → lower σ. |
| Polyester (Dacron)            | 2 000–5 000 | Fibre denier & packing dependent. |
| Glass wool 11 kg m⁻³          | 4 000–9 000 | Wide spread vs fibre size. |
| Mineral wool 32 kg m⁻³        | 9 500–15 000|  |
| **Mineral wool 60 kg m⁻³**    | **15 000–20 000** | Rigid boards (e.g. OC 705). |

> **Note:** ASTM C522 test fixtures are calibrated up to ~10 000 Rayl m⁻¹. Reported values above 15 000 Rayl m⁻¹ carry higher uncertainty and may **over-damp** the line if used indiscriminately.

### 4.2  Gradient example

```

0–0.33 L\_phys : σ 3–4 kRayl m⁻¹
0.33–0.66     : σ 4–6 kRayl m⁻¹
0.66–1.00     : thin lining σ ≥ 10 kRayl m⁻¹

```

Aim for secondary impedance peaks ≤ 3 dB.

---

<a id="5"></a>

## 5  Panel & Seal Control

* **CLD**: visco-elastic layer + ≥ 1.5 g cm⁻² added mass, pushing panel modes > 300 Hz.  
* **Hermetic sealing**: PU sealant or slow epoxy on every seam; leaks raise F<sub>b</sub> & spoil damping.  

---

<a id="6"></a>

## 6  DSP Crossover & Time Alignment

(**unchanged** — still LR4 + delay + invert-and-null routine)

---

<a id="7"></a>

## 7  Measurement Workflow (Quasi-Anechoic)

(**unchanged**)

---

<a id="8"></a>

## 8  Room Integration

(**unchanged**)

---

<a id="9"></a>

## 9  Glossary (RMS standard)

| Symbol | Meaning | Units |
|--------|---------|-------|
| c | Speed of sound (≈ 343 m s⁻¹ @ 20 °C) | m s⁻¹ |
| ρ | Air density (≈ 1.205) | kg m⁻³ |
| F<sub>s</sub>, F<sub>b</sub> | Driver free-air / line tuning freq. | Hz |
| L<sub>ac</sub>, L<sub>phys</sub> | Acoustic / physical line lengths | m |
| S<sub>0</sub>, S<sub>L</sub> | Throat / vent areas | m² |
| ΣS<sub>d</sub> | Total piston area | m² |
| TR | Taper ratio | — |
| **DR** | **Resistance Factor (King)** | — |
| U<sub>pk</sub> | Peak volume velocity | m³ s⁻¹ |
| V<sub>vent</sub> | Peak vent velocity | m s⁻¹ |
| X<sub>pk</sub>, X<sub>max</sub> | Peak / max excursion | m |
| V<sub>d</sub> | Displacement volume | m³ |
| p<sub>rms</sub> | RMS pressure @ r | Pa |
| σ | Flow resistivity | Rayl m⁻¹ |

---

<a id="10"></a>

## 10  Core Equations (RMS, half-space)

1. **Acoustic length** L<sub>ac</sub> = c ⁄ (4 F<sub>b</sub>)  
2. **Physical length** L<sub>phys</sub> = **DR** × L<sub>ac</sub>  
3. **Volume velocity** U<sub>pk</sub> = 2π f X<sub>pk</sub> ΣS<sub>d</sub>  
4. **Vent velocity** V<sub>vent</sub> = U<sub>pk</sub> ⁄ S<sub>L</sub>  
5. **Peak pressure** p<sub>pk</sub> = ρcU<sub>pk</sub> ⁄ (2πr)  
6. **RMS pressure** p<sub>rms</sub> = p<sub>pk</sub> ⁄ √2  
7. **SPL** SPL = 20 log₁₀(p<sub>rms</sub> ⁄ 20 µPa)  

> **Note:** For **free-field radiation** (4π sr), replace 2π with 4π in Equations 5-7.

---

<a id="11"></a>

## 11  Worked Example — Tang-Band W3-1876S Pair

*Numerical values unchanged — DR replaces SF in notation.*

| Step | Result |
|------|--------|
| Tuning | F<sub>b</sub> = 41.3 Hz |
| L<sub>ac</sub> | 2.08 m |
| TR | 0.5 |
| **DR** | 0.87 |
| L<sub>phys</sub> | 1.81 m |
| … | *(remaining values identical to previous edition)* |

---

<a id="12"></a>

## 12  Checklist

*(unchanged)*

---

<a id="13"></a>

## 13  References

1. Bailey, A. R., “A Non-Resonant Loudspeaker Enclosure Design,” *Wireless World*, Oct 1965.  
2. King, M. J., **Quarter-Wave Speaker Design equations and theory, <http://www.quarter-wave.com> (archived)**, 2003-2018.  
3. King, M. J., "Classic Transmission-Line Enclosure Alignment Tables," Rev 2006.  
4. Allison, D., “Advanced TL Speaker Design,” AES Paper 9874, 2024.  
5. Beranek, L. L., *Acoustics*, McGraw-Hill, 1954.  
6. ISO 226:2023, *Equal-loudness-level contours*.  
7. ISO 9053:1991, *Determination of airflow resistance*.  
8. Bohn, D., “Linkwitz-Riley Crossovers: A Primer,” RaneNote 160, 2005.  
9. Elliott, R., “Baffle Step Compensation,” ESP Audio, 2024.  
10. Purifi Audio, “Crossover Integration Best-Practice,” Tech Note TN-C001, 2023.  
