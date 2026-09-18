# GridWise — LLM-Assisted Smart Campus Energy Optimizer

GridWise is an HTTP API service for the BUP CSE Fest 2026
Smart Campus Energy Optimization Challenge.

The service accepts:

- a 24-hour synthetic energy scenario
- 1–3 natural-language operator notes
- battery constraints

It then:

1. interprets every operator note using a language-capable
   generative model;
2. converts each note into a machine-checkable directive;
3. validates the LLM output using deterministic guardrails;
4. applies the directives to the optimization model;
5. solves the 24-hour energy scheduling problem using
   linear programming;
6. independently replays the resulting schedule;
7. returns the validated 24-hour plan and recalculated metrics.

---

## Architecture

```text
Operator Notes
      |
      v
+----------------------+
| Language Model       |
| Note Interpretation  |
+----------+-----------+
           |
           v
+----------------------+
| Deterministic        |
| Guardrails           |
| Schema + Semantics   |
+----------+-----------+
           |
           v
+----------------------+
| Directive Application|
| Solar / Battery /    |
| Grid Constraints     |
+----------+-----------+
           |
           v
+----------------------+
| Linear Programming   |
| SciPy HiGHS Solver   |
+----------+-----------+
           |
           v
+----------------------+
| Independent Replay   |
| Validator            |
+----------+-----------+
           |
           v
      Valid JSON
```
