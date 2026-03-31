<div align="center">

<br/>

```
████████╗██████╗  █████╗  ██████╗██╗  ██╗███╗   ███╗███████╗
╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝████╗ ████║██╔════╝
   ██║   ██████╔╝███████║██║     █████╔╝ ██╔████╔██║█████╗  
   ██║   ██╔══██╗██╔══██║██║     ██╔═██╗ ██║╚██╔╝██║██╔══╝  
   ██║   ██║  ██║██║  ██║╚██████╗██║  ██╗██║ ╚═╝ ██║███████╗ .apk
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
```

### *Your intelligent fitness companion — track, move, grow.*

<br/>

[![Flutter](https://img.shields.io/badge/Flutter-3.19+-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.3+-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Enabled-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![License](https://img.shields.io/badge/License-MIT-6366f1?style=for-the-badge)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-black?style=for-the-badge&logo=apple&logoColor=white)](https://flutter.dev)
[![PRs Welcome](https://img.shields.io/badge/PRs-Welcome-4ade80?style=for-the-badge)](CONTRIBUTING.md)

<br/>

> **TrackMe** is a premium, production-grade Flutter fitness app built for people who are serious about their health. Real-time step tracking, AI-powered coaching, social challenges, sleep analytics, guided workouts, and a GitHub-style activity heatmap — all wrapped in a beautifully crafted UI that feels like it was designed at Apple.

<br/>

---

</div>

<br/>

## 📱 App Preview

<div align="center">

| Dashboard | Step Tracker | Activity Heatmap |
|:---------:|:------------:|:----------------:|
| Live step ring + greeting | Real-time pedometer | 26-week GitHub grid |

| Workout Builder | AI Coach | Social Challenges |
|:---------------:|:--------:|:-----------------:|
| Drag & drop sets | LLM-powered chat | Friend leaderboards |

</div>

<br/>

---

## ✨ Feature Overview

<br/>

### 🦶 Real-Time Step Tracking
- **Live pedometer** with animated step ring (custom painter)
- Background tracking — counts even when app is closed
- Daily / weekly / monthly history with fl_chart graphs
- Calorie burn estimation and distance calculation (km/miles toggle)
- Smart adaptive goals — auto-adjust based on 7-day rolling average
- **Home screen widget** showing live ring (via `home_widget`)
- Celebration confetti animation when goal is reached

<br/>

### 🔔 Smart Motivational Notifications
10 intelligent trigger categories, each with 10+ unique non-generic messages:

| Category | Trigger |
|----------|---------|
| 🌅 Morning | 6–8 AM daily tone-setter |
| 👟 Steps | At 25%, 50%, 75%, 90%, 100% of goal |
| 🎯 Goal Hit | Immediately on completion |
| 🔥 Streak | Day 3, 7, 14, 21, 30, 60, 100 |
| 🪑 Inactivity | After 90 min, 2 hr, 3 hr of no movement |
| 🏋️ Workout | 15 min before scheduled session |
| 🌙 Night | 9–10 PM if rings not closed |
| 📅 Weekly | Monday morning + Sunday recap |
| 💧 Hydration | Every 90 min during waking hours |
| 💡 Wisdom | Random daily quote at user-set time |

> Messages rotate using `SharedPreferences` index tracking — no repeated notifications until the full cycle completes.

<br/>

### 🏋️ Exercise & Workout Tracker
- Library of **50+ exercises** across cardio, strength, and flexibility
- Custom exercise creator with GIF/image support
- **Drag-and-drop** workout session builder
- Superset & circuit builder with per-block rest configuration
- Live workout mode:
  - Rep / set counter with voice countdown (`flutter_tts`)
  - Auto-starting rest timer between sets
  - Heart rate zone display
  - Exercise animation with pose guidance
- **Personal records (PR)** tracking with animated badge unlocks
- Full workout history with performance trend graphs

<br/>

### ⏱️ Timer Suite
- **Stopwatch** — lap tracking, split times, best/worst lap highlight, animated circular progress
- **Interval Timer** — work/rest configurator, presets: HIIT, Tabata, EMOM, AMRAP
- **Countdown Timer** — urgency animation as time runs out, custom presets
- **Rest Timer** — auto-starts between exercise sets
- **Jump Rope Counter** — accelerometer + mic detection for contactless counting

<br/>

### 📊 GitHub-Style Activity Heatmap

```
Oct      Nov      Dec      Jan      Feb      Mar
■ ■ □ ■ ■ ■ □ ■ ■ ■ ■ □ ■ ■ ■ ■ □ ■ ■ ■ ■ ■ ■ ■ ■ ■
□ ■ ■ ■ □ ■ ■ ■ ■ □ ■ ■ ■ ■ ■ □ ■ ■ ■ ■ ■ □ ■ ■ ■ ■
■ ■ ■ □ ■ ■ ■ ■ ■ ■ □ ■ ■ ■ ■ ■ ■ □ ■ ■ ■ ■ ■ ■ □ ■

Less ░ ▒ ▓ █ More
```

- **26 weeks × 7 days** grid of daily fitness activity
- 5 intensity levels from empty → goal achieved (glowing purple)
- Today's cell updates **live** as steps accumulate
- Tap any past cell → bottom sheet with full day stats
- Long-press today → see live step rate (steps/hr)
- Streak stats row: current streak 🔥 · total active days · completion rate %
- Persisted in Hive, exportable as CSV

<br/>

### 🏅 Gamification & XP System

| Level | Title | XP Required |
|-------|-------|-------------|
| 1 | 🥉 Rookie | 0 |
| 2 | 🥈 Contender | 500 |
| 3 | 🥇 Athlete | 1,500 |
| 4 | 🏆 Champion | 3,500 |
| 5 | ⚡ Elite | 7,000 |
| 6 | 👑 Legend | 12,000 |

**XP Sources:** Goal hit (+50) · Workout completed (+100) · Streak milestone (+200) · Challenge win (+500)

**Achievement Badges:** First Workout · 7-Day Streak · 10k Steps · Night Owl · Early Bird · Iron Will · Century Club — each with a Lottie unlock animation and shareable card.

<br/>

### 👥 Social & Challenges
- **Friend challenges** — invite via deep link, compete on steps for 7/14/30 days
- **Global leaderboard** — filter by city, country, or worldwide (Firebase Realtime)
- **Team challenges** — squads of up to 10, pooled step totals vs other teams
- Share achievement cards to Instagram, WhatsApp, Twitter

<br/>

### 🤖 AI & Smart Features
- **AI Workout Plan Generator** — input goal + days/week + equipment → structured weekly plan
- **Smart Calorie Estimator** — photo a meal → vision AI estimates macros & calories
- **AI Form Checker** — ML Kit pose detection for squats and push-ups with real-time feedback
- **Personalized Recovery Suggestions** — based on workout intensity + sleep score + HRV
- **Adaptive Goals** — auto-adjust daily step goal, never more than 10% jump per week
- **AI Coach Chat** — in-app LLM chat for fitness questions, plan adjustments, motivation

<br/>

### 😴 Health & Biometric Tracking
- **Sleep tracking** with score breakdown (deep / light / REM)
- **Heart rate zones** — resting, fat burn, cardio, peak (Apple Health + Google Fit)
- **SpO2 monitor** integration via Health package
- **Menstrual cycle tracker** with symptom logging
- **Posture reminder** — phone tilt detection after 20 min of slouching
- **Body metrics log** — weight, waist, chest, arms, hips with trend charts
- **Mood tracking** — 5-emoji scale post-workout, correlated with activity charts
- **Stress score** — HRV-based gauge (low / moderate / high) with 30-day trend

<br/>

### 🧘 Mindset & Wellness
- **Daily gratitude journal** — 3 nightly prompts, weekly reflections, searchable history
- **Guided meditation** — 10 audio sessions with 5-min focused breathwork
- **Breathing exercises** — box breathing, 4-7-8, Wim Hof with animated visual guide
- **Focus mode** — DND wrapper during workouts, auto-disables on completion
- **Vision board** — fitness goal images + affirmations shown on app open
- **Weekly mental health check-in** — 5-question mood survey with trend graph

<br/>

### 🏃 Movement Tracking
- **Running pace tracker** — GPS route map, live pace, split times per km/mile, elevation chart
- **Cycling route mapper** — GPX import/export, full route history
- **Yoga & guided stretching** — 20+ sessions with illustrated pose cards and hold timers
- **Jump rope counter** — contactless via accelerometer + microphone

<br/>

### ⚙️ Platform & Utility
- 🍎 **Apple Watch companion** — live step glance, start/stop workout, heart rate
- ⌚ **WearOS companion** — equivalent core glance features
- 🗣️ **Siri Shortcuts** — "Hey Siri, start my workout in TrackMe"
- 🤖 **Google Assistant Actions** — equivalent voice shortcut support
- 📳 **NFC gym check-in** — tap tag to auto-start workout + log gym visit
- 📷 **Barcode scanner** — scan supplements → auto-fill macros from Open Food Facts API
- 📡 **Offline mode** — full local functionality, background sync on reconnect
- 🎙️ **Voice commands** during workout — "next exercise", "skip rest", "how many reps"

<br/>

---

## 🎨 Design System

TrackMe is designed to feel like a **top-tier App Store featured app** — every pixel is intentional.

### Theme Engine — 6 Premium Palettes

| Theme | Style | Background | Accent |
|-------|-------|------------|--------|
| 🌑 Midnight | Dark navy + electric blue | `#0f0f14` | `#6366f1` |
| 🔥 Ember | Dark + orange/red | `#1a0a00` | `#fb923c` |
| 🌿 Forest | Deep green + mint | `#0a1a0f` | `#4ade80` |
| 🧊 Arctic | Pure white + ice blue | `#f8fafc` | `#38bdf8` |
| 🌸 Rose Gold | Warm neutrals + rose | `#1a1015` | `#f43f5e` |
| 🟣 Void | AMOLED black + neon purple | `#000000` | `#a78bfa` |

### Typography
- **Display:** Clash Display / Syne — hero numbers and screen headings
- **Body:** Plus Jakarta Sans — all UI text and labels
- **Weights:** 300 Light · 500 Medium · 700 Bold · 800 ExtraBold

### Component Rules
- Cards: 20px radius · subtle gradient or glassmorphism · colored shadows
- Buttons: 56px height · full-width gradient · spring physics on tap
- Progress: Custom painters only — no `LinearProgressIndicator` ever
- All stats: animated count-up numbers on screen enter
- Navigation: floating pill with blur backdrop, sliding indicator

### Animations
- Hero transitions between all screens
- Staggered list item reveals with configurable delay
- Confetti burst on goal completion
- Lottie for empty states, celebrations, badge unlocks
- Shimmer loading skeletons throughout

<br/>

---

## 🧱 Architecture

TrackMe follows **Clean Architecture** with clear separation of concerns:

```
lib/
├── core/
│   ├── theme/              # Theme engine — 6 palettes, color tokens, typography
│   ├── router/             # go_router config + custom page transitions
│   ├── utils/              # Formatters, validators, extensions
│   └── constants/          # Exercise data, notification copy, app constants
│
├── features/
│   ├── onboarding/         # Animated onboarding + permission request flows
│   ├── dashboard/          # Home screen + heatmap + floating nav
│   ├── steps/              # Real-time step tracker screen
│   ├── workout/            # Library + builder + live workout + AI plan
│   ├── timer/              # Stopwatch + interval + countdown + jump rope
│   ├── sleep/              # Sleep tracking + score + HRV analytics
│   ├── nutrition/          # Food diary + barcode scanner + AI estimator
│   ├── social/             # Friends + challenges + leaderboard + XP
│   ├── ai_coach/           # Chat interface + workout plan generator
│   ├── wellness/           # Journal + meditation + mood + vision board
│   ├── profile/            # Stats + badges + achievements
│   └── settings/           # All settings + theme picker
│
├── shared/
│   ├── widgets/            # Reusable UI components
│   ├── models/             # Data models (Hive + Freezed)
│   └── services/           # Step, notification, health, AI, storage services
│
└── main.dart
```

### State Flow
```
UI Widgets
    ↕  (watch / read)
Riverpod Providers / AsyncNotifiers
    ↕  (call use cases)
Domain Use Cases
    ↕  (implement repositories)
Repository Interfaces
    ↕
Data Sources (Hive · Firestore · Health · REST APIs)
```

<br/>

---

## 📦 Tech Stack

### Core Framework
| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_riverpod` | ^2.5 | State management |
| `go_router` | ^13.0 | Navigation + deep linking |
| `hive` + `isar` | latest | Local database |
| `shared_preferences` | ^2.2 | Settings + notification tracking |
| `freezed` + `json_serializable` | latest | Immutable models |

### Health & Sensors
| Package | Version | Purpose |
|---------|---------|---------|
| `pedometer` | ^4.0 | Real-time step counting |
| `health` | ^10.0 | Apple Health + Google Fit |
| `geolocator` | ^11.0 | GPS for running/cycling |
| `google_ml_kit` | ^0.16 | Pose detection — AI form checker |
| `sensors_plus` | ^4.0 | Accelerometer for jump rope/posture |

### UI & Animation
| Package | Version | Purpose |
|---------|---------|---------|
| `fl_chart` | ^0.68 | Charts + activity graphs |
| `lottie` | ^3.0 | Celebration + badge animations |
| `flutter_animate` | ^4.5 | Micro-interactions + staggered reveals |
| `shimmer` | ^3.0 | Loading skeletons |
| `flutter_svg` | ^2.0 | SVG assets |
| `confetti` | ^0.7 | Goal completion confetti |

### Platform & Features
| Package | Version | Purpose |
|---------|---------|---------|
| `firebase_core` | ^2.27 | Firebase foundation |
| `cloud_firestore` | ^4.15 | Social features + leaderboard |
| `firebase_auth` | ^4.17 | User authentication |
| `flutter_local_notifications` | ^17.0 | Smart push notifications |
| `flutter_tts` | ^4.0 | Voice countdown in workouts |
| `speech_to_text` | ^6.6 | Voice commands |
| `mobile_scanner` | ^5.0 | Barcode scanning |
| `nfc_manager` | ^3.3 | NFC gym check-in |
| `home_widget` | ^0.5 | Home screen step ring widget |
| `watch_connectivity` | ^2.0 | Apple Watch + WearOS |
| `google_maps_flutter` | ^2.5 | Running/cycling route maps |
| `permission_handler` | ^11.3 | Runtime permissions |

<br/>

---

## 🚀 Getting Started

### Prerequisites

```bash
# Flutter SDK 3.19+
flutter --version

# Firebase CLI
npm install -g firebase-tools

# Check all dependencies
flutter doctor -v
```

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/trackme.git
cd trackme

# 2. Install dependencies
flutter pub get

# 3. Generate code (Freezed, Hive adapters)
dart run build_runner build --delete-conflicting-outputs

# 4. Configure Firebase
firebase login
flutterfire configure

# 5. Add your API keys
cp .env.example .env
# Edit .env with your keys (see below)

# 6. Run the app
flutter run

# Release builds
flutter build apk --release        # Android APK
flutter build appbundle --release  # Android App Bundle
flutter build ipa --release        # iOS
```

### Environment Variables

Create a `.env` file in the project root:

```env
# AI Features
AI_API_KEY=your_openai_or_gemini_key
AI_BASE_URL=https://api.openai.com/v1

# Maps
GOOGLE_MAPS_API_KEY=your_maps_api_key

# Nutrition
OPEN_FOOD_FACTS_BASE_URL=https://world.openfoodfacts.org

# Firebase (auto-generated by flutterfire configure)
FIREBASE_PROJECT_ID=your_project_id
```

### Running Tests

```bash
# Unit tests
flutter test

# Widget tests
flutter test test/widget_test.dart

# Integration tests
flutter test integration_test/

# Coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

<br/>

---

## 📋 Roadmap

### Completed ✅
- [x] Real-time step tracking with animated ring
- [x] Motivational notification system (10 categories, 100+ messages)
- [x] Exercise library + drag-and-drop workout builder
- [x] Timer suite (stopwatch, interval, countdown, jump rope)
- [x] GitHub-style 26-week activity heatmap
- [x] Floating pill navigation bar with blur backdrop
- [x] 6-theme engine with animated transitions
- [x] Gamification — XP levels, achievement badges
- [x] Social challenges + global leaderboard
- [x] Sleep tracking + HRV + stress score
- [x] AI workout plan generator
- [x] AI form checker (ML Kit pose detection)
- [x] Barcode supplement scanner
- [x] NFC gym check-in
- [x] Apple Watch + WearOS companion apps
- [x] Voice commands during workout
- [x] Offline mode with background sync

### Coming Soon 🔜
- [ ] Flutter Web dashboard
- [ ] Wearable-only minimal mode
- [ ] Nutrition macro logging via voice input
- [ ] Community feed + public profiles
- [ ] Coach marketplace (book real human coaches)
- [ ] AR workout guidance (ARKit/ARCore)

<br/>

---

## 🤝 Contributing

Contributions are warmly welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting.

```bash
# 1. Fork the repository on GitHub

# 2. Create your feature branch
git checkout -b feature/amazing-feature

# 3. Make your changes and add tests

# 4. Commit using conventional commits
git commit -m 'feat: add amazing feature'
# Types: feat | fix | docs | style | refactor | test | chore

# 5. Push and open a Pull Request
git push origin feature/amazing-feature
```

Please follow the [Conventional Commits](https://www.conventionalcommits.org/) spec and make sure all tests pass before opening a PR.

<br/>

---

## 📄 License

```
MIT License — Copyright (c) 2026 TrackMe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

See [LICENSE](LICENSE) for the full text.

<br/>

---

## 🙏 Acknowledgements

- [Flutter](https://flutter.dev) — the world's best cross-platform framework
- [Firebase](https://firebase.google.com) — backend infrastructure
- [Riverpod](https://riverpod.dev) — reactive state management
- [fl_chart](https://pub.dev/packages/fl_chart) — beautiful Flutter charts
- [Lottie by Airbnb](https://airbnb.io/lottie/) — animation made easy
- [Open Food Facts](https://world.openfoodfacts.org) — free food database
- The entire Flutter open-source community 💙

<br/>

---

<div align="center">

**Built with 💜 in Flutter**

*If TrackMe helped you move more, consider giving it a ⭐ on GitHub — it means the world.*

<br/>

[![GitHub stars](https://img.shields.io/github/stars/yourusername/trackme?style=social)](https://github.com/yourusername/trackme)
[![Twitter Follow](https://img.shields.io/twitter/follow/trackmeapp?style=social)](https://twitter.com/trackmeapp)

<br/>

```
Track every step.
Build every habit.
Become your best self.
```

</div>
