# Second-Order Control System Analysis and Lead Compensator Design

A MATLAB project analyzing a second-order automatic control system and evaluating a lead compensator's effect on transient response.

## Project overview

The system is modeled with a natural frequency of `ωₙ = 41 rad/s` and damping ratio `ζ = 0.75`. The project examines the uncompensated unity-feedback system, designs a lead compensator, and compares the resulting response characteristics.

### Objectives

- Derive the open-loop and unity-feedback closed-loop transfer functions.
- Plot step response, impulse response, and root locus before compensation.
- Calculate transient performance metrics using MATLAB.
- Add a lead compensator and analyze the compensated system.
- Compare performance before and after compensation.
- Present an analog circuit representation of the compensator.

## Tools

- MATLAB
- Control System Toolbox (`tf`, `feedback`, `step`, `impulse`, `stepinfo`, and `rlocus`)

## System parameters

| Parameter | Value |
|---|---:|
| Natural frequency, `ωₙ` | 41 rad/s |
| Damping ratio, `ζ` | 0.75 |
| Compensator | `Gc(s) = 2(s + 30)/(s + 60)` |

The uncompensated forward transfer function is:

`G(s) = 1681 / (s² + 61.5s + 1681)`

The unity-feedback closed-loop transfer function before compensation is:

`T(s) = 1681 / (s² + 61.5s + 3362)`

## Results

The report records the following MATLAB performance metrics:

| Metric | Before compensation | After compensation |
|---|---:|---:|
| Rise time | 0.0293 s | 0.0205 s |
| Settling time | 0.0997 s | 0.0824 s |
| Overshoot | 14.0072% | 19.2024% |
| Peak time | 0.0644 s | 0.0480 s |
| Peak value | 0.5700 | 0.5960 |

The reported results show shorter rise, settling, and peak times after compensation. Overshoot increases to approximately the target of 20%, while the reported settling time remains below the required 2 seconds.



## How to run

1. Install MATLAB with Control System Toolbox.
2. Open `automatic_control_project.m` in MATLAB.
3. Run the script.
4. Review the Command Window output and generated figures.

