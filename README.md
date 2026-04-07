<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-%3E%3D3.0-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Material_Design-3-6750A4?style=for-the-badge&logo=materialdesign&logoColor=white" alt="Material 3"/>
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License"/>
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-lightgrey?style=for-the-badge" alt="Platform"/>
</p>

<h1 align="center">
  🏥 HealthPulse
</h1>

<p align="center">
  <strong>A premium, data-driven Health & Fitness Tracker built with Flutter & Material Design 3</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.0-blue?style=flat-square" alt="Version"/>
  <img src="https://img.shields.io/badge/build-passing-brightgreen?style=flat-square" alt="Build"/>
  <img src="https://img.shields.io/badge/fl__chart-0.66.2-teal?style=flat-square" alt="fl_chart"/>
  <img src="https://img.shields.io/badge/google__fonts-6.1.0-red?style=flat-square" alt="Google Fonts"/>
  <img src="https://img.shields.io/badge/code_style-flutter__lints-blue?style=flat-square" alt="Lints"/>
</p>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Architecture](#-architecture)
- [Tech Stack](#-tech-stack)
- [Module Breakdown](#-module-breakdown)
- [Data Flow](#-data-flow)
- [Screen Dependency Graph](#-screen-dependency-graph)
- [Widget Composition Tree](#-widget-composition-tree)
- [Performance Metrics](#-performance-metrics)
- [Getting Started](#-getting-started)
- [Project Structure](#-project-structure)
- [Roadmap](#-roadmap)

---

## 🔭 Overview

**HealthPulse** is a cross-platform health & fitness tracking application designed with a focus on immersive dark-teal UI, real-time data visualization via `fl_chart`, and a buttery-smooth navigation experience. It tracks steps, calories, heart rate, workout duration, and user profile metrics — all wrapped in a modern glassmorphism-inspired design.

---

## 🏗 Architecture

```mermaid
graph TB
    subgraph Presentation["🖥️ Presentation Layer"]
        MA[MaterialApp<br/>Theme · Routes]
        MN[MainNavigation<br/>StatefulWidget]
        HS[HomeScreen<br/>StatelessWidget]
        WL[WorkoutListScreen<br/>StatelessWidget]
        SS[StatisticScreen<br/>StatefulWidget]
        PS[ProfileScreen<br/>StatefulWidget]
    end

    subgraph Charting["📊 Charting Engine"]
        BC[BarChart<br/>fl_chart]
        LC[LineChart<br/>fl_chart]
    end

    subgraph Design["🎨 Design System"]
        M3[Material Design 3]
        GF[Google Fonts — Inter]
        GM[Glassmorphism Layer<br/>opacity · blur · borders]
    end

    MA --> MN
    MN -->|index 0| HS
    MN -->|index 1| WL
    MN -->|index 2| SS
    MN -->|index 3| PS

    SS --> BC
    SS --> LC

    HS --> GM
    SS --> GM
    PS --> GM

    MA --> M3
    MA --> GF

    style Presentation fill:#1E3330,stroke:#4CAF50,color:#fff
    style Charting fill:#0D2926,stroke:#00BCD4,color:#fff
    style Design fill:#2D4A47,stroke:#FF8C42,color:#fff
```

---

## ⚙️ Tech Stack

```mermaid
pie title Dependency Composition
    "Flutter SDK"        : 40
    "fl_chart"           : 25
    "google_fonts"       : 15
    "cupertino_icons"    : 10
    "flutter_lints"      : 10
```

| Layer | Technology | Purpose |
|-------|-----------|---------|
| **Framework** | Flutter 3.x / Dart ≥3.0 | Cross-platform UI toolkit |
| **Theming** | Material Design 3 | Adaptive design tokens |
| **Typography** | Google Fonts (`Inter`) | Premium typeface |
| **Charts** | `fl_chart ^0.66.2` | Bar charts, line charts, touch interactions |
| **Icons** | `cupertino_icons ^1.0.2` | iOS-style icon set |
| **Linting** | `flutter_lints ^3.0.0` | Static analysis & code quality |

---

## 📦 Module Breakdown

```mermaid
graph LR
    subgraph main.dart
        A1[HealthApp<br/>MaterialApp Config]
        A2[MainNavigation<br/>Bottom Nav Controller]
        A3[WorkoutListScreen<br/>Placeholder]
    end

    subgraph home_screen.dart
        B1[_buildTopBar]
        B2[_buildWelcomeText]
        B3[_buildSearchBar]
        B4[_buildStatsRow<br/>Steps · Calories · Weight]
        B5[_buildWorkoutCard<br/>Exercise Summary]
    end

    subgraph statistic_screen.dart
        C1[_buildTabRow<br/>Steps · Heart · Regularity]
        C2[_buildChartCard<br/>BarChart — Weekly Steps]
        C3[_buildHeartRateCard<br/>LineChart — BPM]
        C4[_buildSmallStatCard<br/>Calories · Duration]
    end

    subgraph profile_screen.dart
        D1[_buildProfileCard<br/>Avatar · Stats]
        D2[_buildSettingsGroup<br/>Account Settings]
        D3[_buildSettingsGroup<br/>Preferences]
    end

    A2 --> B1
    A2 --> C1
    A2 --> D1

    style main.dart fill:#1E3330,stroke:#4CAF50,color:#fff
    style home_screen.dart fill:#2D4A47,stroke:#FF8C42,color:#fff
    style statistic_screen.dart fill:#0D2926,stroke:#00BCD4,color:#fff
    style profile_screen.dart fill:#3D5E5A,stroke:#E91E63,color:#fff
```

---

## 🔄 Data Flow

```mermaid
sequenceDiagram
    participant User
    participant MainNav as MainNavigation
    participant Screen as Active Screen
    participant Chart as fl_chart Engine

    User->>MainNav: Tap bottom nav item
    MainNav->>MainNav: setState(index)
    MainNav->>Screen: Render _screens[index]
    
    alt StatisticScreen
        Screen->>Screen: _selectedTab state
        Screen->>Chart: BarChartData / LineChartData
        Chart-->>Screen: Rendered SVG Canvas
    end

    alt ProfileScreen
        Screen->>Screen: _soundEnabled toggle
        Screen-->>User: Switch state update
    end

    Screen-->>User: Rendered Frame (16ms)
```

---

## 🕸 Screen Dependency Graph

```mermaid
graph TD
    MAIN["main.dart<br/>Entry Point"]
    NAV["MainNavigation"]
    
    HOME["HomeScreen<br/>━━━━━━━━━━━━━<br/>📊 Stats Cards<br/>🏋️ Workout Card<br/>🔍 Search Bar"]
    
    WORKOUT["WorkoutListScreen<br/>━━━━━━━━━━━━━<br/>📝 Placeholder"]
    
    STATS["StatisticScreen<br/>━━━━━━━━━━━━━<br/>📊 BarChart (Steps)<br/>💓 LineChart (HR)<br/>🔥 Calorie Card<br/>⏱ Duration Card"]
    
    PROFILE["ProfileScreen<br/>━━━━━━━━━━━━━<br/>👤 Profile Card<br/>⚙️ Account Settings<br/>🎛 Preferences"]

    FL["fl_chart<br/>v0.66.2"]
    GFONT["google_fonts<br/>v6.1.0"]

    MAIN --> NAV
    NAV --> HOME
    NAV --> WORKOUT
    NAV --> STATS
    NAV --> PROFILE

    STATS -.->|BarChart + LineChart| FL
    MAIN -.->|Inter typeface| GFONT

    style MAIN fill:#FF8C42,stroke:#fff,color:#fff
    style NAV fill:#1E3330,stroke:#4CAF50,color:#fff
    style HOME fill:#2D4A47,stroke:#FF8C42,color:#fff
    style WORKOUT fill:#2D4A47,stroke:#9E9E9E,color:#fff
    style STATS fill:#0D2926,stroke:#00BCD4,color:#fff
    style PROFILE fill:#3D5E5A,stroke:#E91E63,color:#fff
    style FL fill:#006064,stroke:#00BCD4,color:#fff
    style GFONT fill:#B71C1C,stroke:#EF5350,color:#fff
```

---

## 🌳 Widget Composition Tree

```mermaid
graph TD
    MA[MaterialApp] --> MN[MainNavigation]
    MN --> SC[Scaffold]
    SC --> BODY["_screens&#91;index&#93;"]
    SC --> BNB[BottomNavigationBar<br/>Custom AnimatedContainer]

    BODY --> HS[HomeScreen]
    BODY --> SS[StatisticScreen]
    BODY --> PS[ProfileScreen]

    HS --> TB[TopBar<br/>Logo · Icons · Avatar]
    HS --> WT[WelcomeText<br/>RichText]
    HS --> SB[SearchBar<br/>Glassmorphic Input]
    HS --> SR[StatsRow<br/>Horizontal ListView]
    SR --> SC1["StatCard<br/>Steps: 5400<br/>⬤ 54%"]
    SR --> SC2["StatCard<br/>Calories: 312<br/>⬤ 62%"]
    SR --> SC3["StatCard<br/>Weight: 312<br/>⬤ 70%"]
    HS --> WC[WorkoutCard<br/>Upper Body · 16 ex]

    SS --> TAB[TabRow<br/>Steps · Heart · Regularity]
    SS --> CHART[ChartCard<br/>BarChart · 7 days]
    SS --> GRID[WorkoutGrid]
    GRID --> HRC["HeartRateCard<br/>LineChart · 120 BPM"]
    GRID --> CAL["CaloriesCard<br/>143 kcal"]
    GRID --> DUR["DurationCard<br/>130 min"]

    PS --> PC[ProfileCard<br/>Avatar · Name · Location]
    PS --> AS[AccountSettings<br/>3 items]
    PS --> PR[Preferences<br/>2 items]

    style MA fill:#FF8C42,stroke:#fff,color:#fff
    style HS fill:#2D4A47,stroke:#FF8C42,color:#fff
    style SS fill:#0D2926,stroke:#00BCD4,color:#fff
    style PS fill:#3D5E5A,stroke:#E91E63,color:#fff
```

---

## 📈 Performance Metrics

```mermaid
xychart-beta
    title "Lines of Code per Module"
    x-axis ["main.dart", "home_screen", "statistic_screen", "profile_screen"]
    y-axis "Lines of Code" 0 --> 500
    bar [145, 381, 445, 303]
```

```mermaid
xychart-beta
    title "Widget Count per Screen"
    x-axis ["Home", "Workout", "Statistics", "Profile"]
    y-axis "Widgets" 0 --> 30
    bar [22, 3, 24, 18]
```

### Codebase Statistics

| Metric | Value |
|--------|-------|
| **Total Dart Files** | 5 |
| **Total Lines of Code** | ~1,274 |
| **Screens** | 4 (Home, Workout, Statistics, Profile) |
| **StatefulWidgets** | 3 |
| **StatelessWidgets** | 3 |
| **Chart Instances** | 2 (BarChart + LineChart) |
| **Custom Widget Builders** | 18 |
| **Animation Controllers** | 4 (AnimatedContainer transitions) |
| **Color Palette Size** | 8 primary tokens |

---

## 🚀 Getting Started

### Prerequisites

```
Flutter SDK ≥ 3.0.0
Dart SDK ≥ 3.0.0
```

### Installation

```bash
# Clone the repository
git clone https://github.com/SahilParbale/startup1.git
cd startup1

# Install dependencies
flutter pub get

# Run on connected device / emulator
flutter run
```

### Build Targets

```bash
# Android APK
flutter build apk --release

# iOS (macOS only)
flutter build ios --release

# Web
flutter build web --release
```

---

## 📂 Project Structure

```
health_app/
├── lib/
│   ├── main.dart                  # App entry, theme, navigation shell
│   └── screens/
│       ├── home_screen.dart       # Dashboard — stats, workout cards
│       ├── statistic_screen.dart  # Charts — bar (steps), line (HR)
│       └── profile_screen.dart    # User profile & settings
├── pubspec.yaml                   # Dependencies & metadata
├── .gitignore                     # Flutter-standard ignores
└── README.md                      # ← You are here
```

---

## 🗺 Roadmap

```mermaid
gantt
    title Development Roadmap
    dateFormat  YYYY-MM-DD
    
    section Phase 1 — MVP
    UI Screens & Navigation        :done,    p1a, 2025-10-01, 14d
    fl_chart Integration           :done,    p1b, 2025-10-08, 10d
    Profile & Settings             :done,    p1c, 2025-10-15, 7d
    
    section Phase 2 — Data Layer
    Local Storage (Hive/SQLite)    :active,  p2a, 2025-11-01, 14d
    Health API Integration         :         p2b, after p2a, 14d
    Real-time Sensor Data          :         p2c, after p2b, 10d
    
    section Phase 3 — Intelligence
    ML Step Prediction             :         p3a, 2026-01-01, 21d
    Personalized Insights          :         p3b, after p3a, 14d
    Social & Leaderboards          :         p3c, after p3b, 14d
    
    section Phase 4 — Polish
    Animations & Micro-interactions:         p4a, 2026-03-01, 10d
    Accessibility (a11y)           :         p4b, after p4a, 7d
    App Store Release              :crit,    p4c, after p4b, 7d
```

---

## 🎨 Design System

| Token | Hex | Usage |
|-------|-----|-------|
| `bg-primary` | `#2D4A47` | Scaffold background |
| `bg-deep` | `#1E3330` | Bottom nav, card accents |
| `bg-surface` | `#3D5E5A` | Gradient start, profile |
| `accent-orange` | `#FF8C42` | Step progress ring |
| `accent-red` | `#FF5722` | Calorie progress ring |
| `accent-green` | `#4CAF50` | Weight progress ring |
| `accent-teal` | `tealAccent` | Heart rate chart line |
| `text-primary` | `#FFFFFF` | Headings, values |
| `text-secondary` | `rgba(255,255,255,0.6)` | Labels, subtitles |
| `glassmorphism` | `rgba(255,255,255,0.12)` | Card backgrounds |

---

<p align="center">
  <img src="https://img.shields.io/badge/Made_with-Flutter-02569B?style=for-the-badge&logo=flutter" alt="Made with Flutter"/>
  <img src="https://img.shields.io/badge/Crafted_by-SahilParbale-FF8C42?style=for-the-badge&logo=github" alt="Author"/>
</p>

<p align="center">
  <sub>Built with ❤️ using Flutter & Dart</sub>
</p>
