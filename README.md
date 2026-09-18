# 🎎 BUP CSE FEST 2026 | Build Energy Optimizer

[![Presentation Link](https://img.shields.io/badge/Presentation_Video-here-red)](https://isocpp.org/)
[![README](https://img.shields.io/badge/README-File-success)](https://www.microsoft.com/windows)
[![LIVE LINK](https://img.shields.io/badge/LIVE_HOST-LINK-yellow)](https://bup-fest-hackathon-team.onrender.com)

> A tool that helps you understand, measure, and reduce the energy cost of your software builds.

Build Energy Optimizer looks at your build process and turns it into something you can actually reason about — how long it runs, where the work happens, and how much energy it roughly consumes.

The goal isn't to make developers obsess over a number.

It's to make **build efficiency visible**.

---

## ✨ Why?

Modern software projects can trigger hundreds or thousands of compilation, testing, bundling, and packaging tasks.

A build that takes 30 seconds on your machine might seem harmless.

Run it hundreds of times across a team or CI pipeline, though, and those seconds add up.

Build Energy Optimizer explores a simple question:

> **Can we make software builds faster and more energy-efficient without making the developer experience worse?**

---

## 🚀 What it does

Build Energy Optimizer can:

- 📊 Monitor build execution
- ⚡ Estimate energy consumption
- ⏱️ Track build duration
- 🔍 Identify expensive build stages
- 📈 Compare builds and their efficiency
- 💡 Suggest possible optimizations
- 🤖 Use an LLM to turn measurements into practical recommendations

The project is designed to work alongside your existing development workflow rather than replacing it.

---

## 🧩 How it works

At a high level:

```text
                 ┌─────────────────┐
                 │   Your Project  │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │   Build Runner  │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │   Measurements  │
                 │                 │
                 │ • Duration      │
                 │ • Resource use  │
                 │ • Build stages  │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │ Energy Analysis │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │ Optimization    │
                 │ Recommendations │
                 └─────────────────┘
```

The measurements are the important part.

The AI layer is there to help interpret them — not to magically invent them.

---

## 🛠️ Tech Stack

The current version is built around:

- **Python**
- **FastAPI**
- **Uvicorn**
- **Docker**
- **LLM API** for optimization suggestions

The backend is intentionally kept lightweight so it can be deployed easily and extended later.

---

## 📁 Project Structure

```text
build-energy-optimizer/
│
├── app/
│   ├── main.py
│   ├── ...
│
├── requirements.txt
├── Dockerfile
├── .env.example
├── .gitignore
└── README.md
```

The structure may evolve as the project grows.

---

## ⚙️ Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/build-energy-optimizer.git
cd build-energy-optimizer
```

### 2. Create a virtual environment

```bash
python -m venv .venv
```

Activate it:

**Windows**

```bash
.venv\Scripts\activate
```

**Linux / macOS**

```bash
source .venv/bin/activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure environment variables

Create a `.env` file based on `.env.example`.

```env
LLM_API_URL=https://your-provider/v1/chat/completions
LLM_API_KEY=your-api-key
LLM_MODEL=your-model-name

LLM_TIMEOUT_SECONDS=20
LLM_MAX_TOKENS=2000
```

The LLM configuration is optional for the core measurement workflow.

### 5. Start the API

```bash
uvicorn app.main:app --reload
```

The API should now be available at:

```text
http://localhost:8000
```

Interactive API documentation:

```text
http://localhost:8000/docs
```

---

## 🐳 Running with Docker

Build the image:

```bash
docker build -t build-energy-optimizer .
```

Run it:

```bash
docker run --env-file .env -p 8000:8000 build-energy-optimizer
```

Then open:

```text
http://localhost:8000
```

---

## 🧠 About the AI part

The LLM isn't responsible for measuring energy consumption.

That's important.

The application first collects measurable information and performs its own analysis. The LLM can then use those results to explain potential bottlenecks and suggest optimization ideas.

For example, instead of simply saying:

```text
Build took 84 seconds.
```

the system can turn the collected information into something more useful:

```text
Most of the build time is being spent during dependency installation
and repeated compilation.

Consider caching dependencies and reusing unchanged build artifacts.
```

The recommendation should always be treated as a suggestion, not as ground truth.

---

## 🌱 Why energy-aware builds?

Software doesn't exist in a vacuum.

Every build consumes CPU time, memory, storage I/O, and electricity. This becomes particularly interesting when the same pipeline runs repeatedly in CI/CD environments.

A small improvement to a build process can therefore have a much larger effect when multiplied across:

- developers
- pull requests
- CI jobs
- deployment pipelines
- large projects

This project is an attempt to make that cost a little easier to see.

---

## 🔮 What's next?

Some things we'd like to explore:

- [ ] More accurate energy estimation
- [ ] Support for different build systems
- [ ] CI/CD integration
- [ ] Build history and comparison
- [ ] Per-stage energy analysis
- [ ] Better optimization suggestions
- [ ] Dashboard and visualization
- [ ] Hardware-aware measurements
- [ ] Team/project-level statistics

There is plenty of room to experiment here.

---

## 🤝 Contributing

Found something interesting?

Have an idea for improving the measurement model?

Want to support another build system?

Contributions are welcome.

Before opening a large pull request, feel free to open an issue and discuss the idea first. It makes things easier for everyone.

---

## 📜 License

This project is licensed under the **MIT License**.

See [`LICENSE`](LICENSE) for details.

---

## ❤️ A little note

This started from a fairly simple idea:

> **If we can measure the cost of building software, maybe we can build software a little more thoughtfully.**

It's still an evolving project, and some of the measurements are estimates rather than laboratory-grade energy readings.

That's okay.

The goal is to learn, experiment, and make build efficiency something developers can actually see.

---

**Built with curiosity ⚡**
