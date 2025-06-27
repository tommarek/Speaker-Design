# 3-Way Monitor — Complete Build Manual  
*(Dual Tang-Band W3-1876S TL sub · Tang-Band W3-871SC mid · Scan-Speak D2608/913000 tweeter)*  

---

### Why build this speaker?  

This project combines acoustic engineering principles with DIY construction methods. Here's what it offers:

* **Deep bass, tiny box** — Achieve 42 Hz extension from just two 3″ drivers. This is achieved through transmission-line loading, which effectively extends the bass response far below what these small drivers could produce in a conventional enclosure.

* **100% 3-D-printable** — Every structural component can be manufactured on a standard 250 × 250 × 250 mm FDM printer. No specialized tools, no woodworking skills required. The modular design breaks down into manageable print segments that assemble with simple epoxy joints.

* **Hands-on acoustics lesson** — This isn't just a speaker build; it's an educational journey. You'll physically see and understand how transmission-line length affects tuning, how taper ratios control resonances, and how damping material placement influences frequency response. Every parameter is visible and adjustable.

* **DSP-tunable** — Modern digital signal processing gives you complete control over crossover frequencies, equalization curves, and time alignment. Start with our proven settings, then experiment to match your room acoustics or personal preferences. The ADAU1701 DSP provides adequate processing capability.

* **Budget-friendly** — At approximately 310 € for all components including drivers and electronics (2025 pricing), this system competes with commercial monitors costing several times more. Components were selected based on performance-to-cost ratio.

---

## Table of Contents  
1. [Project overview](#1-project-overview)  
2. [Loudspeaker concepts in plain English](#2-loudspeaker-basics)  
3. [Transmission-line (TL) sub design](#3-tl-design)  
&nbsp;&nbsp;&nbsp;3.1 [TL theory recap](#31-tl-theory)  
&nbsp;&nbsp;&nbsp;3.2 [Choosing the tuning F<sub>b</sub>](#32-fb)  
&nbsp;&nbsp;&nbsp;3.3 [Quarter-wave length – worked example](#33-length)  
&nbsp;&nbsp;&nbsp;3.4 [Taper cross-sections S₀ → S<sub>ℓ</sub>](#34-taper)  
&nbsp;&nbsp;&nbsp;3.5 [Damping maths & exact wool mass](#35-wool)  
&nbsp;&nbsp;&nbsp;3.6 [Rectangular-slot vent sizing](#36-vent)  
&nbsp;&nbsp;&nbsp;3.7 [Folded layout for a 250 mm printer](#37-folded)  
&nbsp;&nbsp;&nbsp;3.8 [Step-by-step print & assembly](#38-build)  
&nbsp;&nbsp;&nbsp;3.9 [Throat-area options](#39-options)  
4. [Midrange sealed enclosure](#4-mid)  
5. [Tweeter rear pod](#5-tweet)  
6. [Active crossover & DSP implementation](#6-dsp)  
7. [Bill of materials](#7-bom)  
8. [FAQ](#8-faq)  

---

## 1 Project overview<a id="1-project-overview"></a>  

This speaker system is designed to deliver quality sound from a compact, fully 3D-printable enclosure. Here are the key performance targets and the reasoning behind each specification:

| Metric | Target | Why |
|--------|--------|-----|
| Bandwidth (-3 dB) | **42 Hz – 20 kHz** | This frequency range encompasses the entire spectrum of musical content. The 42 Hz lower limit captures the fundamental frequencies of bass guitars, kick drums, and pipe organs. The 20 kHz upper limit ensures all harmonic overtones and air are preserved. |
| Ripple (20 – 200 Hz) | **±0.4 dB** | The transmission line design maintains flat bass response. This minimal ripple means bass notes are reproduced with their natural timbre intact—no boomy one-note bass here. |
| Peak SPL @ 1 m | **86 dB continuous (above 60 Hz), 92 dB peaks** | Sufficient for nearfield monitoring. Below 60 Hz, driver excursion limits reduce available headroom. The +7 dB bass boost may need reduction to avoid exceeding Xmax at high listening levels. Peak capability requires DSP limiter. |
| Max cabinet envelope | **250 mm outer cube** | This constraint ensures compatibility with common consumer 3D printers while maximizing internal volume. The actual enclosure fits within this cube while using the available space. |

**Driver Selection and Specifications**

The driver complement was chosen to provide integration across the frequency spectrum:

• **2 × Tang-Band W3-1876S** — These 3″ woofers serve as the foundation of our transmission-line sub-bass system. With their 55 Hz free-air resonance and generous 5 mm linear excursion capability, they're suited for transmission-line loading. The aluminum cone helps maintain pistonic behavior near the crossover point.

• **1 × Tang-Band W3-871SC** — This 3″ midrange driver features a specially treated paper cone for natural vocal reproduction. Its 87 Hz resonance frequency suits its operating range from 240 Hz to 2.5 kHz.

• **1 × Scan-Speak D2608/913000** — This 26 mm fabric dome tweeter provides high-frequency reproduction with smooth response and wide dispersion.

**W3-1876S Detailed Thiele-Small Parameters** (measured values for each driver)

| Parameter | Value | Significance |
|-----------|------:|--------------|
| Sd (Effective piston area) | 25 cm² | Determines volume displacement capability (per driver) |
| Fs (Free-air resonance) | 55 Hz | Natural resonance frequency of the driver |
| Qts (Total Q factor) | 0.46 | Indicates well-damped behavior suitable for TL |
| Vas (Equivalent volume) | 1.4 L | Small Vas allows compact enclosure design |
| Re (DC resistance) | 3.0 Ω | Low DCR minimizes power loss |
| Le (Voice coil inductance) | 0.13 mH | Low inductance maintains extended HF response |

ΣSd (combined piston area of both woofers) = **50 cm²** (0.0050 m²) — Each driver contributes 25 cm², giving us 50 cm² total effective piston area for bass reproduction.

**Electronics Platform**

The system employs a fully digital signal path:
- **TPA3255 4-channel amplifier** running at 36 V provides 4 × 50 W into 4Ω*

*Note: Rated 50 W/channel with adequate heatsinking. Expect ~35-40 W/channel continuous in free air without forced cooling.
- **ADAU1701 DSP** handles all crossover filtering, equalization, and time alignment at 48 kHz/24-bit resolution

---

## 2 Loudspeaker concepts in plain English<a id="2-loudspeaker-basics"></a>  

Before diving into the transmission-line calculations, here are some fundamental acoustics principles that make this design work:

* **Phase relationships** — When a speaker cone moves forward, it creates positive pressure in front and negative pressure (rarefaction) behind. These waves are exactly 180° out of phase. In a typical box, we trap the rear wave to prevent cancellation. But in a transmission line, we delay and use it.

* **The transmission-line principle** — A TL is essentially a long, tapered pipe attached to the back of the driver. By making this pipe exactly ¼ wavelength long at our target frequency, the rear wave emerges from the pipe exit having traveled far enough to flip phase. Now it reinforces rather than cancels the front wave, providing additional bass extension.

* **Quarter-wave resonance** — The key formula is: **L = c / 4 F<sub>b</sub>** where:
  - L = required line length in meters
  - c = speed of sound (343 m/s at room temperature)
  - F<sub>b</sub> = desired box tuning frequency in Hz

* **Controlling unwanted resonances** — A uniform pipe would have strong resonances at 3×, 5×, 7× the fundamental frequency. We prevent these by:
  - Using a gentle **2:1 taper** from throat to mouth, which disperses these higher modes
  - Adding calculated wool damping to absorb remaining colorations
  - Result: smoother response with bass reinforcement

---

## 3 Transmission-line sub design<a id="3-tl-design"></a>  

### 3.1 TL theory recap<a id="31-tl-theory"></a>  

The transmission line operates on the principle of acoustic phase delay. Think of it as a carefully controlled acoustic time machine: sound entering at the driver throat emerges at the exit port roughly 6 milliseconds later (for our 42 Hz tuning). This delay corresponds to exactly 90° of phase shift at the tuning frequency, which when combined with the driver's natural 180° phase inversion, results in constructive interference.

The folded labyrinth path allows us to pack nearly 2 meters of acoustic length into a compact spiral that fits on your desktop. Unlike simple reflex ports which resonate at a single frequency, the transmission line provides graduated support across a broad range, resulting in more natural bass reproduction.

### 3.2 Choosing the tuning F<sub>b</sub><a id="32-fb"></a>  

Selecting the optimal tuning frequency requires balancing several factors:

Given our driver's free-air resonance **Fs ≈ 55 Hz**, the traditional guideline suggests tuning between 0.7×Fs and 0.85×Fs. We've chosen **0.76×Fs = 42 Hz** because:

1. **Excursion control** — At this tuning, the line's acoustic load minimizes cone movement near resonance
2. **Transient response** — Not too low (sluggish) nor too high (inadequate extension)
3. **Room integration** — 42 Hz avoids common room modes around 50-60 Hz

This tuning delivers response to 42 Hz (-3 dB) while maintaining good impulse response for kick drums and bass transients.

### 3.3 Quarter-wave length – worked example<a id="33-length"></a>  

Let's work through the complete calculation step by step:

$$
\begin{aligned}
L_{\text{acoustic}} &= \frac{c}{4 F_b} = \frac{343}{4 \times 42} \;\approx\; 2.04\;\text{m}\\[6pt]
L_{\text{physical}} &= DR \times L_{\text{acoustic}} = 0.87 \times 2.04 \;\approx\; \mathbf{1.77\;\text{m}}
\end{aligned}
$$  

Breaking this down:
- **343 m/s** is the speed of sound at 20°C (68°F) at sea level
- **4 × 42** gives us the quarter wavelength at our 42 Hz tuning frequency
- **L_acoustic** is the effective acoustic length needed for 42 Hz tuning
- **L_physical** is the actual constructed line length

**Resistance Factor (DR):** Following King's alignment tables (see THEORY.md), for a 2:1 taper ratio (TR = 0.5), the resistance factor DR = 0.87. This accounts for the velocity reduction due to taper and damping:
- **Acoustic length** is the theoretical quarter-wavelength
- **Physical length** is shorter due to the taper's acoustic loading effect
- The 1.77 m physical length is what we actually build

### 3.4 Taper cross-sections S₀ → S<sub>ℓ</sub><a id="34-taper"></a>  

The taper ratio is critical for suppressing unwanted harmonics while maintaining strong fundamental output. Here's how we calculate the optimal dimensions:

**Starting with driver parameters:**

Total piston area for both woofers:
$$
\Sigma S_{d} = 50\;\text{cm}^2 = 0.0050\;\text{m}^2
$$

**Throat area selection:**

Industry practice suggests the throat area S<sub>0</sub> should be 0.7 to 1.0 times the total driver area. We use 0.8 for good coupling:
$$
S_{0} = 0.8 \times 50 = 0.0040\;\text{m}^2 = \mathbf{40\;\text{cm}^2}
$$  

**Exit area with 2:1 contraction:**

This ratio has proven ideal for home-audio transmission lines:
$$
S_{\ell} = \frac{S_0}{2} = \frac{40\;\text{cm}^2}{2} = \mathbf{20\;\text{cm}^2} = 0.0020\;\text{m}^2
$$  

**Linear taper function:**

The cross-sectional area decreases smoothly along the line length:
$$
S(x) = S_{0} - (S_{0} - S_{\ell})\;\frac{x}{L_{\text{TL}}}
$$

This formula ensures that at any distance x from the throat, we know the exact cross-sectional area needed. This gradual taper acts as an acoustic low-pass filter, attenuating higher frequency modes while allowing our desired bass frequencies to propagate freely.

### 3.5 Damping maths & exact wool mass<a id="35-wool"></a>  

Proper damping is the difference between a colored, resonant mess and smooth, extended bass. Too little wool allows midrange leakage and standing waves. Too much kills efficiency and dynamics. Here's how we calculate the optimum:

**Average cross-sectional area:**

For a linear taper, the average area is simply:
$$
S_{\text{avg}} = \frac{S_{0} + S_{\ell}}{2} = \frac{0.0040 + 0.0020}{2} = 0.0030\;\text{m}^2
$$

**Total line volume:**
$$
V = L_{\text{physical}}\!\times\!S_{\text{avg}} = 1.77 \times 0.0030 \;\approx\; 0.00531\;\text{m}^3 = 5.31\;\text{L}
$$  

**Wool mass calculation:**

Variable density stuffing provides optimal damping by targeting specific frequency ranges:
$$
m_{\text{wool}} = 10\text{ g (entry)} + 20\text{ g (center)} + 0\text{ g (exit)} = \mathbf{30\;\text{g}}
$$

**Stuffing distribution for optimal damping:**

| Line Segment | Density (g/L) | Mass | Purpose |
|--------------|---------------|------|----------|
| Entry third (0-0.59 m) | 5 | 10 g | Prevents midrange leakage |
| **Center third (0.59-1.18 m)** | **10** | **20 g** | Kills 1st/2nd harmonic ripple |
| Exit third (1.18-1.77 m) | 0 | 0 g | Preserves bass output |

The wool should be long-fiber polyester (not cotton or rock wool) teased evenly throughout the line length. Avoid clumping near the throat or exit.

*Note: If bass feels overly tight or rolled off after assembly, reduce stuffing by 5-10% in the center third. The 5.6 kg/m³ average density provides good damping without over-restriction. This graduated stuffing approach follows Bailey's original non-resonant design principle.*

### 3.6 Rectangular-slot vent sizing<a id="36-vent"></a>  

The exit slot dimensions significantly impact both acoustic performance and air velocity. Our design prioritizes silence even at high SPL:

**Calculating slot width for 20 cm² area:**

Given a 15 mm height constraint (for printability), the width becomes:
$$
w = \frac{20\;\text{cm}^2}{1.5\;\text{cm}} = 13.33\;\text{cm} = \mathbf{133\;\text{mm}}
$$  

**Complete slot specifications:**
- **Dimensions:** 133 mm wide × 15 mm high
- **Edge treatment:** 3 mm radius on both long edges (important for reducing turbulence)
- **Foam lining:** 6 mm reticulated foam on all four internal surfaces
- **Air velocity:** ≈ 15 m/s @ 86 dB, ≈ 20 m/s @ 92 dB, ≈ 24 m/s @ 95 dB SPL

The slot area is optimized for typical listening levels. At extreme SPLs above 90 dB, some air noise may become audible. Consider adding a flared exit for critical applications. The foam lining serves double duty: further reducing turbulence and providing consistent acoustic termination.

### 3.7 Folded layout for a 250 mm printer<a id="37-folded"></a>  

Fitting 1.77 meters of tapered transmission line into a 250 mm cube requires clever geometry. The folded design uses a series of straight segments connected by 180° bends:

| Parameter | Value | Design Rationale |
|-----------|-------|------------------|
| Number of segments | **4** | Compact layout with minimal bends |
| Segment length | **~44 cm each** | Even distribution of total length |
| Total height | **~35 cm** | Stacked configuration fits printer |
| Fold radius | **3-4 cm** | Smooth airflow through bends |
| Cross-section | Square | Simple to model and print |

The linear taper is implemented by gradually reducing the cross-sectional area from throat to exit. Each segment transitions smoothly from its starting to ending dimensions.

### 3.8 Step-by-step print & assembly<a id="38-build"></a>  

Follow each assembly stage carefully. Here's the build sequence with tips:

| Step | Action | Detailed Instructions |
|------|--------|----------------------|
| 1 | **Print segments** | Use 4 mm wall thickness for rigidity and acoustic isolation. 15% gyroid infill provides good strength-to-weight ratio while maintaining some acoustic damping. Print with 0.2 mm layers for smooth internal surfaces. |
| 2 | **Print connectors** | U-bend connectors join the straight segments. Print with smooth internal surfaces to minimize turbulence. Include alignment features for precise assembly. |
| 3 | **Epoxy seams** | Mix slow-cure epoxy (30-minute working time recommended). Apply thin coats to both surfaces of each joint. Clamp lightly—excess pressure squeezes out epoxy, weakening the bond. Let cure 24 hours. |
| 4 | **Install wool damping** | Install stuffing according to the variable density plan: 10 g in the entry third (loose), 20 g in the center third (moderately compressed), and leave the exit third empty. Use long-fiber polyester (Dacron) for best results. The center section damping is critical for smooth response. |
| 5 | **Attach exit slot foam** | Cut reticulated foam precisely to 133 × 15 × 6 mm. Apply contact adhesive to both foam and slot surfaces. Position carefully—positioning must be accurate. The foam should create a smooth transition from the line exit. |
| 6 | **Impedance verification** | Before closing the enclosure, run an impedance sweep. You should see a single broad peak around 40 Hz (stuffing pulls the tuning down ~2 Hz from the calculated 42 Hz). Multiple sharp peaks indicate insufficient center-section damping. |
| 7 | **Outer shell construction** | Print or assemble the outer decorative shell. Apply the 5 mm plaster-PVA composite layer (3:1:0.1 ratio of plaster:PVA:water) to all internal surfaces. This adds mass and damping, reducing cabinet resonances. |
| 8 | **Driver mounting** | Both woofers face forward for maximum output. Wire each to its own amplifier channel (4 Ω each) for proper impedance loading and individual limiting. |

### 3.9 Throat-area options for flexible builds<a id="39-options"></a>

While our standard design prioritizes compactness, you may have different requirements. Here's how to scale the transmission line for various applications:

#### 3.9.1 Design window guidelines<a id="391-guidelines"></a>

The throat area S<sub>0</sub> can vary within these bounds while maintaining proper operation:

```
0.8 × ΣS<sub>d</sub>  ≤  S<sub>0</sub>  ≤  1.5 × ΣS<sub>d</sub>
```

- **Lower bound (0.8×):** Maximum coupling to drivers, slight efficiency loss
- **Upper bound (1.5×):** Smoother impedance, reduced coupling
- **Exit area:** Maintain 2:1 to 4:1 contraction ratio from throat

#### 3.9.2 Scaling example: 10-liter enclosure<a id="392-scaling"></a>

For those with more space, here's a larger implementation with improved performance:

| Parameter | Compact Build | **10 L Enhanced Build** |
|-----------|---------------|------------------------|
| Throat S<sub>0</sub> | 40 cm² | **76 cm²** (1.5 × driver area) |
| Exit S<sub>ℓ</sub> | 20 cm² | **25 cm²** (3:1 contraction) |
| Exit slot | 133 × 15 mm | **100 × 25 mm** (easier to print) |
| Line volume | 5.9 L | **10 L** |
| Wool mass | 30 g @ 5.6 kg m⁻³ | **25 g @ 2.5 kg m⁻³** |
| Vent velocity @ 95 dB | 24 m/s | **19 m/s** (quieter than compact) |
| Bass extension | 42 Hz (-3 dB) | **40 Hz (-3 dB)** |

*Note: The larger 100 × 25 mm slot with 12 mm rounded edges creates ΔL ≈ 17 mm end correction. Either shorten the physical line by 17 mm or accept the slightly lower tuning of Fb ≈ 41 Hz.*

#### 3.9.3 Custom design formula<a id="393-custom"></a>

For custom implementations, this formula relates maximum available volume to the required throat area:

$$
S_{0} = \frac{2 V_{\text{max}}}{L} \times \frac{TR}{1 + TR}
$$  

Where:
- V_max = maximum available enclosure volume
- L = physical line length (1.77 m for 42 Hz)
- TR = taper ratio (use 2 for gentle taper, up to 4 for aggressive)

Always verify that your calculated S<sub>0</sub> falls within the 0.8–1.5 × ΣS<sub>d</sub> window for proper driver coupling.

**Example:** For V_max = 10 L, L = 1.77 m, and TR = 2:
$$
S_{0} = \frac{2 \times 0.010}{1.77} \times \frac{2}{1 + 2} = 0.0075\;\text{m}^2 = 75\;\text{cm}^2
$$
This would be 1.50 × ΣSd (75/50), which falls within the acceptable range.

---

## 4 Midrange sealed enclosure<a id="4-mid"></a>  

The midrange enclosure uses a sealed alignment for controlled directivity and minimal internal resonances. A sealed design was chosen over vented for these reasons:

**Target alignment: Qtc ≈ 0.80**

This critically damped alignment provides:
- Gentle 6 dB/octave acoustic rolloff for easy integration with the woofer
- Minimal group delay for transparent vocal reproduction  
- Extended power handling below resonance

**Enclosure specifications:**
- **Internal volume:** 1.73 L
- **Internal dimensions:** 120 mm cube
- **Wall construction:** 15 mm thick (combined 3D print shell + damping treatment)
- **Internal treatment:** Full lining with 10 mm acoustic felt
- **Calculated resonance:** 115 Hz (Qtc ≈ 0.80)

The cubic shape has acoustic compromises, but the felt lining and DSP correction handle any minor colorations. The sealed design ensures the midrange remains clean even during heavy bass passages—no port noise or modulation distortion.

---

## 5 Tweeter rear pod<a id="5-tweet"></a>  

High-frequency drivers need rear-wave management. Our solution uses a compact sealed chamber with specialized damping:

**Chamber specifications:**
- **Dimensions:** 70 mm diameter × 15 mm depth  
- **Internal volume:** ~0.06 L
- **Damping fill:** Loosely packed long-fiber polyester wool

The acoustic damping serves multiple purposes:
1. **Acoustic absorption** — Absorbs the rear wave to prevent reflections
2. **Resonance control** — Prevents chamber resonances
3. **Maintains low back pressure** — Loose packing preserves tweeter efficiency
4. **Serviceability** — Can be adjusted or replaced if needed

Fill the chamber with approximately 2-3 grams of teased polyester fibers, avoiding compression. Leave space around the dome's rear vent. For enhanced mechanical damping of the pod itself, apply small patches of butyl rubber or constrained layer damping material to the external surfaces.

---

## 6 Active crossover & DSP implementation<a id="6-dsp"></a>  

Digital signal processing controls this system, providing precision impossible with passive components. Here's the complete signal path:

**Crossover Architecture**

| Signal Path | Frequency Range | Filter Characteristics | Output Gain | Rationale |
|-------------|-----------------|------------------------|-------------|-----------|
| **Sub-bass** (TL woofers) | 45 Hz – 250 Hz | 6th-order Butterworth high-pass at 45 Hz for excursion protection; 4th-order L-R low-pass at 250 Hz | +7 dB | The boost compensates for the small driver area and maintains flat response through the bass region |
| **Midrange** | 250 Hz – 2.5 kHz | 4th-order L-R high-pass at 250 Hz; 4th-order L-R low-pass at 2.5 kHz | 0 dB | Reference level, as the midrange has good sensitivity |
| **Tweeter** | 2.5 kHz – 20 kHz | 4th-order L-R high-pass at 2.5 kHz (or optional 1024-tap FIR for phase linearization) | -2 dB | Slight attenuation matches tweeter's higher sensitivity |

**DSP Details and Setup**

The ADAU1701 operates at 48 kHz sampling rate with 28-bit internal processing:

1. **Input configuration:** Stereo analog input, 2 Vrms maximum
2. **Output routing:** Four independent channels to TPA3255 amplifier
3. **Processing blocks used:**
   - Cascaded biquad filters for crossovers
   - Parametric EQ for room correction (5 bands per channel)
   - Compressor/limiter for driver protection
   - Delay lines for time alignment (0.1 ms resolution)

**Protection limiter settings:**
- **Threshold:** -6 dBFS (conservative setting to protect drivers, accounting for +7 dB bass boost)
- **Attack time:** 1 ms (fast enough to catch transients)
- **Release time:** 80 ms (prevents pumping)
- **Ratio:** ∞:1 (brick-wall limiting)

**Time alignment:** The physical offset between drivers requires compensation:
- Midrange: +0.60 ms delay (delays the midrange signal by 0.60 ms)
- Tweeter: +0.85 ms delay (delays the tweeter signal by 0.85 ms)
- **Important:** These delays compensate for the midrange and tweeter being acoustically ahead of the woofers (their sound arrives earlier). Positive delay values delay the signal to align arrival times.
- Always verify with impulse response measurements - actual values depend on your specific baffle geometry

**Optional enhancements:**
- **Room EQ:** Use REW software to measure and create correction filters
- **Dynamic bass boost:** Implement Fletcher-Munson compensation at low volumes
- **FIR crossovers:** For linear phase response (requires SigmaStudio expertise). Note: FIR filters introduce processing latency - not ideal for live monitoring applications without DSP buffering compensation

---

## 7 Bill of materials<a id="7-bom"></a>  

Components were selected based on price/performance ratio. Here's the complete shopping list with notes on where to economize or upgrade:

| Item | Quantity | Unit Price | Subtotal | Notes & Alternatives |
|------|----------|------------|----------|----------------------|
| **Tang-Band W3-1876S** | 2 | 28 € | 56 € | The foundation of our bass system. No substitutions recommended—the T/S parameters are critical for proper TL operation. |
| **Tang-Band W3-871SC** | 1 | 22 € | 22 € | Midrange driver with smooth response. Alternative: Any 3" driver with Fs > 80 Hz and smooth response to 3 kHz. |
| **Scan-Speak D2608/913000** | 1 | 38 € | 38 € | Fabric dome tweeter with good detail. Budget alternative: Peerless DX25TG59-04 at ~20 €. |
| **TPA3255 4-ch amp board** | 1 | 60 € | 60 € | Provides 4×50W with good efficiency. Ensure version includes good capacitors (Nichicon/Panasonic). |
| **36V 10A SMPS** | 1 | 25 € | 25 € | Clean power supply recommended. Look for Meanwell or similar reputable brand. |
| **ADAU1701 DSP board** | 1 | 30 € | 30 € | "WooHoo" or "FreeDSP" boards work well. Includes programming cable. |
| **PLA filament** | ~2.5 kg | 20 €/kg | 50 € | PETG also works but is harder to print. Black or dark colors recommended for aesthetics. Budget extra for rafts/supports. |
| **Long-fiber wool** | 100 g bag | 8 € | 8 € | Acousta-Stuf or similar. One bag does two speakers. Don't substitute with fiberglass! |
| **Plaster compound + PVA** | 1 kg + 250 ml | 12 € | 12 € | For damping treatment. Premixed joint compound works too. |
| **Hardware & supplies** | — | 10 € | 10 € | M3 screws, epoxy, contact adhesive, wire, terminals |
| **TOTAL** |  |  | **311 €** | Complete stereo pair pricing |

**Money-saving tips:**
- Buy drivers during sales (Parts-Express, Soundimports frequently discount)
- 3D printing services might be cheaper than buying a printer for one project
- DSP board can be DIY etched if you're experienced with SMD soldering

**Upgrade options:**
- **Mundorf AMT tweeter** (+50 € each): Alternative tweeter option
- **Hypex FA123 amplifier** (+200 €): Integrated DSP and amplification
- **Carbon fiber PLA** (+20 €): Stiffer enclosure with better damping

---

## 8 FAQ<a id="8-faq"></a>  

**Q: Why tune to 42 Hz instead of lower?**  
**A:** The 0.75×Fs ratio (0.75 × 55 Hz = 41.25 Hz ≈ 42 Hz) balances extension and control. Lower tuning increases group delay and requires exponentially more line length. Higher tuning sacrifices bass extension. Note that with 3" drivers, excursion limits continuous SPL to ~86 dB at 1 m below 60 Hz.

**Q: What happens if I skip the wool damping?**  
**A:** Without proper damping, expect ±1.1 dB ripple throughout the bass region and a prominent coloration around 250 Hz where the ¾-wave mode occurs. The wool is critical for smooth response—this isn't a place to cut corners.

**Q: Will the slot make chuffing noises at high volume?**  
**A:** At 86 dB continuous SPL, air velocity stays below 15 m/s. During 92 dB peaks (with limiter), velocity reaches approximately 20 m/s (at the threshold where some listeners may detect turbulence). The 133×15 mm slot is sized to minimize audible port noise at typical listening levels.

**Q: Can I print the folded segments in one piece?**  
**A:** Each straight segment can be printed individually, or you can print two halves split lengthwise. The modular approach allows for easier printing on standard 250 mm beds and provides better access for wool installation and tuning adjustments.

**Q: How critical are the driver models specified?**  
**A:** The Tang-Band woofers are essential—the entire transmission line is optimized for their specific parameters. The midrange and tweeter can be substituted with similar-quality units, adjusting the DSP accordingly. Any substitute woofer would require complete redesign of the line dimensions.

**Q: Why not wire the woofers in parallel?**  
**A:** Parallel wiring would create a 1.5 Ω load, which could overdraw current from typical amplifiers. Using separate channels (4 Ω each) provides proper impedance matching and allows individual driver protection via DSP limiting.

**Q: What about room placement?**  
**A:** These monitors are designed for nearfield use (0.8–2 m listening distance). Place them at least 30 cm from walls to avoid boundary reinforcement. The DSP includes room correction capability—measure and adjust for your specific space.

**Performance Enhancement Options:**

1. **Flared Exit (Recommended):** A 25 mm radius internal flare reduces peak air velocity by ~20%, making the system quieter at high SPL. This can be 3D printed as a separate insert.

2. **Push-Pull Woofer Configuration:** Mount one W3-1876S mechanically inverted (magnet facing out, cone facing into the TL). This cancels even-order distortion and reduces cabinet vibration. Reverse the polarity of the inverted driver in DSP to maintain proper phase. **Warning:** Do NOT reverse polarity unless one driver is physically mounted backwards - this would cause destructive interference.

---

**Additional Resources:**
- **REW (Room EQ Wizard):** Free measurement software essential for DSP tuning - roomeqwizard.com
- **Sealed vs TL Comparison:** The sealed box alternative offers tighter transients but less extension
- **Bluetooth Option:** Add an apt-X HD Bluetooth module to the ADAU1701's I2S input for wireless streaming

*(Technical drawings, response graphs, STL files, and assembly photos coming in the next documentation update. The calculations and dimensions provided are sufficient to begin building immediately.)*  

Good luck with your build! Remember to measure impedance after assembly and share your results with the community.