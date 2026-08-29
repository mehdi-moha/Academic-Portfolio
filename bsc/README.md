## Contents

- [Algorithms Design](#algorithms-design)
- [Artificial Intelligence](#artificial-intelligence)
- [Bachelor’s Project](#bachelors-project)
- [Computer Architecture Lab](#computer-architecture-lab)
- [Electronic Lab](#electronic-lab)
- [Microprocessor 1](#microprocessor-1)
- [Microprocessor Lab](#microprocessor-lab)
- [Principles of Compiler Design](#principles-of-compiler-design)

---

## Algorithms Design

### Project 1: Matrix Chain Multiplication
Implementation of the Matrix Chain Multiplication problem using Dynamic Programming. Computes optimal parenthesization with O(n³) time complexity using a bottom-up approach and cost table construction.

### Project 2: Subset Sum Problem
Implementation of the Subset Sum problem using Dynamic Programming. Solves subset selection with state tracking (T1/T2/T12/F) to determine feasibility and reconstruct solution paths.

### Project 3: Binomial Coefficient Calculator
Implementation of Binomial Coefficient calculation using Dynamic Programming (Pascal’s Triangle). Optimized space complexity to O(k) using 1D array instead of 2D matrix.

---

## Artificial Intelligence

### Maze Solver
Implementation of pathfinding algorithms (BFS and A* Search) with Manhattan distance heuristic. Compares performance metrics including node expansion and queue operations for route optimization analysis.

---

## Bachelor’s Project

### Mano’s Basic Computer CPU Implementation (VHDL)

Complete hardware implementation of Mano’s Basic Computer CPU architecture focusing on core processor design and the Fetch-Decode-Execute cycle.

**Core Components:**
- **Control Unit:** Timing signal generation, instruction decoding with 3×8 decoder, and microoperation sequencing logic
- **16-bit ALU:** Arithmetic and logic operations (AND, ADD, complement, shift-left, shift-right, data transfer)
- **Registers:** AR (12-bit), PC (12-bit), DR (16-bit), AC (16-bit), IR (16-bit), TR (16-bit), SC (4-bit)
- **Memory Unit:** 4096×16 RAM with read/write control
- **Data Bus:** 16-bit common bus with 7-to-1 multiplexer and encoder-based selection
- **Control Flags:** E, I, IEN, FGI, FGO, R, S flip-flops

**Building Blocks Designed:**
- Generic n-bit register with clear/load/increment operations
- Hierarchical decoder design (4×16, 3×8 from 1×2 primitives)
- Register cell with JK flip-flop control logic
- One-bit ALU slice for modular 16-bit ALU construction
- Full adder and half adder components

**Implementation Features:**
- Structural VHDL with component instantiation
- Complete Fetch-Decode-Execute cycle
- Interrupt handling mechanism
- Memory-reference, register-reference, and I/O instruction set support
- Synchronous single-clock design

**Simulation:** Compatible with ModelSim/QuestaSim. A `test.do` simulation script is included for testing the design. Schematic diagrams are also provided for architecture visualization.

---

## Computer Architecture Lab

### Processor Design
Implementation of 8-bit ALU and datapath using Proteus simulation. Designed arithmetic and logic operations using 74LS181 ALU chips and 74-series registers with control signal management for multi-bit calculations.

---

## Electronic Lab

### Electronic Circuit Designs
Implementation and verification of various electronic circuits using Multisim software. Conducted circuit analysis, component testing, and performance measurement for lab experiments.

---

## Microprocessor 1

### Digital Clock
Implementation of real-time digital clock using 8051 Assembly Language with Timer0 interrupts and external interrupt handling (INT0/INT1). Features BCD conversion, hour/minute adjustment, and automatic 24-hour reset functionality in Multisim simulation environment.

---

## Microprocessor Lab

### LED Scrolling Display
Implementation of 8×8 LED matrix display controller using BASCOM-AVR with Timer interrupts for dynamic scanning. Features speed control, pause/resume functionality, and pattern animation with lookup table design in Proteus simulation environment.

---

## Principles of Compiler Design

### Simple Parser
Implementation of operator precedence parser using a stack-based algorithm. Performs syntax analysis with shift/reduce operations, grammar validation, and error detection for arithmetic expressions.

---
